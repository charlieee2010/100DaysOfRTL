module day3_tb;
  reg clk;
  reg reset;
  reg a_i;

  wire rising_edge_o;
  wire falling_edge_o;

  day3 DUT (
    .clk(clk),
    .reset(reset),
    .a_i(a_i),
    .rising_edge_o(rising_edge_o),
    .falling_edge_o(falling_edge_o)
  );

  initial begin
    clk = 0;
    reset = 1;
    a_i = 0;

    #10 reset = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    #30 a_i = 1;
    #70 a_i = 0;
    #200 $finish;
  end

  initial begin
    $monitor("Time: %t Rising Edge: %b Falling Edge: %b", $time, rising_edge_o, falling_edge_o);
  end

endmodule
