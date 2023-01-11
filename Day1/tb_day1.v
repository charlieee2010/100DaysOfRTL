`timescale 1ns / 1ps
module tb_day1;
wire [7:0]y_o;
reg [7:0] a_i, b_;
reg sel_i;
day1 name(.Y_O(y_o), .A_I(a_i), .B_I(b_i), .SEL_I(sel_i));
initial
begin
a_i=1'b0;
b_i=1'b0;
sel_i=1'b0;
#100 $finish;
end
always #40 a_i=~a_i;
always #20 b_i=~b_i;
always #10 sel_i=~sel_i;
always@(a_i or b_i or sel_i)
$monitor("At time = %t, Output = %d", $time,y_o);
endmodule;