module register_file(
    input clk,
    input [4:0] rs1_addr, // 5 bit reg which holds values as 2^5 = 32, address of 1st register
    input [4:0] rs2_addr, // address of the 2nd register we want to read
    input [4:0] rd_addr,
    input [31:0] write_data, //32 bit write variable, if its [0:31] means 31 registers
    input write_enable,

    output [31:0] read_data1,
    output [31:0] read_data2
);

//32 registers each 32 bits wide
reg [31:0] registers [0:31];
//combinational read ports
assign read_data1 = (rs1_addr == 5'd0) ? 32'b0 : registers[rs1_addr];
assign read_data2 = (rs2_addr == 5'd0) ? 32'b0 : registers[rs2_addr];

//synchronous write port
always @(posedge clk) begin
    if (write_enable && rd_addr != 5'd0)
        registers[rd_addr] <= write_data;
end
endmodule