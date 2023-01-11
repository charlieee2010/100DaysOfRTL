

module day1 (y_o,a_i,b_i,sel_i);
  input   [7:0]a_i,b_i;
  input   sel_i;
  output  [7:0]y_o;



  assign y_o = sel_i ? a_i : b_i;

endmodule