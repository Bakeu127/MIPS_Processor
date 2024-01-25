module Control_Unit(In_Opcode,In_Is0,RegDst, RegWrite, ALUSrc, ALUOp, 
					 MemWrite, MemRead,MemToReg, PCSrc, JumpPC);
output reg RegDst, RegWrite, ALUSrc,  MemWrite, MemRead, MemToReg, PCSrc, JumpPC;
output reg [2:0] ALUOp;
input In_Is0;
input [5:0] In_Opcode;
parameter BEQ = 6'b000000;
parameter ADD = 6'b000001;
parameter SW =  6'b000010;
parameter SUB = 6'b000011;
parameter LW =  6'b000100;
parameter AND = 6'b000101;
parameter SLT = 6'b000110;
parameter OR =  6'b000111;
parameter JUMP =  6'b001000;
always @(*) 
	begin
		case(In_Opcode)
				BEQ:
						begin
							 JumpPC = 1'b0;
							 RegDst = 1'bx;
							 RegWrite = 1'b0;
							 ALUSrc = 1'b0;
							 MemWrite = 1'b0;
							 MemRead = 1'b0;
							 MemToReg = 1'bx;
							 ALUOp = 3'b011;
							 if(In_Is0 == 1 ) PCSrc = 1'b1;
							 else PCSrc = 1'b0;
						end
				ADD:
						begin
							 JumpPC = 1'b0;
							 PCSrc = 1'b0;
							 RegDst = 1'b1;
							 RegWrite = 1'b1;
							 ALUSrc = 1'b0;
							 MemWrite = 1'b0;
							 MemRead = 1'b0;
							 MemToReg = 1'b0;
							 ALUOp = 3'b010;
						end
				SW:
						begin
						    JumpPC = 1'b0;
							 PCSrc = 1'b0;
							 RegDst = 1'bx;
							 RegWrite = 1'b0;
							 ALUSrc = 1'b1;
							 MemWrite = 1'b1;
							 MemRead = 1'b0;
							 MemToReg = 1'bx;
							 ALUOp = 3'b010;
						end
				SUB:
						begin
						    JumpPC = 1'b0;
							 PCSrc = 1'b0;
							 RegDst = 1'b1;
							 RegWrite = 1'b1;
							 ALUSrc = 1'b0;
							 MemWrite = 1'b0;
							 MemRead = 1'b0;
							 MemToReg = 1'b0;
							 ALUOp = 3'b011;
						end
				LW:
						begin
						    JumpPC = 1'b0;
						    PCSrc = 1'b0;
							 RegDst = 1'b0;
							 RegWrite = 1'b1;
							 ALUSrc = 1'b1;
							 MemWrite = 1'b0;
							 MemRead = 1'b1;
							 MemToReg = 1'b1;
							 ALUOp = 3'b010;
						end
				AND: 
						begin
						    JumpPC = 1'b0;
							 PCSrc = 1'b0;
							 RegDst = 1'b1;
							 RegWrite = 1'b1;
							 ALUSrc = 1'b0;
							 MemWrite = 1'b0;
							 MemRead = 1'b0;
							 MemToReg = 1'b0;
							 ALUOp = 3'b000;
						end
						
				SLT:
						begin
						    JumpPC = 1'b0;
							 PCSrc = 1'b0;
							 RegDst = 1'b1;
							 RegWrite = 1'b1;
							 ALUSrc = 1'b0;
							 MemWrite = 1'b0;
							 MemRead = 1'b0;
							 MemToReg = 1'b0;
							 ALUOp = 3'b100;
						end
				OR:
						begin
						    JumpPC = 1'b0;
							 PCSrc = 1'b0;
							 RegDst = 1'b1;
							 RegWrite = 1'b1;
							 ALUSrc = 1'b0;
							 MemWrite = 1'b0;
							 MemRead = 1'b0;
							 MemToReg = 1'b0;
							 ALUOp = 3'b001;
						end
			  JUMP:
			  			begin
						    JumpPC = 1'b1;
							 PCSrc = 1'b0;
							 RegDst = 1'bx;
							 RegWrite = 1'b0;
							 ALUSrc = 1'bx;
							 MemWrite = 1'b0;
							 MemRead = 1'b0;
							 MemToReg = 1'bx;
							 ALUOp = 3'bxxx;
						end
		endcase
	end
endmodule
