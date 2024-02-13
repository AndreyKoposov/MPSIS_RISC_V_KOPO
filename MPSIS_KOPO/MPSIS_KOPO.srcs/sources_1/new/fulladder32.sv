module fulladder32(input logic [31:0] a_i, 
                   input logic [31:0] b_i, 
                   input logic carry_i, 
                   output logic [31:0] sum_o, 
                   output logic carry_o
);

genvar i;
logic [6:0] Couts;

generate
	for(i=0; i<8; i++)
		begin: forLoop
		
			localparam upper = (i+1)*4 - 1;
			localparam lower = i*4;
		
			if(i == 0) fulladder4 adder_0(a_i[upper:lower], b_i[upper:lower], carry_i, sum_o[upper:lower], Couts[i]);
			else 
				if(i == 7) fulladder4 adder_7(a_i[upper:lower], b_i[upper:lower], Couts[i-1], sum_o[upper:lower], carry_o);
			else
				fulladder4 adder_i(a_i[upper:lower], b_i[upper:lower], Couts[i-1], sum_o[upper:lower], Couts[i]);
	
		end
endgenerate

endmodule