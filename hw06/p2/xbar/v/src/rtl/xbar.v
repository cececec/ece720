
`include "xbar_defs.v"

//Logic Gates Version

module xbar (clk, reset, in, req, out, valid);

	parameter XbarWidth = `NUMWIDTH;
	parameter XbarOutputs = `NUMOUTPUTS;
	parameter XbarInputs = `NUMINPUTS;
	
	input  clk;
	input  reset;
	input  [(XbarWidth*XbarInputs)-1:0] in;
	input  [(XbarOutputs*XbarInputs)-1:0] req;
	output [(XbarWidth*XbarOutputs)-1:0] out;
	output [XbarOutputs-1:0] valid;
	
	reg    [XbarOutputs-1:0] valid;
	reg    [(XbarWidth*XbarOutputs)-1:0] out;

	wire   [XbarOutputs-1:0] valid_wire;	
	wire   [(XbarWidth*XbarOutputs)-1:0] out_wire;
	wire   [XbarWidth-1:0] intermediate[0:XbarInputs-1][0:XbarOutputs-1];
	wire   [(XbarOutputs*XbarInputs)-1:0] anti_req;
	
	generate
		genvar i;
		genvar j;
		genvar k;
		
		for(j=0; j<XbarOutputs; j=j+1) begin : anti1
		 for(i=0; i<XbarInputs; i=i+1) begin : anti2
		   assign anti_req[j*XbarInputs+i] = req[i*XbarOutputs+j];
		   assign intermediate[i][j] = in[((i+1)*XbarWidth)-1:(i*XbarWidth)] & {XbarWidth{req[(i*XbarOutputs)+j]}};
		 end
		 assign valid_wire[j] = |anti_req[(j+1)*XbarInputs-1:j*XbarInputs];
		end
		
		for(j=0; j<XbarOutputs; j=j+1) begin : out1
		 for(k=0; k<XbarWidth; k=k+1) begin : out2
		  wire [XbarInputs-1:0] out_wire_j_k;
		  for(i=0; i<XbarInputs; i=i+1) begin : out3
		   assign out_wire_j_k[i] = intermediate[i][j][k];
		  end
		  assign out_wire[j*XbarWidth+k] = |out_wire_j_k;
		 end
		end
	
	for(j=0; j<XbarOutputs; j=j+1) begin : posedge1
	 always@(posedge clk) begin
	  if(reset) begin
	   out[(j+1)*XbarWidth-1:j*XbarWidth] <= 0;
	   valid[j] <= 0;
	  end
	  else begin
  	   valid[j] <= valid_wire[j];
	   if(valid_wire[j]) begin out[(j+1)*XbarWidth-1:j*XbarWidth] <= out_wire[(j+1)*XbarWidth-1:j*XbarWidth]; end
	   else begin out[(j+1)*XbarWidth-1:j*XbarWidth] <= out[(j+1)*XbarWidth-1:j*XbarWidth]; end
	  end
	 end
	end
	
endgenerate
	
endmodule

