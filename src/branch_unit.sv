`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

module branch_unit (
    input  logic                 [31:0] operand_a_i,
    input  logic                 [31:0] operand_b_i,
    input  logic                 [31:0] pc_i,
    input  logic                 [31:0] imm_i,
    input  rv32_pkg::branch_op_e        branch_op_i,
    input  logic                        branch_i,
    input  logic                        jump_i,
    output logic                 [31:0] target_o,
    output logic                        taken_o
);

  logic branch_condition;

  always_comb begin
    unique case (branch_op_i)
      BRANCH_EQ:  branch_condition = (operand_a_i == operand_b_i);
      BRANCH_NE:  branch_condition = (operand_a_i != operand_b_i);
      BRANCH_LT:  branch_condition = ($signed(operand_a_i) < $signed(operand_b_i));
      BRANCH_GE:  branch_condition = ($signed(operand_a_i) >= $signed(operand_b_i));
      BRANCH_LTU: branch_condition = (operand_a_i < operand_b_i);
      BRANCH_GEU: branch_condition = (operand_a_i >= operand_b_i);
      default:    branch_condition = 1'b0;
    endcase
  end

  assign taken_o  = (branch_i && branch_condition) || jump_i;
  assign target_o = pc_i + imm_i;

endmodule
