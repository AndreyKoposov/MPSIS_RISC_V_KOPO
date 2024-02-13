module example(input logic A, 
               input logic B, 
               input logic C, 
               output logic D, 
               output logic E
);

logic AB;

assign AB = A & B;
assign D  = AB | C;
assign E = AB;

endmodule