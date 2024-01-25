module In_Mem (
    input [31:0] Address,
    output [31:0] Out
);
reg [7:0] InMem [31:0];
	
    initial begin
		$readmemb("Machinecode.txt", InMem);
    end
	 
assign Out = {InMem[Address+3], InMem[Address+2], InMem[Address+1], InMem[Address]};
endmodule

 