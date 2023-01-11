module day5 (
   input   clk,
   input   reset,
   output [7:0] count
);

   reg [7:0] count_reg;

   always @(posedge clk) begin
      if (reset) begin
         count_reg <= 8'h1;
      else 
         count_reg <= count_reg + 2'b10;
      end
   end

   assign count = count_reg;
endmodule