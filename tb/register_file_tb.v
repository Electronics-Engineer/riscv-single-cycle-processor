`timescale 1ns/1ps

module register_file_tb;

    reg clk;

    reg [4:0] rs1_addr;
    reg [4:0] rs2_addr;

    reg [4:0] rd_addr;
    reg [31:0] write_data;
    reg write_enable;

    wire [31:0] read_data1;
    wire [31:0] read_data2;


    // Register File DUT
    register_file dut (
        .clk(clk),
        .rs1_addr(rs1_addr),
        .rs2_addr(rs2_addr),
        .rd_addr(rd_addr),
        .write_data(write_data),
        .write_enable(write_enable),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );


    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    // Waveform generation
    initial begin
        $dumpfile("sim/register_file_waveform.vcd");
        $dumpvars(0, register_file_tb);
    end


    // Test sequence
    initial begin

        // Initial values
        rs1_addr = 0;
        rs2_addr = 0;
        rd_addr = 0;
        write_data = 0;
        write_enable = 0;

        #10;


        // Test 1: Write 100 to x5
        rd_addr = 5;
        write_data = 100;
        write_enable = 1;

        #10;


        // Test 2: Write 250 to x10
        rd_addr = 10;
        write_data = 250;

        #10;


        // Test 3: Write 500 to x15
        rd_addr = 15;
        write_data = 500;

        #10;


        // Test 4: Read x10 and x15 simultaneously
        write_enable = 0;
        rs1_addr = 10;
        rs2_addr = 15;

        #1;

        $display("Read x10 = %d", read_data1);
        $display("Read x15 = %d", read_data2);


        // Test 5: Attempt to write 999 to x0
        rd_addr = 0;
        write_data = 999;
        write_enable = 1;

        #10;


        // Read x0
        rs1_addr = 0;

        #1;

        $display("Read x0 = %d", read_data1);


        $finish;

    end

endmodule