module ALU_Control(ALUOp, ALUControl);
input [2:0] ALUOp;
output reg [3:0] ALUControl;
parameter AND = 3'b000;
parameter OR = 3'b001;
parameter ADD =  3'b010;
parameter SUB = 3'b011;
parameter SLT =  3'b100;
always @(*)
	begin
		case(ALUOp)
			AND:
				begin
					ALUControl = 4'b0001;
				end
			
			OR:  
				begin
					ALUControl = 4'b0011;
				end
			
			ADD: 
				begin
					ALUControl = 4'b0101;
				end
			
			SUB: 
				begin
					ALUControl = 4'b0110;
				end
			
			SLT: 
				begin
					ALUControl = 4'b1000;
				end
		endcase
	end
endmodule
