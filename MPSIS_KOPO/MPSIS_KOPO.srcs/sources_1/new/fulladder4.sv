module fulladder4(input logic [3:0] a_i, 
                   input logic [3:0] b_i, 
                   input logic carry_i, 
                   output logic [3:0] sum_o, 
                   output logic carry_o
);

genvar i;
logic [2:0] Couts;

generate 
	for(i = 0; i<4; i++)
		begin: genLoop
		
			if(i == 0) fulladder  adder_0(a_i[i], b_i[i], carry_i, sum_o[i], Couts[i]);
			else 
				if(i == 3) fulladder adder_3(a_i[i], b_i[i], Couts[i-1], sum_o[i], carry_o);
			else
				fulladder adder_i(a_i[i], b_i[i], Couts[i-1], sum_o[i], Couts[i]);
		
		end
endgenerate

endmodule