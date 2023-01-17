module day8_tb();

  parameter BIN_W = 4;
  parameter ONE_HOT_W = 16;

  reg [BIN_W-1:0] bin_i;
  wire [ONE_HOT_W-1:0] one_hot_o;

  day8 #(BIN_W, ONE_HOT_W) DAY8 (
    .bin_i(bin_i),
    .one_hot_o(one_hot_o)
  );

  initial begin
    for(int i=0; i<32; i=i+1) begin
      bin_i = $urandom_range(0, 4'hF);
      #5;
    end
    $finish();
  end

  initial begin
    $dumpfile("day8.vcd");
    $dumpvars();
  end

endmodule
