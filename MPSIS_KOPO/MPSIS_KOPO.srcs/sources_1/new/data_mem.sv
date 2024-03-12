module data_mem(
    input  logic clk_i,
    input  logic mem_req_i,
    input  logic write_enable_i,
    input  logic [31:0] addr_i,
    input  logic [31:0] write_data_i,
    output logic [31:0] read_data_o
);

logic [31:0] ROM [4096];
logic [31:0] read_data_reg;

always_ff @(posedge clk_i) begin : mem_access
    if(mem_req_i == 1)
    begin
        if(write_enable_i == 1) ROM[addr_i[13:2]] <= write_data_i;
        read_data_reg <= ROM[addr_i[13:2]];
    end
end

assign read_data_o = read_data_reg;

endmodule