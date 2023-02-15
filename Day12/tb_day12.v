module day12_tb();

  reg clk;
  reg reset;
  reg x_i;
  wire det_o;

  day12 dut (.clk(clk),
             .reset(reset),
             .x_i(x_i),
			 .det_o(det_o)
			 );

  initial begin
    clk = 1'b1;
    forever #5 clk = ~clk;
    
  end

  reg [11:0] seq = 12'b1110_1101_1011;

  initial begin
    reset <= 1'b1;
    x_i <= 1'b1;
    #5;
    reset <= 1'b0;
    #5;
    for (int i=0; i<12; i=i+1) begin
      x_i <= seq[i];
      #5;
    end
    for (int i=0; i<12; i=i+1) begin
      x_i <= $random%2;
      #5;
    end
	   #5 x_i = 12'b1110_1101_1011; \\probebly we should add reg for that
    $finish();
  end

  initial begin
    $dumpfile("day12.vcd");
    $dumpvars(0);
  end
endmodule
