module rv32_core
    import rv32_pkg::*;
#(
    parameter bit PIPELINED  = 1'b1,
    parameter int RESET_ADDR = 32'h0
) (
    input  logic        clk_i,
    input  logic        rst_ni,
    // instruction memory interface
    output logic [31:0] instr_addr_o,
    input  logic [31:0] instr_rdata_i,
    output logic        instr_req_o,
    input  logic        instr_gnt_i,
    input  logic        instr_rvalid_i,
    // data memory interface
    output logic [31:0] data_addr_o,
    output logic [31:0] data_wdata_o,
    input  logic [31:0] data_rdata_i,
    output logic        data_req_o,
    output logic        data_we_o,
    output logic [ 3:0] data_be_o,
    input  logic        data_gnt_i,
    input  logic        data_rvalid_i
);

    // pipeline registers
    if_id_pipeline_reg_t         if_id_pipe_reg;
    id_ex_pipeline_reg_t         id_ex_pipe_reg;
    ex_mem_pipeline_reg_t        ex_mem_pipe_reg;
    mem_wb_pipeline_reg_t        mem_wb_pipe_reg;

    // pipeline control signals
    logic                        pipe_stall;
    logic                        pipe_flush;
    logic                 [31:0] branch_target;
    logic                        branch_taken;

    // forwarding signals
    logic                 [ 1:0] forward_a;
    logic                 [ 1:0] forward_b;

    // instantiate pipeline stages
    if_stage u_if_stage (
        .clk_i,
        .rst_ni,
        .stall_i(pipe_stall),
        .flush_i(pipe_flush),
        .branch_target_i(branch_target),
        .branch_taken_i(branch_taken),
        .instr_addr_o,
        .instr_rdata_i,
        .instr_req_o,
        .instr_gnt_i,
        .instr_rvalid_i,
        .if_id_o(if_id_pipe_reg)
    );

    id_stage u_id_stage (
        .clk_i,
        .rst_ni,
        .if_id_i(if_id_pipe_reg),
        .wb_i(mem_wb_pipe_reg),
        .stall_i(pipe_stall),
        .flush_i(pipe_flush),
        .id_ex_o(id_ex_pipe_reg)
    );

    ex_stage u_ex_stage (
        .clk_i,
        .rst_ni,
        .id_ex_i(id_ex_pipe_reg),
        .forward_a_i(forward_a),
        .forward_b_i(forward_b),
        .mem_data_i(ex_mem_pipe_reg.alu_result),
        .wb_data_i(mem_wb_pipe_reg.result),
        .branch_target_o(branch_target),
        .branch_taken_o(branch_taken),
        .ex_mem_o(ex_mem_pipe_reg)
    );

    mem_stage u_mem_stage (
        .clk_i,
        .rst_ni,
        .ex_mem_i(ex_mem_pipe_reg),
        .data_rdata_i,
        .data_addr_o,
        .data_wdata_o,
        .data_req_o,
        .data_we_o,
        .data_be_o,
        .data_gnt_i,
        .data_rvalid_i,
        .mem_wb_o(mem_wb_pipe_reg)
    );

    // hazard detection unit
    hazard_unit u_hazard_unit (
        .rs1_addr_i(if_id_pipe_reg.instr[19:15]),
        .rs2_addr_i(if_id_pipe_reg.instr[24:20]),
        .ex_rd_i(id_ex_pipe_reg.rd_addr),
        .mem_rd_i(ex_mem_pipe_reg.rd_addr),
        .ex_mem_read_i(id_ex_pipe_reg.mem_read),
        .stall_o(pipe_stall)
    );

    // forwarding unit
    forwarding_unit u_forwarding_unit (
        .rs1_addr_i(id_ex_pipe_reg.rs1_addr),
        .rs2_addr_i(id_ex_pipe_reg.rs2_addr),
        .ex_mem_rd_i(ex_mem_pipe_reg.rd_addr),
        .mem_wb_rd_i(mem_wb_pipe_reg.rd_addr),
        .ex_mem_reg_write_i(ex_mem_pipe_reg.reg_write),
        .mem_wb_reg_write_i(mem_wb_pipe_reg.reg_write),
        .forward_a_o(forward_a),
        .forward_b_o(forward_b)
    );

endmodule
