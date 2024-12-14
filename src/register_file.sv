module register_file (
    input  logic        clk_i,
    input  logic        rst_ni,
    input  logic [ 4:0] rs1_addr_i,
    input  logic [ 4:0] rs2_addr_i,
    input  logic [ 4:0] rd_addr_i,
    input  logic [31:0] rd_data_i,
    input  logic        rd_we_i,
    output logic [31:0] rs1_data_o,
    output logic [31:0] rs2_data_o
);

    logic [31:0] registers[32];

    // read ports
    assign rs1_data_o = (rs1_addr_i == '0) ? '0 : registers[rs1_addr_i];
    assign rs2_data_o = (rs2_addr_i == '0) ? '0 : registers[rs2_addr_i];

    // write port
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            registers <= '{default: '0};
        end else if (rd_we_i && (rd_addr_i != '0)) begin
            registers[rd_addr_i] <= rd_data_i;
        end
    end

endmodule
