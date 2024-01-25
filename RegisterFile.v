module RegisterFile (
  input  [4:0] ReadAddress1,
  input  [4:0] ReadAddress2,
  input  [4:0] WriteAddress,
  input  [31:0] WriteData,
  output  [31:0] ReadData1,
  output  [31:0] ReadData2,
  input  ReadWriteEn,
  input CLK,
  output [31:0] Reg_8,
  output [31:0] Reg_10,
  output [31:0] Reg_11
);
  reg [31:0] registers [0:31];
initial begin
  //Mặc định
  registers[5'b00000] = 32'b0;
  registers[5'b00001] = 32'b00000000000000000000000000000001;
  //Cung cap so lieu
  registers[5'b00101] = 32'b00000000000000000000000000000011;  //R[5] = 3;
  registers[5'b01010] = 32'b0;  //R[10] = 0;
end

assign	ReadData1 = registers[ReadAddress1];
assign	ReadData2 = registers[ReadAddress2];

		
  always @(negedge CLK) begin
    if (ReadWriteEn) begin
        registers[WriteAddress] = WriteData;
      end
end
assign Reg_8 = registers[8];
assign Reg_10 = registers[10];
assign Reg_11 = registers[11];
endmodule
