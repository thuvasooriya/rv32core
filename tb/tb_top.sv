`define TEST_BENCH_LOADED

`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

`ifndef TB_PKG_HEADER
`define TB_PKG_HEADER
`include "tb_pkg.svh"
`endif

module tb_top;
  import tb_pkg::*;
  import rv32_pkg::*;

  // Clock and reset
  logic        clk;
  logic        rst_n;

  // DUT signals
  logic [31:0] instr_addr;
  logic [31:0] instr_rdata;
  logic        instr_req;
  logic        instr_gnt;
  logic        instr_rvalid;

  logic [31:0] data_addr;
  logic [31:0] data_wdata;
  logic [31:0] data_rdata;
  logic        data_req;
  logic        data_we;
  logic [ 3:0] data_be;
  logic        data_gnt;
  logic        data_rvalid;

  // DUT instantiation
  rv32_core dut (.*);

  // Instruction memory
  memory_model #(
      .MEM_SIZE(IMEM_SIZE),
      .INSTRUCTION_MEMORY(1)
  ) i_mem (
      .clk_i(clk),
      .rst_ni(rst_n),
      .addr_i(instr_addr),
      .wdata_i('0),
      .req_i(instr_req),
      .we_i('0),
      .be_i('0),
      .rdata_o(instr_rdata),
      .gnt_o(instr_gnt),
      .rvalid_o(instr_rvalid)
  );

  // Data memory
  memory_model #(
      .MEM_SIZE(DMEM_SIZE),
      .INSTRUCTION_MEMORY(0)
  ) d_mem (
      .clk_i(clk),
      .rst_ni(rst_n),
      .addr_i(data_addr),
      .wdata_i(data_wdata),
      .req_i(data_req),
      .we_i(data_we),
      .be_i(data_be),
      .rdata_o(data_rdata),
      .gnt_o(data_gnt),
      .rvalid_o(data_rvalid)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Reset generation
  initial begin
    rst_n = 0;
    repeat (5) @(posedge clk);
    rst_n = 1;
  end

  // Basic checking
  always @(posedge clk) begin
    if (rst_n) begin
      assert (instr_addr < IMEM_SIZE)
      else $error("PC out of range");
      if (data_req) begin
        assert (data_addr < DMEM_SIZE)
        else $error("Data address out of range");
      end
    end
  end

endmodule
