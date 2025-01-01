`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

module ex_stage
  import rv32_pkg::*;
(
    input  logic                        clk_i,
    input  logic                        rst_ni,
    // pipeline registers
    input  id_ex_pipeline_reg_t         id_ex_i,
    // forwarding inputs
    input  logic                 [ 1:0] forward_a_i,
    input  logic                 [ 1:0] forward_b_i,
    input  logic                 [31:0] mem_data_i,
    input  logic                 [31:0] wb_data_i,
    // branch outputs
    output logic                 [31:0] branch_target_o,
    output logic                        branch_taken_o,
    // pipeline output
    output ex_mem_pipeline_reg_t        ex_mem_o
);

  // alu operand selection with forwarding
  logic [31:0] alu_operand_a;
  logic [31:0] alu_operand_b;

  always_comb begin
    // operand a forwarding
    unique case (forward_a_i)
      2'b00:   alu_operand_a = id_ex_i.rs1_data;
      2'b01:   alu_operand_a = mem_data_i;
      2'b10:   alu_operand_a = wb_data_i;
      default: alu_operand_a = id_ex_i.rs1_data;
    endcase

    // operand b forwarding
    unique case (forward_b_i)
      2'b00:   alu_operand_b = id_ex_i.rs2_data;
      2'b01:   alu_operand_b = mem_data_i;
      2'b10:   alu_operand_b = wb_data_i;
      default: alu_operand_b = id_ex_i.rs2_data;
    endcase
  end

  // alu
  logic [31:0] alu_result;
  alu u_alu (
      .operand_a_i(alu_operand_a),
      .operand_b_i(alu_operand_b),
      .operator_i(id_ex_i.alu_op),
      .result_o(alu_result)
  );

  // branch unit
  branch_unit u_branch (
      .operand_a_i(alu_operand_a),
      .operand_b_i(alu_operand_b),
      .pc_i(id_ex_i.pc),
      .imm_i(id_ex_i.imm),
      .branch_op_i(id_ex_i.branch_op),
      .branch_i(id_ex_i.branch),
      .jump_i(id_ex_i.jump),
      .target_o(branch_target_o),
      .taken_o(branch_taken_o)
  );

  // pipeline register update
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      ex_mem_o <= '0;
    end else begin
      ex_mem_o.alu_result <= alu_result;
      ex_mem_o.rs2_data   <= alu_operand_b;
      ex_mem_o.rd_addr    <= id_ex_i.rd_addr;
      ex_mem_o.reg_write  <= id_ex_i.reg_write;
      ex_mem_o.mem_read   <= id_ex_i.mem_read;
      ex_mem_o.mem_write  <= id_ex_i.mem_write;
      ex_mem_o.valid      <= id_ex_i.valid;
    end
  end

endmodule
