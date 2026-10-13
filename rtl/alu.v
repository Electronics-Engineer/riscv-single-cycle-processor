module alu(
input [31:0] a,b, //32 bit inputs 
input [2:0] alu_control, // 3 bits to control the ALU operation
output reg [31:0] result, 
output zero 
);
always @(*) begin
    case(alu_control)
        3'b000: result = a + b; 
        3'b001: result = a - b; 
        3'b010: result = a & b; 
        3'b011: result = a | b; 
        3'b100: result = a ^ b; 
        default : result = 32'b0; 
    endcase
end
assign zero = (result == 32'b0); 
endmodule
