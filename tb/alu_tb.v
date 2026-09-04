
`timescale 1ns/1ps //simulation time unit is 1ns and simulation time precision is 1ps
module alu_tb; //since the tb has no external ports just give a semicolon and not brackets
    reg[31:0] a, b;
    reg[2:0] alu_control;
    wire[31:0] result;
    wire zero;

    alu dut(   //dut is the instance name of the alu module that is it connects tb to the alu module 
        .a(a), // instantiate i.e ALU port 'a' connected to testbench signal 'a' 
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    ); 

initial begin 
    $dumpfile ("sim/alu_waveform.vcd");
    $dumpvars(0,alu_tb); 
    a=10;   //test 1: ADD
    b=5;
    alu_control=3'b000; //add
    #10; //wait for 10 time units before executing the next statement i.e 10ns
    if(result == 15 && zero == 0) //check if the result is 15 and zero flag is 0    
    $display("Add test passed: result = %d, zero = %b", result, zero); ///%d decimal display
    else
    $display("Add test failed: expected 15, got = %d, zero = %b", result, zero); //%b binary display

    alu_control=3'b001; //sub
    #10;  
     if(result == 32'd5 && zero == 1'b0) 
    $display("Sub test passed: result = %d, zero = %b", result, zero); ///%d decimal display
    else
    $display("Sub test failed: expected 5, got = %d, zero = %b", result, zero); //%b binary display

    alu_control=3'b010; //and
    #10;
    if (result == 32'b0 && zero == 1'b1)
    $display("And test passed: result = %d, zero = %b", result, zero);
    else
    $display("And test failed: expected 0, got = %d, zero = %b", result, zero);

    alu_control=3'b011; //or 1010 | 0101 = 1111 => 15
    #10;
    if (result == 32'd15 && zero == 1'b0)
    $display ("OR test passed: result = %d, zero = %b\n", result, zero);
    else 
    $display ("OR test failed: expected 15, got = %d, zero = %b\n", result, zero);

    alu_control=3'b100; //xor 1010 ^ 0101 = 1111 => 15
    #10;
    if (result == 32'd15 && zero == 1'b0)
    $display ("XOR test passed: result = %d, zero = %b\n", result, zero);
    else 
    $display ("XOR test failed: expected 15, got = %d, zero = %b\n", result, zero);

    $display ("Result = %d, Zero = %b", result,zero); //display the result and zero flag 
    
    $finish; //end the simulation
end
endmodule