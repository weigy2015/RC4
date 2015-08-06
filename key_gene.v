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
input[1:0] NS,
output key_rready,		//准备读
output[7:0] key			//输出密钥
    );

reg finish;
reg[8:0] count;

reg[7:0] s[0:255];
reg[7:0] j;
integer m;


initial begin
	finish <= 0;
	for (m = 0;m <256;m = m + 1) begin
		s[m] <= m;
	end
end

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		finish <= 0;
		for (m = 0;m <256;m = m + 1) begin
			s[m] <= m;
		end
	end
	else begin
		if(NS == KEY_GENE and count[8] == 0) begin
			count <= count + 1;
			j <= j + count[7:0] + key_init; 












endmodule
