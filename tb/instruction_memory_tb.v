`timescale 1ns/1ps

module instruction_memory_tb;

    reg [31:0] address;
    wire [31:0] instruction;

    // Instruction Memory DUT
    instruction_memory dut (
        .address(address),
        .instruction(instruction)
    );

    // Waveform generation
    initial begin
        $dumpfile("sim/instruction_memory_waveform.vcd");
        $dumpvars(0, instruction_memory_tb);
    end

    // Test sequence
    initial begin

        address = 0;
        #10;
        $display("Address = %0d, Instruction = %h",
                 address, instruction);

        address = 4;
        #10;
        $display("Address = %0d, Instruction = %h",
                 address, instruction);

        address = 8;
        #10;
        $display("Address = %0d, Instruction = %h",
                 address, instruction);

        address = 12;
        #10;
        $display("Address = %0d, Instruction = %h",
                 address, instruction);

        address = 16;
        #10;
        $display("Address = %0d, Instruction = %h",
                 address, instruction);

        $finish;
    end

endmodule