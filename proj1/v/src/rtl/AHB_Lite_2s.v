// AHB_Lite_2s Module
// (c) 2013-12-19 by Aparna Mohan


module AHB_Lite_2s( HCLK, 
    HRESETn, 
    HADDR,              //input, from master1
    HBURST,             //not used
    //HBUSREQ,          //master1 doesn't have signal
    HMASTLOCK,          //not used
    HPROT,              //not used
    HSIZE,              //input, from master1
    HTRANS,             //input, from master1
    HWDATA,             //input, from master1
    HWRITE,             //input, high if write, from master1
    //hgrant,           //output, would go to master1 if it wasn't ahb-lite
    hsel_s1,           //output, high if s1 selected
    hready_resp_s1,     //input, from s1, transfer status
    hresp_s1,           //input, from s1, transfer error message
    hrdata_s1,          //input, from s1, data
    hsel_s2,           //output, high if s2 selected
    hready_resp_s2,     //input, from s2, transfer status
    hresp_s2,           //input, from s2, transfer error message
    hrdata_s2,          //input, from s2, data
    haddr_s,              //output
    hburst_s,             //output
    hprot_s,              //output
    hsize_s,              //output
    htrans_s,             //output
    hwdata_s,             //output
    hwrite_s,             //output
    HREADY,             //output
    hresp_ahb,          //output
    HRDATA,             //output, to master1, read data
    hmaster,            //output, indicates which master has ownership of address and control bus
    hmaster_data,       //output, indicats whic master has ownership of data bus
    hmastlock_s);         //output, arbiter drives it to indicate locked transfer 
	
	
	
	
    input HCLK;
    input HRESETn; 
    input [31:0] HADDR;              //input, from master1
    input [2:0] HBURST;             //not used
    input HMASTLOCK;          //not used
    input [3:0] HPROT;              //not used
    input [2:0] HSIZE;              //input, from master1
    input [1:0] HTRANS;             //input, from master1
    input [31:0] HWDATA;             //input, from master1
    input HWRITE;             //input, high if write, from master1
    
    output hsel_s1;           //output, high if s1 selected
    input hready_resp_s1;     //input, from s1, transfer status
    input [1:0] hresp_s1;          //input, from s1, transfer error message not required
    input [31:0] hrdata_s1;          //input, from s1, data
    output hsel_s2;    //output, high if s2 selected
    input hready_resp_s2;     //input, from s2, transfer status
    input [1:0] hresp_s2;           //input, from s2, transfer error message not required
    input [31:0] hrdata_s2;          //input, from s2, data
    output [31:0] haddr_s;              //output
    output [2:0] hburst_s;             //output
    output [3:0] hprot_s;              //output
    output [2:0] hsize_s;//output
    output [1:0] htrans_s;             //output
    output [31:0] hwdata_s;             //output
    output hwrite_s;//output
    inout HREADY;             //output
    output [1:0] hresp_ahb;          //output
    output [31:0] HRDATA;             //output, to master1, read data
    output [3:0] hmaster;            //output, indicates which master has ownership of address and control bus
    output [3:0] hmaster_data;       //output, indicats whic master has ownership of data bus
    output hmastlock_s;         //output, arbiter drives it to indicate locke
	
	wire s1,s2;
	reg rdy;
	reg [31:0] rdata;
	reg sel1,sel2;
	
	assign haddr_s=HADDR;
	assign hburst_s=HBURST;
	assign hprot_s=HPROT;
	assign hsize_s=HSIZE;
	assign htrans_s=HTRANS;
	assign hwdata_s=HWDATA;
	assign hwrite_s=HWRITE;
	assign hresp_ahb=1'b0; //STUCK AT 0!!!
	assign hmastlock_s=1'b0;
	assign hmaster_data[1] = 1'b0;
	assign hmaster_data[2] = 1'b0;
	assign hmaster_data[3] = 1'b0;
	assign hmaster[1] = 1'b0;
	assign hmaster[2] = 1'b0;
	assign hmaster[3] = 1'b0;
	assign hmaster_data[0] = 1'b1;
	assign hmaster[0] = 1'b1;
	
	//DECODER IMPLEMENTED  : reset aync or async???
	
	always@(*)
	begin
		case(HADDR[31:28])
			4'b0000:sel1=1'b1;
			4'b0001:sel1=1'b1;
		default:sel1=1'b0;
		endcase
	end
	
	always@(*)
	begin
		case(HADDR[31:28])
			4'b0100:sel2=1'b1;
			4'b0101:sel2=1'b1;
		default:sel2=1'b0;
		endcase
	end

	assign s1=sel1;
	assign s2=sel2;
	
	/*always@(negedge HCLK or negedge HRESETn)
	begin
		if(!HRESETn) begin  //check functionality once more!!
			s1<=1'b0;
		end
		
		else begin
			
			s1<=sel1;
		end
	end

	always@(negedge HCLK or negedge HRESETn)
	begin
		if(!HRESETn) begin  //check functionality once more!!
			s2<=1'b0;
		end
		
		else begin
			
			s2<=sel2;
		end
	end */

	//MUX IMPLEMENTED  check for flipflop!
	/*always@(*)
	begin
		case({s1,s2})
			2'b01:rdy=hready_resp_s2;
			2'b10:rdy=hready_resp_s1;
		default:rdy=1'b1;
		endcase
	end */
	
	//read data based on HADDR,HBURST,HTRANS
	
	
	always@(*)
	begin
		case({s1,s2})
			2'b01:rdata=hrdata_s2;
			2'b10:rdata=hrdata_s1;
		default:rdata=32'b0;
		endcase
	end

	assign HREADY=hready_resp_s1;
	assign hsel_s1=s1;//si before;
	assign hsel_s2=s2;
	assign HRDATA=rdata;
	
endmodule
			
	
	
