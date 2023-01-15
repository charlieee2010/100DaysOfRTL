
module tb_day5();
   reg clk;
   reg reset;
   wire [7:0] count;

   day5 dut(clk, reset, count);

   initial begin
      //Initialize inputs and waveform
      clk = 0;
      reset = 1;
      #10
      reset = 0;
      #10
      //Increment the counter 8 times
      repeat(8) begin
         clk = 1;
         #5
         clk = 0;
         #5
      end 
   end

   initial begin
      //Check if the count is correct
      if(count == 8'h8)
        $display("Test passed!");
      else
        $display("Test failed!");
      #10
      $finish;
   end
   initial begin
      $dumpfile("day5.vcd");
      $dumpvars();
   end
endmodule

