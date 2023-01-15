`timescale 1ns / 1ps

module tb_day1;
  
  wire [7:0] y_o;
  reg [7:0] a_i, b_i;
  reg sel_i;
  
  day1 DUT(.y_o(y_o), .a_i(a_i), .b_i(b_i), .sel_i(sel_i));
  
  initial begin
    // Initialize inputs
    a_i = 8'b0000_0001;
    b_i = 8'b0000_0001;
    sel_i = 1'b0;
    
    // Wait for 100 ns
    #100;
    
    // Change input values
    a_i = 8'b1111_1111;
    b_i = 8'b1111_1111;
    sel_i = 1'b1;
    
    // Wait for 100 ns
    #100;
    
    // Change input values
    a_i = 8'b0000_0000;
    b_i = 8'b0000_0000;
    sel_i = 1'b0;
    
    // Wait for 100 ns
    #100;
    
    // Finish simulation
    $finish;
  end
  
  always @(a_i or b_i or sel_i) begin
    $display("At time %t, a_i = %b, b_i = %b, sel_i = %b, y_o = %b", $time, a_i, b_i, sel_i, y_o);
  end
 
  initial begin
    $dumpfile("day1.vcd");
    $dumpvars();
  end

  
  
endmodule
