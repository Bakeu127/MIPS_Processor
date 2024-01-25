module SignExtend (
  input signed [15:0] IN,
  output reg signed [31:0] OUT
);

  always @* begin
    OUT = {{16{IN[15]}}, IN};
  end

endmodule