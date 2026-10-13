module program_counter (
    input clk,
    input reset,
    output reg [31:0] pc //program counter is a 32 bit value, the address is 32 bits
);
always @(posedge clk) begin

    if (reset) //when reset is high, set the program counter to 0
        pc <= 32'b0;
    else //when reset is low, increment the program counter by 4 to point to the next instruction
        pc <= pc + 32'd4; 
end

endmodule
