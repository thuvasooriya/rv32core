module id_stage
    import rv32_pkg::*;
(
    input  logic                 clk_i,
    input  logic                 rst_ni,
    // pipeline control
    input  logic                 stall_i,
    input  logic                 flush_i,
    // pipeline registers
    input  if_id_pipeline_reg_t  if_id_i,
    input  mem_wb_pipeline_reg_t wb_i,
    // pipeline output
    output id_ex_pipeline_reg_t  id_ex_o
);

    // internal signals
    logic [4:0] rs1_addr, rs2_addr, rd_addr;
    logic [31:0] imm;
    ctrl_signals_t ctrl;

    // instruction decoder
    instruction_decoder u_decoder (
        .instr_i(if_id_i.instr),
        .rs1_addr_o(rs1_addr),
        .rs2_addr_o(rs2_addr),
        .rd_addr_o(rd_addr),
        .imm_o(imm),
        .ctrl_o(ctrl)
    );

    // register file
    logic [31:0] rs1_data, rs2_data;
    register_file u_regfile (
        .clk_i,
        .rst_ni,
        .rs1_addr_i(rs1_addr),
        .rs2_addr_i(rs2_addr),
        .rd_addr_i(wb_i.rd_addr),
        .rd_data_i(wb_i.result),
        .rd_we_i(wb_i.reg_write),
        .rs1_data_o(rs1_data),
        .rs2_data_o(rs2_data)
    );

    // pipeline register update
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            id_ex_o <= '0;
        end else if (!stall_i) begin
            if (flush_i) id_ex_o <= '0;
            else begin
                id_ex_o.rs1_data  <= rs1_data;
                id_ex_o.rs2_data  <= rs2_data;
                id_ex_o.imm       <= imm;
                id_ex_o.rs1_addr  <= rs1_addr;
                id_ex_o.rs2_addr  <= rs2_addr;
                id_ex_o.rd_addr   <= rd_addr;
                id_ex_o.pc        <= if_id_i.pc;
                id_ex_o.alu_op    <= ctrl.alu_op;
                id_ex_o.reg_write <= ctrl.reg_write;
                id_ex_o.mem_read  <= ctrl.mem_read;
                id_ex_o.mem_write <= ctrl.mem_write;
                id_ex_o.branch    <= ctrl.branch;
                id_ex_o.jump      <= ctrl.jump;
                id_ex_o.branch_op <= ctrl.branch_op;
                id_ex_o.valid     <= if_id_i.valid;
            end
        end
    end

endmodule
