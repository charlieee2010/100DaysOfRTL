module day2_tb;
   reg clk;
   reg reset;

   reg d_i;

   wire q_norst_o;
   wire q_syncrst_o;
   wire q_asyncrst_o;

   day2 DUT(
      .clk(clk),
      .reset(reset),
      .d_i(d_i),
      .q_norst_o(q_norst_o),
      .q_syncrst_o(q_syncrst_o),
      .q_asyncrst_o(q_asyncrst_o)
   );

   // Generate clk
   initial begin
    clk=1'b0;
   forever #5 clk = ~clk;  
   end 

   // Stimulus
   initial begin
      reset = 1'b1;
      d_i = 1'b0;
      #10;
      reset = 1'b0;
      #10;
      d_i = 1'b1;
      #20;
      reset = 1'b1;
      #20;
      reset = 1'b0;
      #20;
      $finish();
   end


endmodule