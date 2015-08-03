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
	 input [7:0]  key_in,
	 input [7:0]  data_in,
	 output [7:0]  data_out
    ); 
	 
reg [7:0] data_in;
reg [7:0] key_in;


endmodule
