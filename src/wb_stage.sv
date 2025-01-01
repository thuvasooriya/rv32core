`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

module wb_stage
  import rv32_pkg::*;
(
    input  logic                        clk_i,
    input  logic                        rst_ni,
    // Pipeline register
    input  mem_wb_pipeline_reg_t        mem_wb_i,
    // Register file write port
    output logic                 [31:0] wb_data_o,
    output logic                 [ 4:0] wb_addr_o,
    output logic                        wb_en_o,
    // Status outputs
    output logic                        wb_valid_o
);

  // Register write-back
  always_comb begin
    wb_data_o  = mem_wb_i.result;
    wb_addr_o  = mem_wb_i.rd_addr;
    wb_en_o    = mem_wb_i.reg_write && mem_wb_i.valid;
    wb_valid_o = mem_wb_i.valid;
  end

endmodule
