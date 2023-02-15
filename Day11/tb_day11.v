module day11_tb ();

reg      clk;
reg      reset;
reg [3:0] parallel_i;

wire      empty_o;
wire      serial_o;
wire      valid_o;

day11 dut (.clk(clk),
             .reset(reset),
             .parallel_i(parallel_i),
			 .empty_o(empty_o),
			 .serial_o(serial_o),
			 .valid_o(valid_o));

   initial begin
      clk = 1'b0;
      forever #5 clk = ~clk;
   end


initial begin
    reset <= 1'b1;
    parallel_i <= 4'h0;
    #5;
    reset <= 1'b0;
    #5;
    for (int i=0; i<32; i=i+1) begin
      parallel_i <= $urandom_range(0, 4'hF);
      #5;
    end
    $finish();
end

// VCD
initial begin
    $dumpfile("day11.vcd");
    $dumpvars();
end

endmodule
