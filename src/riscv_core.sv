`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "riscv_pkg.svh"
`endif

import riscv_pkg::*;

module riscv_core (
    input logic clk_i,
    input logic rst_ni,

    // Instruction memory interface
    output logic [31:0] imem_addr_o,
    input  logic [31:0] imem_data_i,

    // Data memory interface
    output logic [31:0] dmem_addr_o,
    output logic [31:0] dmem_wdata_o,
    output logic [ 3:0] dmem_be_o,
    output logic        dmem_we_o,
    input  logic [31:0] dmem_rdata_i
);
  // Internal registers and signals
  logic [31:0] registers[32];
  logic [31:0] pc_current, pc_next;

  // Instruction decode
  logic [6:0] opcode;
  logic [2:0] funct3;
  logic [6:0] funct7;
  logic [4:0] rd, rs1, rs2;
  logic [31:0] imm;

  // Execution signals
  logic [31:0] rs1_data, rs2_data;
  logic          [31:0] alu_result;
  logic          [31:0] alu_op2;
  logic                 branch_taken;

  ctrl_signals_t        ctrl;

  // Instruction decode
  assign opcode = imem_data_i[6:0];
  assign rd     = imem_data_i[11:7];
  assign funct3 = imem_data_i[14:12];
  assign rs1    = imem_data_i[19:15];
  assign rs2    = imem_data_i[24:20];
  assign funct7 = imem_data_i[31:25];

  // Control logic
  always_comb begin
    // Default values
    ctrl = '0;

    case (opcode_e'(opcode))
      OP: begin  // R-type
        ctrl.reg_write = 1'b1;
        ctrl.alu_op = decode_r_type(funct3, funct7[5]);
        ctrl.alu_src = 1'b0;
      end

      OP_IMM: begin  // I-type ALU
        ctrl.reg_write = 1'b1;
        ctrl.alu_op = decode_i_type(funct3);
        ctrl.alu_src = 1'b1;
      end

      LOAD: begin
        ctrl.reg_write = 1'b1;
        ctrl.mem_read = 1'b1;
        ctrl.alu_op = ALU_ADD;
        ctrl.alu_src = 1'b1;
        case (load_funct3_e'(funct3))
          LOAD_FUNC3_BYTE: begin
            ctrl.mem_size = SIZE_BYTE;
            ctrl.mem_unsigned = 1'b0;
          end
          LOAD_FUNC3_HALF: begin
            ctrl.mem_size = SIZE_HALF;
            ctrl.mem_unsigned = 1'b0;
          end
          LOAD_FUNC3_WORD: begin
            ctrl.mem_size = SIZE_WORD;
            ctrl.mem_unsigned = 1'b0;
          end
          LOAD_FUNC3_UBYTE: begin
            ctrl.mem_size = SIZE_BYTE;
            ctrl.mem_unsigned = 1'b1;
          end
          LOAD_FUNC3_UHALF: begin
            ctrl.mem_size = SIZE_HALF;
            ctrl.mem_unsigned = 1'b1;
          end
          default: begin
            ctrl.mem_size = SIZE_WORD;
            ctrl.mem_unsigned = 1'b0;
          end
        endcase
      end

      STORE: begin
        ctrl.mem_write = 1'b1;
        ctrl.alu_op = ALU_ADD;
        ctrl.alu_src = 1'b1;
        case (store_funct3_e'(funct3))
          STORE_FUNC3_BYTE: ctrl.mem_size = SIZE_BYTE;
          STORE_FUNC3_HALF: ctrl.mem_size = SIZE_HALF;
          STORE_FUNC3_WORD: ctrl.mem_size = SIZE_WORD;
          default:          ctrl.mem_size = SIZE_WORD;
        endcase
      end

      BRANCH: begin
        ctrl.branch  = 1'b1;
        ctrl.alu_op  = ALU_SUB;
        ctrl.alu_src = 1'b0;
      end

      JAL: begin
        ctrl.jump = 1'b1;
        ctrl.reg_write = 1'b1;
      end

      JALR: begin
        ctrl.jump = 1'b1;
        ctrl.reg_write = 1'b1;
        ctrl.alu_src = 1'b1;
        ctrl.alu_op = ALU_ADD;
      end

      LUI: begin
        ctrl.reg_write = 1'b1;
        ctrl.alu_src = 1'b1;
        ctrl.alu_op = ALU_ADD;
      end

      AUIPC: begin
        ctrl.reg_write = 1'b1;
        ctrl.alu_src = 1'b1;
        ctrl.alu_op = ALU_ADD;
      end

      default: ctrl = '0;
    endcase
  end

  // Immediate generation
  always_comb begin
    case (opcode_e'(opcode))
      OP_IMM, LOAD, JALR:  // I-type
      imm = {{20{imem_data_i[31]}}, imem_data_i[31:20]};

      STORE:  // S-type
      imm = {{20{imem_data_i[31]}}, imem_data_i[31:25], imem_data_i[11:7]};

      BRANCH:  // B-type
      imm = {{20{imem_data_i[31]}}, imem_data_i[7], imem_data_i[30:25], imem_data_i[11:8], 1'b0};

      LUI, AUIPC:  // U-type
      imm = {imem_data_i[31:12], 12'b0};

      JAL:  // J-type
      imm = {{12{imem_data_i[31]}}, imem_data_i[19:12], imem_data_i[20], imem_data_i[30:21], 1'b0};

      default: imm = '0;
    endcase
  end

  // Register file read
  assign rs1_data = (rs1 == '0) ? '0 : registers[rs1];
  assign rs2_data = (rs2 == '0) ? '0 : registers[rs2];

  // ALU operand selection
  assign alu_op2  = ctrl.alu_src ? imm : rs2_data;

  // ALU
  always_comb begin
    case (ctrl.alu_op)
      ALU_ADD:  alu_result = rs1_data + alu_op2;
      ALU_SUB:  alu_result = rs1_data - alu_op2;
      ALU_SLL:  alu_result = rs1_data << alu_op2[4:0];
      ALU_SLT:  alu_result = {31'b0, $signed(rs1_data) < $signed(alu_op2)};
      ALU_SLTU: alu_result = {31'b0, rs1_data < alu_op2};
      ALU_XOR:  alu_result = rs1_data ^ alu_op2;
      ALU_SRL:  alu_result = rs1_data >> alu_op2[4:0];
      ALU_SRA:  alu_result = $signed(rs1_data) >>> alu_op2[4:0];
      ALU_OR:   alu_result = rs1_data | alu_op2;
      ALU_AND:  alu_result = rs1_data & alu_op2;
      default:  alu_result = '0;
    endcase
  end

  // Branch condition
  always_comb begin
    case (branch_funct3_e'(funct3))
      BRANCH_FUNC3_BEQ:  branch_taken = (alu_result == '0);
      BRANCH_FUNC3_BNE:  branch_taken = (alu_result != '0);
      BRANCH_FUNC3_BLT:  branch_taken = alu_result[0];
      BRANCH_FUNC3_BGE:  branch_taken = ~alu_result[0];
      BRANCH_FUNC3_BLTU: branch_taken = alu_result[0];
      BRANCH_FUNC3_BGEU: branch_taken = ~alu_result[0];
      default:           branch_taken = 1'b0;
    endcase
  end

  // Memory access control
  always_comb begin
    dmem_addr_o  = alu_result;
    dmem_wdata_o = rs2_data;
    dmem_we_o    = ctrl.mem_write;

    case (ctrl.mem_size)
      SIZE_BYTE: dmem_be_o = 4'b0001 << alu_result[1:0];
      SIZE_HALF: dmem_be_o = 4'b0011 << {alu_result[1], 1'b0};
      SIZE_WORD: dmem_be_o = 4'b1111;
      default:   dmem_be_o = 4'b0000;
    endcase
  end

  // Next PC calculation
  always_comb begin
    if (ctrl.jump) begin
      if (opcode_e'(opcode) == JALR) pc_next = {alu_result[31:1], 1'b0};
      else pc_next = pc_current + imm;
    end else if (ctrl.branch && branch_taken) pc_next = pc_current + imm;
    else pc_next = pc_current + 4;
  end


  logic [31:0] load_data;

  always_comb begin
    case (ctrl.mem_size)
      SIZE_BYTE: begin
        case (alu_result[1:0])
          2'b00:
          load_data = ctrl.mem_unsigned ? {24'b0, dmem_rdata_i[7:0]} :
                                                         {{24{dmem_rdata_i[7]}}, dmem_rdata_i[7:0]};
          2'b01:
          load_data = ctrl.mem_unsigned ? {24'b0, dmem_rdata_i[15:8]} :
                                                         {{24{dmem_rdata_i[15]}}, dmem_rdata_i[15:8]};
          2'b10:
          load_data = ctrl.mem_unsigned ? {24'b0, dmem_rdata_i[23:16]} :
                                                         {{24{dmem_rdata_i[23]}}, dmem_rdata_i[23:16]};
          2'b11:
          load_data = ctrl.mem_unsigned ? {24'b0, dmem_rdata_i[31:24]} :
                                                         {{24{dmem_rdata_i[31]}}, dmem_rdata_i[31:24]};
        endcase
      end
      SIZE_HALF: begin
        case (alu_result[1])
          1'b0:
          load_data = ctrl.mem_unsigned ? {16'b0, dmem_rdata_i[15:0]} :
                                                        {{16{dmem_rdata_i[15]}}, dmem_rdata_i[15:0]};
          1'b1:
          load_data = ctrl.mem_unsigned ? {16'b0, dmem_rdata_i[31:16]} :
                                                        {{16{dmem_rdata_i[31]}}, dmem_rdata_i[31:16]};
        endcase
      end
      default: load_data = dmem_rdata_i;  // WORD
    endcase
  end

  // Register write back
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      for (int i = 0; i < 32; i++) registers[i] <= '0;
      pc_current <= '0;
    end else begin
      pc_current <= pc_next;

      if (ctrl.reg_write && (rd != '0)) begin
        if (ctrl.mem_read) registers[rd] <= load_data;
        else if (ctrl.jump) registers[rd] <= pc_current + 4;
        else if (opcode_e'(opcode) == LUI) registers[rd] <= imm;
        else if (opcode_e'(opcode) == AUIPC) registers[rd] <= pc_current + imm;
        else registers[rd] <= alu_result;
      end
    end
  end

  // Instruction fetch
  assign imem_addr_o = pc_current;

  // Helper functions
  function automatic alu_op_e decode_r_type(input logic [2:0] funct3, input logic funct7_5);
    case (alu_funct3_e'(funct3))
      ALU_FUNC3_ADD_SUB: return funct7_5 ? ALU_SUB : ALU_ADD;
      ALU_FUNC3_SLL:     return ALU_SLL;
      ALU_FUNC3_SLT:     return ALU_SLT;
      ALU_FUNC3_SLTU:    return ALU_SLTU;
      ALU_FUNC3_XOR:     return ALU_XOR;
      ALU_FUNC3_SRL_SRA: return funct7_5 ? ALU_SRA : ALU_SRL;
      ALU_FUNC3_OR:      return ALU_OR;
      ALU_FUNC3_AND:     return ALU_AND;
      default:           return ALU_ADD;
    endcase
  endfunction

  function automatic alu_op_e decode_i_type(input logic [2:0] funct3);
    case (alu_funct3_e'(funct3))
      ALU_FUNC3_ADD_SUB: return ALU_ADD;
      ALU_FUNC3_SLL:     return ALU_SLL;
      ALU_FUNC3_SLT:     return ALU_SLT;
      ALU_FUNC3_SLTU:    return ALU_SLTU;
      ALU_FUNC3_XOR:     return ALU_XOR;
      ALU_FUNC3_SRL_SRA: return (imm[11:5] == 7'b0100000) ? ALU_SRA : ALU_SRL;
      ALU_FUNC3_OR:      return ALU_OR;
      ALU_FUNC3_AND:     return ALU_AND;
      default:           return ALU_ADD;
    endcase
  endfunction

endmodule
