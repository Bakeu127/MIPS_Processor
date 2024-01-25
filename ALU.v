module ALU (A , B, Select, Out, Is0);
	input signed [31:0] A;              
   input signed [31:0] B;
	input [3:0] Select;
	output reg signed  [31:0] Out;
	output Is0;	
parameter NOT_A = 3'b000;
parameter A_AND_B = 3'b001;
parameter A_XOR_B = 3'b010;
parameter A_OR_B = 3'b011;
parameter DEC_A = 3'b100;
parameter A_ADD_B = 3'b101;
parameter A_SUB_B = 3'b110;
parameter INC_A = 3'b111;
parameter SLT = 4'b1000;
always @(*) 
	begin
		case(Select) 
				NOT_A: 
						Out = ~A;
				A_AND_B: 
						Out = A & B;
				A_XOR_B: 
						Out = A ^ B;
				A_OR_B:  
						Out = A | B;
				DEC_A:
						begin
							Out = A - 1;
						end
				A_ADD_B: 
						begin
							Out = A + B;
						end
						
				A_SUB_B:
						begin
							Out = A - B;
						end
				INC_A:
						begin
							Out = A + 1;
						end
				SLT:
						begin
							if (A < B) Out = 1'b1;
							else Out = 32'b0;
						end
		endcase
	end
assign Is0 = (Out==32'b0) ? 1'b1: 1'b0;
endmodule
					