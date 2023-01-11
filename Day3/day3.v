module day3 (rising_edge_o,falling_edge_o,a_i,reset,clk);
  input     clk,reset,a_i;
  output  reg  rising_edge_o,falling_edge_o;
 
reg a_ff;

always @(posedge clk or posedge reset) begin
    if (reset)
      a_ff <= 1'b0;
    else
      a_ff <= a_i;
end

assign rising_edge_o = ~a_ff & a_i;
assign falling_edge_o = a_ff & ~a_i;

endmodule