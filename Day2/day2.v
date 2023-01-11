
module day2 (q_asyncrst_o,q_syncrst_o,q_norst_o,d_i,clk,reset);
  input     clk, reset,d_i;
  output  reg   q_norst_o,q_syncrst_o,q_asyncrst_o;

  // No reset
  always @(posedge clk)
    q_norst_o <= d_i;

  // Sync reset
  always @(posedge clk)
    if (reset)
      q_syncrst_o <= 1'b0;
    else
      q_syncrst_o <= d_i;

  // Async reset
  always @(posedge clk or posedge reset)
    if (reset)
      q_asyncrst_o <= 1'b0;
    else
      q_asyncrst_o <= d_i;

endmodule