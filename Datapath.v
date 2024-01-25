module Datapath(JumpPC,CLK, RegDst, RegWrite, ALUSrc, ALUControl, 
					 MemWrite, MemRead,MemToReg,  PCSrc,  Out_R_8,  Out_IM , In_Is0, In_Opcode, Out_PC, Reset, Out_R_10,Out_R_11 );
input CLK, RegDst, RegWrite,ALUSrc, MemWrite, MemRead,MemToReg, PCSrc, JumpPC, Reset;
input [3:0] ALUControl;
output wire [31:0]  Out_R_8 ,Out_IM ,Out_PC, Out_R_10, Out_R_11;
output wire [5:0] In_Opcode;
output wire In_Is0;
wire [4:0] Out_Mux5bit;
wire [31:0] Out_Mux_Mem;
wire [31:0] Out_Mux_Reg;
wire [31:0] Out_Reg_1;
wire [31:0] Out_Reg_2;
wire [31:0] Out_SignExtend;
wire [31:0] Out_Mux_ALUSrc;
wire [31:0] Out_ALU;
wire [31:0] Out_Mem;
//wire [31:0] Out_PC;
wire [31:0] Out_InMem;
wire [31:0] Out_Mux_PC;
wire [31:0] Out_adder_1, Out_adder_2;
wire [31:0] Out_SLT;
wire [27:0] Out_Left_28bit;
wire [31:0] Out_Mux_Branch;

In_Mem IM(Out_PC, Out_InMem);

PC PCC(CLK, Out_Mux_PC, Out_PC, Reset);

Adder ad_1(Out_PC, 4,Out_adder_1);

Shift_Left_Two SLT(Out_SLT, Out_SignExtend);

Adder ad_2(Out_SLT, Out_adder_1 ,Out_adder_2);
//jump
Shift_Left_Two_28bit SLT28(Out_Left_28bit, Out_InMem[25:0]);

Mux_2to1 Mux32_3(Out_adder_1,Out_adder_2, PCSrc, Out_Mux_Branch);
//jump
Mux_2to1 Mux32_4(Out_Mux_Branch,{Out_adder_1[31:28],Out_Left_28bit}, JumpPC, Out_Mux_PC);

Mux_2to1_5bit Mux5(Out_InMem[20:16], Out_InMem[15:11], RegDst, Out_Mux5bit);

RegisterFile RegF(Out_InMem[25:21], Out_InMem[20:16], Out_Mux5bit, Out_Mux_Mem, Out_Reg_1, Out_Reg_2, RegWrite, CLK, Out_R_8,Out_R_10, Out_R_11);

SignExtend SignE(Out_InMem[15:0] , Out_SignExtend);

Mux_2to1 Mux32_1(Out_Reg_2, Out_SignExtend, ALUSrc, Out_Mux_ALUSrc);

ALU ALU_X(Out_Reg_1, Out_Mux_ALUSrc, ALUControl[3:0], Out_ALU, In_Is0);

DataMemory DMem(Out_ALU, Out_Reg_2, Out_Mem, MemWrite, MemRead, CLK); //

Mux_2to1 Mux32_2(Out_ALU, Out_Mem, MemToReg, Out_Mux_Mem);

assign Out_IM = Out_InMem;
assign In_Opcode = Out_InMem[31:26];
endmodule

