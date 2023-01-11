
module tb_day5();
   reg clk,reset;
   wire [7:0] count;

   day5 DUT(.clk(clk),.reset(reset),.count(count));

   initial begin
      clk = 0;
      reset = 1;
      #5;
      reset = 0;
      $monitor("time = %0d, count = %d",$time, count); //monitor the output
      forever #5 clk = ~clk;
   end
endmodule