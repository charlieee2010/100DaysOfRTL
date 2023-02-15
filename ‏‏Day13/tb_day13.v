module day13_tb();
  reg [3:0] a_i;
  reg [3:0] sel_i;
  wire y_ter_o;

  day13 DUT (
    .a_i(a_i),
    .sel_i(sel_i),
    .y_ter_o(y_ter_o)
  );

  initial begin
    // Test cases
    for (int i = 0; i < 16; i=i+1) begin
      a_i = i;
      sel_i = i % 4;
      #1;
      if (y_ter_o != (sel_i[0] ? a_i[0] :
                      sel_i[1] ? a_i[1] :
                      sel_i[2] ? a_i[2] :
                                 a_i[3]))
        $display("Test case %d failed: y_ter_o = %d", i, y_ter_o);
    end
    $display("All test cases passed!");
  end


   initial begin
      $dumpfile("day13.vcd");
      $dumpvars(0);
   end
endmodule

