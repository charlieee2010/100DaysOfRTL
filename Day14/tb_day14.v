
module day14_tb();
  
  reg          clk;
  reg          rst;
  reg [3:0]    req_i;
  wire [3:0]   gnt_o;
  
  //Instantiate Design Under Test
  
  day14 DUT(
     
    .clk                 (clk), 
    .rst                 (rst), 
    .req_i               (req_i), 
    .gnt_o               (gnt_o)
  );
  

  always #5 clk = ~clk;
  

  
  initial begin
    clk = 0;
    rst = 0;
    req_i = 4'b0;
    // Assert the Asynchronous Reset after 1 clock period 

    #5 rst = 1;
    
    @(negedge clk) req_i = 4'b1000;    
    
    @(negedge clk) req_i = 4'b1010;
    
    @(negedge clk) req_i = 4'b0010;
    
    @(negedge clk) req_i = 4'b0110;
    
    @(negedge clk) req_i = 4'b1110;
    
    @(negedge clk) req_i = 4'b1111;
    
    @(negedge clk) req_i = 4'b0100;
    
    @(negedge clk) req_i = 4'b0010;
    
    #5 rst = 0;    
    #100 $finish;
  end  
   initial begin
 
    $dumpfile("day14.vcd");
    $dumpvars();
  end  
endmodule
    