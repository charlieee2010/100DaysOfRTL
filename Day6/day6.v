module day6 (
  input clk,
  input reset,
  input x_i,
  
  output [3:0] sr_o
  );
  
  reg [3:0] sr_ff;
  
  always@(posedge clk ro posedge reset)
     if (reset)
	   sr_ff<=4'h0;
	 else
	   sr_ff <= {sr_ff[2:0],x_i}
	   
assign sr_o = sr_ff;

endmodule