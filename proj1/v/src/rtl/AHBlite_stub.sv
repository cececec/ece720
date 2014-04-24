

/* `include "AHB_defines.v" */

`define ITERATIONS 10000

module AHBlite_stub (

	/* AHB interface */
	input                             hclk,
	input                             hreset_n,
	input                             hready_i,
	input                             hresp_i,
	input  [31:0]                     hrdata_i,

	output [31:0]                     haddr_o,
	output [2:0]                      hburst_o,
	output [3:0]                      hprot_o,
	output [2:0]                      hsize_o,
	output [1:0]                      htrans_o,
	output [31:0]                     hwdata_o,
	output                            hmastlock_o,
	output                            hwrite_o
);


reg  [31:0]             addrQueue   [$];
reg                     addrQueue_empty;
reg  [4:0]              addrQueue_size;

/* {burst, prot, size, write} */
reg  [10:0]             ctrlQueue   [$];

reg  [31:0]             wDataQueue  [$];

reg                     pReadyQueue [$];

reg  [2:0]              randType;
reg  [21:0]             randAddr;
reg                     randWrite;
integer                 randCount;




task ahb_read; // Burst read (currently works for INCR4, INCR8, and INCR16 transactions)
   input [31:0] addr;
   input [2:0] size;
   addrQueue.push_back(addr);
   ctrlQueue.push_back({size, 4'b0000, `WORD, 1'h0});
   pReadyQueue.push_back(1'h0);
endtask

task ahb_write; // Burst write (currently works for INCR4, INCR8, and INCR16 transactions)
   input [31:0] addr;
   input [2:0] size;
   addrQueue.push_back(addr);
   ctrlQueue.push_back({size, 4'b0000, `WORD, 1'h1});
   pReadyQueue.push_back(1'h0);
endtask

/* Stub Behavior
 * Use the ahb_write() and ahb_read() tasks to initiate AHB write and read transactions.
 * It can take 100-300 cycles for the DW_memctl module to initialize, so be sure to let the
 * simulation last long enough to see the transactions happening.
 */

initial
  begin
   #11000;                   // Wait for memory controller to come out of reset
   for (randCount = 0; randCount < `ITERATIONS; randCount = randCount+1)
     begin
     randWrite=$random;  randAddr=$random;  randType=$random;
     while ((randType != `INCR4) && (randType != `INCR8) 
             && (randType != `INCR16)) randType=$random;
     if (randWrite)
       ahb_write({randAddr,2'b00},randType);
     else
       ahb_read({randAddr,2'b00},randType);
     end

   ahb_read(32'hFFFFFFFF,`INCR8);

   wait(haddr_o == 32'hFFFFFFFF) $finish;

end




always_comb
begin
	addrQueue_size  = addrQueue.size();

	if (addrQueue.size() == 0)
	begin
		addrQueue_empty    = 1'h1;
	end

	else
	begin
		addrQueue_empty    = 1'h0;
	end
end

/*****************************************/


/*****************************************/
/* Generate requests from the queues     */
reg  [31:0]                         reqAddr;
reg  [2:0]                          reqBurst;
reg  [3:0]                          reqProt;
reg  [2:0]                          reqSize;
reg                                 reqWrite;

reg                                 hRReq;
reg                                 hWReq;
wire                                popAddrQ;


/* Implement first-word-fall-through for addrQueue and ctrlQueue */
always_comb
begin
	if (!addrQueue_empty)
	begin
		reqAddr                                = addrQueue[0];
		{reqBurst, reqProt, reqSize, reqWrite} = ctrlQueue[0];
	end

	else
	begin
		reqAddr                                = 32'h0;
		{reqBurst, reqProt, reqSize, reqWrite} = 11'h0;
	end
end

assign hRReq          = !reqWrite && !addrQueue_empty;
assign hWReq          = reqWrite && !addrQueue_empty;

always @(posedge hclk)
begin
	if (popAddrQ)
	begin
		addrQueue.pop_front();
		ctrlQueue.pop_front();
	end
end


/*****************************************/



/*****************************************/
/*          AHB-Lite state machine       */

reg  [2:0]                          hState;
reg  [2:0]                          hState_next;

reg  [31:0]                         hAddr;
reg  [31:0]                         hAddr_next;

reg  [2:0]                          hBurst;
reg  [2:0]                          hBurst_next;

reg  [3:0]                          hProt;
reg  [3:0]                          hProt_next;

reg  [2:0]                          hSize;
reg  [2:0]                          hSize_next;

reg  [1:0]                          hTrans;
reg  [1:0]                          hTrans_next;

reg                                 hWrite;
reg                                 hWrite_next;

reg  [7:0]                          bytes;
wire                                lastData;

reg                                 rData_push;
reg                                 rData_push_next;
reg                                 wData_pop;
reg                                 wData_pop_next;


localparam H_IDLE        = 3'h0;
localparam H_READ_START  = 3'h1;
localparam H_READ_SEQ    = 3'h2;
localparam H_READ_BUSY   = 3'h3;
localparam H_WRITE_START = 3'h4;
localparam H_WRITE_SEQ   = 3'h5;
localparam H_WRITE_BUSY  = 3'h6;
localparam H_LAST_DATA   = 3'h7;


always_comb
begin
	rData_push_next     = 1'h0;
	wData_pop_next      = 1'h0;

	case (hState)

		/* H_IDLE
		 * No transactions are occuring. Wait for hRReq or hWReq to go high,
		 * signaling a read or write request, respectively. */
		H_IDLE:
		begin
			if (hRReq)
			begin
				hState_next   = H_READ_START;

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;
				hTrans_next   = `NONSEQ;
				hWrite_next   = `READ;
			end

			else if (hWReq)
			begin
				hState_next   = H_WRITE_START;

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;
				hTrans_next   = `NONSEQ;
				hWrite_next   = `WRITE;
			end

			else
			begin
				hState_next   = H_IDLE;

				hAddr_next    = hAddr;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `IDLE;
				hWrite_next   = hWrite;
			end
		end

		/* H_READ_START
		 * Start a read transaction. Never spend more than one cycle in this state. */
		H_READ_START:
		begin
			rData_push_next = 1'h1;

			/* Burst transfer. Set up the next transfer. */
			if (hBurst)
			begin
				hState_next   = H_READ_SEQ;

				hAddr_next    = hAddr + bytes;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `SEQ;
				hWrite_next   = hWrite;
			end

			/* Single transfer. Set up the next request. */
			else
			begin
				hState_next   = H_LAST_DATA;

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;

				if (hRReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `READ;
				end

				else if (hWReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `WRITE;
				end

				else
				begin
					hTrans_next = `IDLE;
					hWrite_next = `READ;
				end
			end
		end

		H_READ_SEQ:
		begin
			rData_push_next = 1'h1;

			/* Last transfer. Set up the next request. */
			if (lastData)
			begin
				hState_next   = H_LAST_DATA;

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;

				if (hRReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `READ;
				end

				else if (hWReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `WRITE;
				end

				else
				begin
					hTrans_next = `IDLE;
					hWrite_next = `READ;
				end
			end

			/* Continue the burst. Set up the next transfer. */
			else
			begin
				hState_next   = H_READ_SEQ;

				hAddr_next    = hAddr + bytes;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `SEQ;
				hWrite_next   = hWrite;
			end
		end

		/* H_WRITE_START
		 * Start a write transaction. Never spend more than one cycle in this state. */
		H_WRITE_START:
		begin
			wData_pop_next  = 1'h1;

			/* Burst transfer. Set up the next transfer. */
			if (hBurst)
			begin
				hState_next   = H_WRITE_SEQ;

				hAddr_next    = hAddr + bytes;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `SEQ;
				hWrite_next   = hWrite;
			end

			/* Single transfer. Set up the next request. */
			else
			begin
				hState_next   = H_LAST_DATA;

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;

				if (hRReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `READ;
				end

				else if (hWReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `WRITE;
				end

				else
				begin
					hTrans_next = `IDLE;
					hWrite_next = `READ;
				end
			end
		end

		H_WRITE_SEQ:
		begin
			wData_pop_next  = 1'h1;

			/* Last transfer. Set up the next request. */
			if (lastData)
			begin
				hState_next   = H_LAST_DATA;

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;

				if (hRReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `READ;
				end

				else if (hWReq)
				begin
					hTrans_next = `NONSEQ;
					hWrite_next = `WRITE;
				end

				else
				begin
					hTrans_next = `IDLE;
					hWrite_next = `READ;
				end
			end

			/* Continue the burst. Set up the next transfer. */
			else
			begin
				hState_next   = H_WRITE_SEQ;

				hAddr_next    = hAddr + bytes;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `SEQ;
				hWrite_next   = hWrite;
			end
		end

		H_LAST_DATA:
		begin
			if (~|hAddr && hRReq)
			begin
				/* rData_push_next = 1'h1; */

				if (|reqBurst)
				begin
					hState_next = H_READ_START;
				end

				else
				begin
					hState_next = H_LAST_DATA;
				end

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;
				hTrans_next   = `NONSEQ;
				hWrite_next   = reqWrite;
			end

			/* Go to H_WRITE_SEQ when hready_i goes high if there's
			 * a write request waiting. */
			else if (~|hAddr && hWReq)
			begin
				/* wData_pop_next = 1'h1; */

				if (|reqBurst)
				begin
					hState_next = H_WRITE_START;
				end

				else
				begin
					hState_next = H_LAST_DATA;
				end

				hAddr_next    = reqAddr;
				hBurst_next   = reqBurst;
				hProt_next    = reqProt;
				hSize_next    = reqSize;
				hTrans_next   = `NONSEQ;
				hWrite_next   = reqWrite;
			end

			/* Go to H_READ_SEQ when hready_i goes high if there's
			 * a read request waiting. */
			else if (hRReq)
			begin
				rData_push_next = 1'h1;

				if (|reqBurst)
				begin
					hState_next = H_READ_SEQ;
				end

				else
				begin
					hState_next = H_LAST_DATA;
				end

				hAddr_next    = hAddr + bytes;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `SEQ;
				hWrite_next   = hWrite;
			end

			/* Go to H_WRITE_SEQ when hready_i goes high if there's
			 * a write request waiting. */
			else if (hWReq)
			begin
				wData_pop_next = 1'h1;

				if (|reqBurst)
				begin
					hState_next = H_WRITE_SEQ;
				end

				else
				begin
					hState_next = H_LAST_DATA;
				end

				hAddr_next    = hAddr + bytes;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `SEQ;
				hWrite_next   = hWrite;
			end

			/* Go to H_IDLE when hready_i goes high if there's
			 * no request waiting. */
			else
			begin
				hState_next   = H_IDLE;

				hAddr_next    = hAddr;
				hBurst_next   = hBurst;
				hProt_next    = hProt;
				hSize_next    = hSize;
				hTrans_next   = `IDLE;
				hWrite_next   = hWrite;
			end
		end

		default:
		begin
			hState_next     = hState;

			hAddr_next      = hAddr;
			hBurst_next     = hBurst;
			hProt_next      = hProt;
			hSize_next      = hSize;
			hTrans_next     = hTrans;
			hWrite_next     = hWrite;
		end
	endcase
end


always_ff @(posedge hclk)
begin
	if (~hreset_n)
	begin
		hState           <= H_IDLE;
		hAddr            <= 32'h0;
		hBurst           <= 3'h0;
		hProt            <= 4'h0;
		hSize            <= 3'h0;
		hTrans           <= 2'h0;
		hWrite           <= 1'h0;
	end

	else if (hready_i)
	begin
		hState           <= hState_next;
		hAddr            <= hAddr_next;
		hBurst           <= hBurst_next;
		hProt            <= hProt_next;
		hSize            <= hSize_next;
		hTrans           <= hTrans_next;
		hWrite           <= hWrite_next;
	end
end

assign haddr_o        = hAddr;
assign hburst_o       = hBurst;
assign hprot_o        = hProt;
assign hsize_o        = hSize;
assign htrans_o       = hTrans;
assign hmastlock_o    = 1'h0;
assign hwrite_o       = hWrite;

always_comb
begin
	case (hSize)
		3'h0: bytes = 1;
		3'h1: bytes = 2;
		3'h2: bytes = 4;
		3'h3: bytes = 8;
		3'h4: bytes = 16;
		3'h5: bytes = 32;
		3'h6: bytes = 64;
		3'h7: bytes = 128;
	endcase
end

/*****************************************/



/******************************************************/
/* Buffer the data going to/from the AHB interconnect */

reg  [31:0]             wData = 0;
reg  [3:0]              bursts;
reg  [3:0]              burstCounter = 0;

always @(posedge hclk)
begin
	reg  [31:0]           tmpData;
	if (hreset_n && hready_i)
	begin
		rData_push       <= rData_push_next;
		wData_pop        <= wData_pop_next;

		if (wData_pop)
		begin
			tmpData <= wDataQueue.pop_front();
		end
	end
end


/* Implement first-word-fall-through */
always @(*)
begin
	wData               = wDataQueue[0];
end


always @(posedge hclk)
begin
	if ((hTrans == `NONSEQ) && hready_i)
	begin
		burstCounter     <= bursts;
	end
	
	else if (|burstCounter && hready_i)
	begin
		burstCounter     <= burstCounter - 1;
	end
end


/* Only INCR4, INCR8 and INCR16 are implemented */
always_comb
begin
	case (hBurst)
		`INCR4:  bursts   = 4'd2;
		`INCR8:  bursts   = 4'd6;
		`INCR16: bursts   = 4'd14;
		default: bursts   = 4'd0;
	endcase
end


assign lastData       = (burstCounter == 4'd0) ? 1'h1 : 1'h0;
assign popAddrQ       = (burstCounter == 4'd1) ? 1'h1 : 1'h0;

assign hwdata_o       = wData;

/******************************************************/



/******************************************************/
/*             Join the read data together            */

reg  [255:0]                      rData;
reg  [2:0]                        rDataCounter;

always @(posedge hclk)
begin
	if (~hreset_n)
	begin
		rData                        <= 0;
		rDataCounter                 <= 0;
	end

	else if (hready_i && rData_push)
	begin
		rData[rDataCounter*32 +: 32] <= hrdata_i;
		rDataCounter                 <= rDataCounter + 1;
	end
end


reg                               pReady;
reg                               pReady_valid;

always_ff @ (posedge hclk)
begin

	/* Set either pready0_o or pready1_o high once the cache block is ready */
	if (rDataCounter == 3'd7)
	begin
		pReady                       <= pReadyQueue.pop_front();
		pReady_valid                 <= 1'h1;
	end

	else
	begin
		pReady                       <= 1'h0;
		pReady_valid                 <= 1'h0;
	end
end


	
endmodule


