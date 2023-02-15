module day11 (
input clk,
input reset,
input [3:0] parallel_i,
output empty_o,
output serial_o,
output valid_o
);

reg [3:0] shift_ff;
reg [3:0] nxt_shift;

always @(posedge clk or posedge reset)
if (reset)
shift_ff <= 4'h0;
else
shift_ff <= nxt_shift;


assign nxt_shift = empty_o ? parallel_i :
{1'b0, shift_ff[3:1]};

assign serial_o = shift_ff[0];

reg [2:0] count_ff;
reg [2:0] nxt_count;

always @(posedge clk or posedge reset)
if (reset)
count_ff <= 3'h0;
else
count_ff <= nxt_count;


assign nxt_count = (count_ff == 3'h4) ? 3'h0 :
count_ff + 3'h1;


assign valid_o = |count_ff;

assign empty_o = (count_ff == 3'h0);

endmodule