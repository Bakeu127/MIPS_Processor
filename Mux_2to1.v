module Mux_2to1 (A, B , Select, Out);
	input [31:0] A;              
   input [31:0] B;
	input  Select;
	output reg [31:0] Out;
	
parameter In_0 = 1'b0;
parameter In_1 = 1'b1;
always @(*)
begin
	case(Select)
	In_0:
			Out = A;
	In_1: 
			Out = B;
			
	endcase
end
endmodule
