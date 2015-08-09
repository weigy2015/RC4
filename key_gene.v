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
//input key_rvalid,			//允许读
input[1:0] NS,
output reg data_rready,		//准备读
output reg[8:0] count,
output reg[7:0] j,
output reg flag_ex,
output[7:0] test
//output[7:0] key			//输出密钥
    );

reg[7:0] s[0:255];
reg[7:0] key[0:255];

//wire[7:0] num;
//wire data_rready;

integer m;
localparam INIT = 2'b00,KEY_GENE = 2'b01,EN_DE_CODE = 2'b10;

initial begin
	data_rready <= 0;
	for (m = 0;m <256;m = m + 1) begin
		s[m] <= m;
	end
	for (m = 0;m <256;m = m + 1) begin
			key[m] <= m;
	end
	flag_ex <= 0;
	j <= 0;
	count <= 0;
end

always @ (posedge clk or negedge rst) begin
	if(!rst) begin
		data_rready <= 0;
		for (m = 0;m <256;m = m + 1) begin
			s[m] <= m;
		end
		for (m = 0;m <256;m = m + 1) begin
			key[m] <= m;
		end
		flag_ex <= 0;
		j <= 0;
		count <= 0;
	end
	else begin
		if(NS == KEY_GENE && count < 256) begin
			count <= count + 1;
			j <= j + count[7:0] + key_init;
			flag_ex <= 1;
		end
		if(NS == KEY_GENE && count == 256) begin
			flag_ex <= 0;
			data_rready <= 1;
		end
		if(flag_ex) begin
			s[count-2] <= s[j];
			s[j] <= s[count-2];
		end
		
		if(data_rready == 1) begin
			for (m = 0;m <256;m = m + 1) begin
				key[m] <= s[m];
			end
		end
		
		if(NS == EN_DE_CODE) begin
			for (m = 0;m <256;m = m + 1) begin
				s[m] <= m;
			end
			j <= 0;
			count <= 0;
			data_rready <= 0;
		end
	end
end

assign test = s[2];

endmodule
