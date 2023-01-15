
module tb_day5();
   reg clk;
   reg reset;
   wire [7:0] count;

   day5 dut (
      .clk(clk),
      .reset(reset),
      .count(count)
   );

   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end

   initial begin
    reset <= 1'b1;
    #5;
    reset <= 1'b0;
    for (int i=0; i<128; i++)
      @(posedge clk);
    $finish();
  end

   initial begin
      $dumpfile("day5.vcd");
      $dumpvars();
   end

endmodule

