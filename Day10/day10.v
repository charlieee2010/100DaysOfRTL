module day10 (
    input clk,
    input reset,
    input load_i,
    input [3:0] load_val_i,
    output reg [3:0] count_o
);
     reg[3:0] load_to_ff;
     reg[3:0] count_to_ff,nxt_count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            load_to_ff <= 4'b0000;
            count_to_ff <= 4'b0000;
        end else if (load_i) begin
            load_to_ff <= load_val_i;
            count_to_ff <= nxt_count;
        end else
                count_to_ff <= nxt_count;
    end

  assign nxt_count = load_i ? load_val_i :
                              (count_to_ff == 4'b1111) ? load_to_ff :
                              count_to_ff + 4'b0001;

  assign count_o = count_to_ff;

endmodule
