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
input clk,				//ʱ��
input rst,			//��λ
input[7:0] key_init,		//��ʼ��Կ
input key_rvalid,			//�����
input[1:0] NS,
output key_rready,		//׼����
output[7:0] key			//�����Կ
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
