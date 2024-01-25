`timescale 1ns/1ps
module Testbench_full;
  reg CLK;
  reg RegDst, RegWrite, ALUSrc, MemWrite, MemRead, MemToReg, PCSrc, JumpPC ;
  reg [3:0] ALUcontrol;

  wire [31:0] Out_DMem,  Out_R_1, Out_Mem_5, Out_IM;
  wire Out_Is0;
  wire [5:0] Out_Opcode;

  Datapath uut (
	 .JumpPC(JumpPC),
    .CLK(CLK),
    .RegDst(RegDst),
    .RegWrite(RegWrite),
    .ALUSrc(ALUSrc),
    .ALUcontrol(ALUcontrol),
    .MemWrite(MemWrite),
    .MemRead(MemRead),
    .MemToReg(MemToReg),
    .Out_DMem(Out_DMem),
	 .PCSrc(PCSrc),
	 .Out_R_1(Out_R_1), 
	 .Out_Mem_5(Out_Mem_5),
	 .Out_IM(Out_IM),
	 .Out_Is0(Out_Is0), 
	 .Out_Opcode(Out_Opcode)
	 
  );
  initial begin
    CLK = 0;
    forever #10 CLK = ~CLK;
  end
   initial begin
	 JumpPC = 1'b0;
	 PCSrc = 1'b0;
    RegDst = 1'b1;
    RegWrite = 1'b1;
    ALUSrc = 1'b0;
    MemWrite = 1'b0;
    MemRead = 1'b0;
    MemToReg = 1'b0;
    ALUcontrol = 4'b0101;
	 #25
	 JumpPC = 1'b0;
	 PCSrc = 1'b0;
    RegDst = 1'b0;
    RegWrite = 1'b1;
    ALUSrc = 1'b1;
    MemWrite = 1'b0;
    MemRead = 1'b1;
    MemToReg = 1'b1;
    ALUcontrol = 4'b0101;
	 #20
	 JumpPC = 1'b0;
	 PCSrc = 1'b0;
	 RegDst = 1'bx;
    RegWrite = 1'b0;
    ALUSrc = 1'b1;
    MemWrite = 1'b1;
    MemRead = 1'b0;
    MemToReg = 1'bx;
    ALUcontrol = 4'b0101;
	 #25
	 $finish;
  end
  endmodule