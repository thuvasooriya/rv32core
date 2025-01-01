`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

module if_stage
  import rv32_pkg::*;
(
    input  logic                       clk_i,
    input  logic                       rst_ni,
    // pipeline control
    input  logic                       stall_i,
    input  logic                       flush_i,
    // branch interface
    input  logic                [31:0] branch_target_i,
    input  logic                       branch_taken_i,
    // instruction memory interface
    output logic                [31:0] instr_addr_o,
    input  logic                [31:0] instr_rdata_i,
    output logic                       instr_req_o,
    input  logic                       instr_gnt_i,
    input  logic                       instr_rvalid_i,
    // pipeline output
    output if_id_pipeline_reg_t        if_id_o
);

  logic [31:0] pc_q, pc_next;
  logic fetch_valid;

  // pc update logic
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      pc_q <= RESET_ADDR;
      fetch_valid <= 1'b0;
    end else if (!stall_i) begin
      pc_q <= pc_next;
      fetch_valid <= instr_rvalid_i;
    end
  end

  // next pc calculation
  always_comb begin
    if (branch_taken_i) pc_next = branch_target_i;
    else if (!stall_i) pc_next = pc_q + 4;
    else pc_next = pc_q;
  end

  // instruction memory interface
  assign instr_addr_o = pc_q;
  assign instr_req_o  = !stall_i;

  // pipeline register outputs
  always_comb begin
    if_id_o = '0;
    if (!flush_i) begin
      if_id_o.pc    = pc_q;
      if_id_o.instr = instr_rdata_i;
      if_id_o.valid = fetch_valid && !branch_taken_i;
    end
  end

endmodule
