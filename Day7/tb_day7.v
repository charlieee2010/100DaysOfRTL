
module tb_day7;
   reg clk;
   reg reset;
   wire [3:0] lfsr_o;

   day7 dut (
      .clk(clk),
      .reset(reset),
      .lfsr_o(lfsr_o)
   );
   
   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end

   initial begin
    reset <= 1'b1;
    #5
    reset <= 1'b0;
    #5
    for (int i=0; i<32; i=i+1)
      @(posedge clk);
    $finish();
  end

   initial begin
      $dumpfile("day7.vcd");
     $dumpvars();
end

endmodule

