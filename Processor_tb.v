module Processor_tb;
reg CLK, Reset;
wire [31:0]   Out_R_8, Out_IM, Out_PC, Out_R_10, Out_R_11;
wire [5:0] In_Opcode;
wire  [3:0] ALUControl;
wire  In_Is0;
Processor Unit(.CLK(CLK), 
					.Out_R_8(Out_R_8),  
					.Out_IM(Out_IM) , 
					.In_Opcode(In_Opcode), 
					.ALUControl(ALUControl), 
					.In_Is0(In_Is0), 
					.Out_PC(Out_PC),
					.Reset(Reset),
					.Out_R_10(Out_R_10),
					.Out_R_11(Out_R_11));

always begin
    #10 CLK = ~CLK; 
  end

  initial begin
	 CLK = 0;
    Reset = 1;
    #20 Reset = 0;
  end
 endmodule
 