`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:15:47 08/03/2015 
// Design Name: 
// Module Name:    key_gene 
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
module key_gene(
input clk,				//时钟
input rst,			//复位
input[7:0] key_init,		//初始密钥
input key_rvalid,			//允许读
output key_rready,		//准备读
output[7:0] key			//输出密钥
    );


endmodule
