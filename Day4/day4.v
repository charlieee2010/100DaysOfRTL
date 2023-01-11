module alu(
           input [7:0] a_i,b_i,                   
           input [2:0] op_i,
           output [7:0] alu_o,
		   output carry
    );
	

	
    always @(*)
    begin
        case(op_i)
        4'b000: // Addition
           {carry,alu_o}  = {1'b0, a_i} + {1'b0, b_i}; 
        4'b001: // Subtraction
           alu_o  =  a_i - b_i ;
        4'b010: // Vector a left shift using bits 2:0 of vector b
           alu_o  = a_i[7:0] << b_i[2:0];
        4'b011: // Vector a right shift using bits 2:0 of vector b
           alu_o  =a_i[7:0] >> b_i[2:0];
        4'b100: // AND
           alu_o  = a_i & b_i;
         4'b101: // OR
           alu_o  = a_i | b_i;
         4'b110: // XOR
           alu_o  = a_i ^ b_i;
         4'b111: // Output should be 1 when equal otherwise 0
		    alu_o  = (a_i == b_i) ? 1'b1 : 4'b000;
        endcase
    end

endmodule