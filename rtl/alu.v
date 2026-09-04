module alu(
input [31:0] a,b, //32 bit inputs 
input [2:0] alu_control, //total we use 3 bits to control the ALU operation
output reg [31:0] result, //reg is used because the result is assigned in procedural always block 
output zero // driven by continuous assignment like assign
);
always @(*) begin
    case(alu_control)
        3'b000: result = a + b; //add
        3'b001: result = a - b; //sub
        3'b010: result = a & b; //and
        3'b011: result = a | b; //or
        3'b100: result = a ^ b; //xor
        default : result = 32'b0; //in default the 32 bit result is 0
    endcase
end
assign zero = (result == 32'b0); //if the result is 0, then zero is 1, else zero is 0
endmodule
