module day9_tb ();

  parameter VEC_W = 5;

  reg [VEC_W-1:0] bin_i;
  wire [VEC_W-1:0] gray_o;

  day9 #(VEC_W) DAY9 (
    .bin_i(bin_i),
    .gray_o(gray_o)
  );

  initial begin
    for (int i=0; i<2**VEC_W; i=i+1) begin
      bin_i = i;
      #5;
    end
    $finish();
  end

  initial begin
    $dumpfile("day9.vcd");
    $dumpvars();
  end

endmodule
