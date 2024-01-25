module Controller(In_Opcode,In_Is0,RegDst, RegWrite, ALUSrc, ALUControl, 
					 MemWrite, MemRead,MemToReg, PCSrc, JumpPC);
output wire RegDst, RegWrite, ALUSrc,  MemWrite, MemRead, MemToReg, PCSrc, JumpPC;
input In_Is0;
input [5:0] In_Opcode;
output  wire [3:0] ALUControl;
wire [2:0] ALUOp;


Control_Unit CU(In_Opcode,In_Is0,RegDst, RegWrite, ALUSrc, ALUOp, MemWrite, MemRead,MemToReg, PCSrc, JumpPC);

ALU_Control AC(ALUOp, ALUControl);		

endmodule
		 
					 