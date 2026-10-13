module instruction_memory(
    input [31:0] address, //32 bit address input
    output [31:0] instruction //32 bit instruction output
);
    reg [31:0] memory [0:63]; //64 instruction words, each 32 bits wide
    //Load the instructions at the requested address so total capacity 64*32 = 2048 bits or 256 bytes
    assign instruction = memory[address[7:2]]; //PC uses byte addresses (byte = 4) so each 32 bit instructions are 4 bytes apart,(0,4,8,12)
    //ex program
    initial begin
        memory[0] = 32'h00A00093; // AddI x1, x0, 10
        memory[1] = 32'h01400113; // ADDI x2, x0, 20
        memory[2] = 32'h002081B3; // ADD  x3, x1, x2
        memory[3] = 32'h00302023; // SW   x3, 0(x0)
        memory[4] = 32'h00002203; // LW   x4, 0(x0)

    end
endmodule