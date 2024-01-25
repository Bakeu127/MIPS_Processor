module PC (CLK, In, Out, Reset);
input CLK, Reset;
input [31: 0] In;
output reg [31:0] Out;

 always@(posedge CLK or posedge Reset)
  begin
		if(Reset) Out = 32'b0;
		else Out = In;
  end
  
endmodule
