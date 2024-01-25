module Shift_Left_Two_28bit(output [27:0] Output,input[25:0] Input);
  assign Output={Input,2'b00};
endmodule