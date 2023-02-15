module day10_tb();
 reg clk;
 reg reset;
 reg load_i;
 reg[3:0] load_val_i;

 wire[3:0] count_o;

  day10 dut (.clk(clk),
             .reset(reset),
             .load_i(load_i)),
			 .load_val_i(load_val_i),
			 .count_o(count_o)
	);


   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end

  integer cyc;
  initial begin
    reset <= 1'b1;
    load_i <= 1'b0;
    load_val_i <= 4'h0;
    @(posedge clk);
    reset <= 1'b0;
    for (int i=0; i<3; i=i+1) begin
      load_i <= 1;
      load_val_i <= 3*i;
      cycles = 4'hF - load_val_i[3:0];
      @(posedge clk);
      load_i <= 0;
      while (cyc) begin
        cyc = cyc - 1;
        @(posedge clk);
      end
    end
    $finish();
  end

  initial begin
    $dumpfile("day10.vcd");
    $dumpvars();
  end
endmodule
