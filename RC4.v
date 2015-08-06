`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:46:39 08/01/2015 
// Design Name: 
// Module Name:    RC4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module RC4(
    input clk,
    input rst,
	 output key_rready,
	 input key_rvalid,
	 output data_rready,
	 input data_rvalid,
	 input data_wready,
	 output data_wvalid,
	 input[7:0] key_in,
	 input[7:0] data_in,
	 output[7:0] data_out
    ); 
	 

parameter INIT = 2'b00,
	KEY_GENE = 2'b01,
	ENCODE = 2'b10,
	DEFAULT = 2'b11;

	reg [1:0] NS;

	reg key_gene_valid;
	
	
	
	
	initial begin
		NS <= INIT;
	end
	
	always @ (posedge clk) begin
		case(NS)
			INIT:
				begin
					if(key_rvalid) begin
						key_gene_valid <= 1;
						NS <= KEY_GENE;
					end
			KEY_GENE:
				begin
					if()


endmodule
