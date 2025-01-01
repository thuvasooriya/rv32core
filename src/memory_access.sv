`default_nettype none
`ifndef RV32_PKG_HEADER
`define RV32_PKG_HEADER
`include "rv32_pkg.svh"
`endif

module memory_access
  import rv32_pkg::*;
(
    // memory interface signals
    input  logic      [31:0] addr_i,
    input  logic      [31:0] wdata_i,
    input  logic      [31:0] rdata_i,
    input  mem_size_e        mem_size_i,
    input  logic             mem_signed_i,
    input  logic             mem_read_i,
    input  logic             mem_write_i,
    // memory control outputs
    output logic      [ 3:0] be_o,
    output logic      [31:0] wdata_aligned_o,
    output logic      [31:0] rdata_aligned_o,
    // error detection
    output logic             misaligned_access_o
);

  logic [1:0] addr_offset;
  assign addr_offset = addr_i[1:0];

  // misalignment check
  always_comb begin
    misaligned_access_o = 1'b0;
    case (mem_size_i)
      MEM_HALF: misaligned_access_o = addr_i[0];
      MEM_WORD: misaligned_access_o = |addr_i[1:0];
      default:  misaligned_access_o = 1'b0;
    endcase
  end

  // byte enable generation
  always_comb begin
    be_o = 4'b0000;
    unique case (mem_size_i)
      MEM_BYTE: begin
        unique case (addr_offset)
          2'b00: be_o = 4'b0001;
          2'b01: be_o = 4'b0010;
          2'b10: be_o = 4'b0100;
          2'b11: be_o = 4'b1000;
        endcase
      end
      MEM_HALF: begin
        be_o = addr_offset[1] ? 4'b1100 : 4'b0011;
      end
      MEM_WORD: begin
        be_o = 4'b1111;
      end
      default: be_o = 4'b0000;
    endcase
  end

  // write data alignment
  always_comb begin
    wdata_aligned_o = '0;
    unique case (mem_size_i)
      MEM_BYTE: begin
        unique case (addr_offset)
          2'b00: wdata_aligned_o = {24'b0, wdata_i[7:0]};
          2'b01: wdata_aligned_o = {16'b0, wdata_i[7:0], 8'b0};
          2'b10: wdata_aligned_o = {8'b0, wdata_i[7:0], 16'b0};
          2'b11: wdata_aligned_o = {wdata_i[7:0], 24'b0};
        endcase
      end
      MEM_HALF: begin
        if (addr_offset[1]) wdata_aligned_o = {wdata_i[15:0], 16'b0};
        else wdata_aligned_o = {16'b0, wdata_i[15:0]};
      end
      MEM_WORD: begin
        wdata_aligned_o = wdata_i;
      end
      default: wdata_aligned_o = wdata_i;
    endcase
  end

  // read data alignment and sign extension
  always_comb begin
    rdata_aligned_o = '0;
    unique case (mem_size_i)
      MEM_BYTE: begin
        unique case (addr_offset)
          2'b00:
          rdata_aligned_o = mem_signed_i ? {{24{rdata_i[7]}}, rdata_i[7:0]} : {24'b0, rdata_i[7:0]};
          2'b01:
          rdata_aligned_o = mem_signed_i ? {{24{rdata_i[15]}}, rdata_i[15:8]} : {24'b0, rdata_i[15:8]};
          2'b10:
          rdata_aligned_o = mem_signed_i ? {{24{rdata_i[23]}}, rdata_i[23:16]} : {24'b0, rdata_i[23:16]};
          2'b11:
          rdata_aligned_o = mem_signed_i ? {{24{rdata_i[31]}}, rdata_i[31:24]} : {24'b0, rdata_i[31:24]};
        endcase
      end
      MEM_HALF: begin
        if (addr_offset[1])
          rdata_aligned_o = mem_signed_i ? {{16{rdata_i[31]}}, rdata_i[31:16]} : {16'b0, rdata_i[31:16]};
        else
          rdata_aligned_o = mem_signed_i ? {{16{rdata_i[15]}}, rdata_i[15:0]} : {16'b0, rdata_i[15:0]};
      end
      MEM_WORD: begin
        rdata_aligned_o = rdata_i;
      end
      default: rdata_aligned_o = rdata_i;
    endcase
  end

endmodule
