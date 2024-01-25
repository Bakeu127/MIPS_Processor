module Processor (CLK, Out_R_8,  Out_IM ,
						In_Opcode, ALUControl, In_Is0, Out_PC, Reset, Out_R_10,Out_R_11 );
input wire CLK, Reset; 
output wire [31:0] Out_R_8 , Out_IM , Out_PC, Out_R_11, Out_R_10;
wire RegDst, RegWrite,ALUSrc, MemWrite, MemRead,MemToReg, PCSrc, JumpPC;
output wire [5:0] In_Opcode;
output wire [3:0] ALUControl;
output wire In_Is0;
Datapath DATAPATH_UNIT(JumpPC,CLK, RegDst, RegWrite, ALUSrc, ALUControl, 
					 MemWrite, MemRead,MemToReg,PCSrc,  Out_R_8 , Out_IM , In_Is0, In_Opcode, Out_PC, Reset, Out_R_10, Out_R_11);
	
Controller  CONTROLLER_UNIT(In_Opcode,In_Is0,RegDst, RegWrite, ALUSrc, ALUControl, 
					 MemWrite, MemRead,MemToReg, PCSrc, JumpPC);
	
endmodule
