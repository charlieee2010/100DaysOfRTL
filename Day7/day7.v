module day7 (
  input clk,
  input reset,
  
  output reg [3:0] lfsr_o
  );
  
  reg [3:0] lfsr_ff;
  reg [3:0] nxt_lsr;
  
  always@(posedge clk or posedge reset)
     if (reset)
	   lfsr_ff<=4'hE;  //to avoid the case where the LFSR starts with a zero value
	 else
	  lfsr_ff <= nxt_lfsr;

 assign nxt_lfsr = {lfsr_ff[2:0], lfsr_ff[1] ^ lfsr_ff[3]};
	   
 assign lfsr_o = lfsr_ff;

endmodule
