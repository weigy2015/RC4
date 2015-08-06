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
	parameter INIT = 2'b00,KEY_GENE = 2'b01,EN_DE_CODE = 2'b10;
	//DEFAULT = 2'b11;
	reg [1:0] NS;
	//reg key_gene_valid;
	reg en_de_code_end;
	reg buffer_null;
	reg key_rready_con;
	reg data_rready_con;
	reg data_wvalid_con;
	initial begin
		NS <= INIT;
		key_rready_con <= 1;
	end
	always @ (posedge clk or negedge rst) begin
		if(!rst) begin
			NS <= INIT;
			key_rready_con <= 1;
		end
		else begin
			case(NS)
				INIT:
					begin
						if(key_rvalid) begin
							//key_gene_valid <= 1;
							NS <= KEY_GENE;
							key_rready_con <= 0;
						end
					end
				KEY_GENE:
					begin
						if(data_rvalid) begin
							NS <= EN_DE_CODE;
							data_rready_con <= 0;
						end
					end
				EN_DE_CODE:
					begin
					if(en_de_code_end && buffer_null) begin
							NS <= INIT;
							data_wvalid_con <= 0;
					end
				end
			endcase
		end
	end
endmodule
