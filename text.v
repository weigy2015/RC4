`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:22:55 08/09/2015
// Design Name:   key_gene
// Module Name:   E:/Encryption/RC4/RC4/text.v
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

module text;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] key_init;
	reg [1:0] NS;

	// Outputs
	wire data_rready;
	wire [8:0] count;
	wire [7:0] j;
	wire flag_ex;
	wire[7:0] test;

	// Instantiate the Unit Under Test (UUT)
	key_gene uut (
		.clk(clk), 
		.rst(rst), 
		.key_init(key_init), 
		.NS(NS), 
		.data_rready(data_rready), 
		.count(count), 
		.j(j), 
		.flag_ex(flag_ex),
		.test(test)
	);

	parameter INIT = 2'b00,KEY_GENE = 2'b01,EN_DE_CODE = 2'b10; 

	initial begin
		clk = 0;
		forever
		#1 clk = ~clk;
	end

	initial begin
		key_init = 0;
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
		#540 NS = EN_DE_CODE;
	end

	always @ (posedge clk) begin
		if(NS == KEY_GENE) begin
			key_init = key_init + 1;
		end	
	end
      
endmodule

