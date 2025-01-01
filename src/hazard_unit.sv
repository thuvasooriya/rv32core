`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

module hazard_unit
  import rv32_pkg::*;
(
    input  logic [4:0] rs1_addr_i,
    input  logic [4:0] rs2_addr_i,
    input  logic [4:0] ex_rd_i,
    input  logic [4:0] mem_rd_i,
    input  logic       ex_mem_read_i,
    output logic       stall_o
);

  always_comb begin
    stall_o = 1'b0;

    // Load-use hazard
    if (ex_mem_read_i && ((ex_rd_i == rs1_addr_i) || (ex_rd_i == rs2_addr_i))) begin
      stall_o = 1'b1;
    end
  end

endmodule
