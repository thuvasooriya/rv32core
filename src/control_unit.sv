`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

module control_unit
  import rv32_pkg::*;
(
    input  logic    [6:0] opcode_i,
    input  logic    [2:0] funct3_i,
    input  logic    [6:0] funct7_i,
    output logic          reg_write_o,
    output logic          mem_read_o,
    output logic          mem_write_o,
    output logic          branch_o,
    output logic          alu_src_o,
    output alu_op_e       alu_op_o
);

  always_comb begin
    // default values
    reg_write_o = 1'b0;
    mem_read_o  = 1'b0;
    mem_write_o = 1'b0;
    branch_o    = 1'b0;
    alu_src_o   = 1'b0;
    alu_op_o    = ALU_ADD;

    unique case (opcode_i)
      R_TYPE: begin
        reg_write_o = 1'b1;
        unique case (funct3_i)
          3'b000: alu_op_o = (funct7_i[5]) ? ALU_SUB : ALU_ADD;
          3'b001: alu_op_o = ALU_SLL;
          3'b010: alu_op_o = ALU_SLT;
          3'b011: alu_op_o = ALU_SLTU;
          3'b100: alu_op_o = ALU_XOR;
          3'b101: alu_op_o = (funct7_i[5]) ? ALU_SRA : ALU_SRL;
          3'b110: alu_op_o = ALU_OR;
          3'b111: alu_op_o = ALU_AND;
        endcase
      end

      I_TYPE: begin
        reg_write_o = 1'b1;
        alu_src_o   = 1'b1;
        // Similar ALU operation mapping as R-type
      end

      LOAD: begin
        reg_write_o = 1'b1;
        mem_read_o  = 1'b1;
        alu_src_o   = 1'b1;
      end

      STORE: begin
        mem_write_o = 1'b1;
        alu_src_o   = 1'b1;
      end

      BRANCH: begin
        branch_o = 1'b1;
      end

      // ... other instruction types
    endcase
  end

endmodule
