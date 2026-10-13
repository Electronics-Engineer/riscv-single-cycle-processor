`timescale 1ns/1ps
module pc_tb;
    reg clk;
    reg reset;
    wire [31:0] pc;
    
    // Program Counter DUT
    program_counter dut (
        .clk(clk),
        .reset(reset),
        .pc(pc)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Waveform generation
    initial begin
        $dumpfile("sim/pc_waveform.vcd");
        $dumpvars(0, pc_tb);
    end

    // Test sequence
    initial begin

        // Start with reset enabled
        reset = 1;
        #10;
        $display("After reset: PC = %d", pc);


        // Release reset
        reset = 0;
        #10;
        $display("PC after 1st clock = %d", pc);

        #10;
        $display("PC after 2nd clock = %d", pc);

        #10;
        $display("PC after 3rd clock = %d", pc);

        #10;
        $display("PC after 4th clock = %d", pc);

        #10;
        $display("PC after 5th clock = %d", pc);

        $finish;

    end
endmodule