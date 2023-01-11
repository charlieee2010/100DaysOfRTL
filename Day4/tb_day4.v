module alu_tb();
   reg [7:0] a_i, b_i;
   reg [2:0] op_i;
   wire [7:0] alu_o;
   wire carry;
   
   alu DUT(
   .a_i(a_i),
   .b_i(b_i),
   .op_i(op_i), 
   .alu_o(alu_o),
   .carry(carry)
   );

   initial begin
      a_i = 8'h00;
      b_i = 8'h00;
      op_i = 3'b000;
      #10;
      //Addition
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b000;
      #10;
      //Subtraction
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b001;
      #10;
      //Vector a left shift using bits 2:0 of vector b
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b010;
      #10;
      //Vector a right shift using bits 2:0 of vector b
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b011;
      #10;
      //AND
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b100;
      #10;
      //OR
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b101;
      #10;
      //XOR
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b110;
      #10;
      //Equality
      a_i = 8'h05;
      b_i = 8'h03;
      op_i = 3'b111;
      #10;
      $finish;
   end

endmodule
