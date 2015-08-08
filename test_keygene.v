`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:12 08/08/2015
// Design Name:   key_gene
// Module Name:   E:/Encryption/RC4/RC4/test_keygene.v
// Project Name:  RC4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: key_gene
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_keygene;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] key_init;
	reg [1:0] NS;
	reg [7:0] number;
	// Outputs
	wire data_rready;
	wire [7:0] num;

	// Instantiate the Unit Under Test (UUT)
	key_gene uut (
		.clk(clk), 
		.rst(rst), 
		.key_init(key_init), 
		.NS(NS), 
		.data_rready(data_rready), 
		.num(num)
	);

parameter INIT = 2'b00,KEY_GENE = 2'b01,EN_DE_CODE = 2'b10; 

initial begin
	clk = 0;
	forever
	#1 clk = ~clk;
end

initial begin
	key_init = 0;
	number = 0;
end

initial begin
	rst = 0;
	#5 rst = 1;
	#600 rst = 0;
	#10 rst = 1;
	$stop;
end

initial begin
	NS = INIT;
	#10 NS = KEY_GENE;
end

always @ (posedge clk) begin
	if(NS == KEY_GENE) begin
		number = number + 1;
		key_init = number - 1;
	end	
end

endmodule
