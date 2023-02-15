
module day15_tb;
  reg clk;
  reg reset;
  reg [3:0] req_i;
  wire [3:0] gnt_o;
  
  //Instantiate Design Under Test
  
 day15(.clk(clk),
 .reset(reset),
 .req_i(req_i), 
 .gnt_o(gnt_o));
  

  always #5 clk = ~clk;
  
  //Drive the DUT or Generate stimuli for the DUT
  
  initial begin
    clk = 1'b0000;
    reset = 1'b0000;
    req_i = 4'b0000;
    
    #5 reset = 1'b0001;
    
    @(negedge clk) req_i = 4'b1000;    
    
    @(negedge clk) req_i = 4'b1010;
    
    @(negedge clk) req_i = 4'b0010;
    
    @(negedge clk) req_i = 4'b0110;
    
    @(negedge clk) req_i = 4'b1110;
    
    @(negedge clk) req_i = 4'b1111;
    
    @(negedge clk) req_i = 4'b0100;
    
    @(negedge clk) req_i = 4'b0010;
    
    #5 reset = 0;
    
    #100 $finish;
	
  end
   initial begin
      $dumpfile("day15.vcd");
      $dumpvars(0);
   end
  
  endmodule 