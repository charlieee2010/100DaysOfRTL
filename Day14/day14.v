//req_i[0] has the highest priorty

module day14(

        input            clk,rst,
        input [3:0]      req_i,
        output reg [3:0] gnt_o
);

  always @ (posedge clk or posedge rst)
	begin		
          if(rst)
				gnt_o <= 4'b0000;
          else if(req_i[0])
				gnt_o <= 4'b1000;
          else if(req_i[1])
				gnt_o <= 4'b0100;
          else if(req_i[2])
				gnt_o <= 4'b0010;
          else if(req_i[3])
				gnt_o <= 4'b0001;
          else
				gnt_o <= 4'b0000;
	end
endmodule