module tb_day6;
   reg clk;
   reg reset;
   reg x_i;
   wire [3:0] sr_o;

   day6 dut (
      .clk(clk),
      .reset(reset),
      .x_i(x_i),
      .sr_o(sr_o)
   );

   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end

  initial begin
    reset <= 1'b1;
    x_i <= 1'b0;
    #5;
    reset <= 1'b0;
    #5;
    for (int i=0; i<16; i=i+1) begin
      x_i <= $random%2;
      #10;
    end
    $finish();
  end

   initial begin
      $dumpfile("day6.vcd");
     $dumpvars();
end

endmodule

