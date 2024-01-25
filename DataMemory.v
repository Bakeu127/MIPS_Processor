module DataMemory (
    input  [31:0] Address, 
    input  [31:0] WriteData, 
    output [31:0] ReadData,  
    input  WriteEn,           
    input  ReadEn,         
    input  Clock
);

reg [31:0] DMem [31 : 0];

always @(negedge Clock) begin
   if (WriteEn == 1'b1 && ReadEn == 1'b0) DMem[Address] = WriteData;
end 		

assign	ReadData = (ReadEn == 1'b1 && WriteEn == 1'b0) ? DMem[Address] : 32'bz;
		 
	

endmodule
