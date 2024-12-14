module exception_handler
    import rv32_pkg::*;
(
    input  logic        clk_i,
    input  logic        rst_ni,
    // Exception sources
    input  logic        misaligned_instr_i,
    input  logic        misaligned_load_i,
    input  logic        misaligned_store_i,
    input  logic        illegal_instr_i,
    input  logic [31:0] illegal_instr_pc_i,
    // CSR interface
    output logic [11:0] csr_addr_o,
    output logic [31:0] csr_wdata_o,
    output logic        csr_we_o,
    input  logic [31:0] csr_rdata_i,
    // Pipeline control
    output logic        take_exception_o,
    output logic [31:0] exception_pc_o
);

    // Exception priority encoder
    always_comb begin
        take_exception_o = 1'b0;
        exception_pc_o   = '0;
        csr_addr_o       = '0;
        csr_wdata_o      = '0;
        csr_we_o         = 1'b0;

        if (misaligned_instr_i) begin
            take_exception_o = 1'b1;
            csr_addr_o       = CSR_MTVAL;
            csr_wdata_o      = illegal_instr_pc_i;
            csr_we_o         = 1'b1;
            exception_pc_o   = EXCEPTION_HANDLER_ADDR;
        end else if (illegal_instr_i) begin
            take_exception_o = 1'b1;
            csr_addr_o       = CSR_MTVAL;
            csr_wdata_o      = illegal_instr_pc_i;
            csr_we_o         = 1'b1;
            exception_pc_o   = EXCEPTION_HANDLER_ADDR;
        end else if (misaligned_load_i || misaligned_store_i) begin
            take_exception_o = 1'b1;
            csr_addr_o       = CSR_MTVAL;
            csr_wdata_o      = illegal_instr_pc_i;
            csr_we_o         = 1'b1;
            exception_pc_o   = EXCEPTION_HANDLER_ADDR;
        end
    end

endmodule
