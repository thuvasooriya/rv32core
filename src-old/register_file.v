// why don't we need a reset
// will assigning rd directly without reset cause any metastability?
// initializing registers?
module register_file (
    input logic clk,
    input logic rst_n_i,
    input logic wen_i,
    // how many wires do we need here? 5 or 6
    input logic [4:0] raddr1_i,
    input logic [4:0] raddr2_i,
    input logic [4:0] waddr_i,
    input logic [31:0] wdata_i,

    output logic [31:0] rdata1_o,
    output logic [31:0] rdata2_o
);

  reg [31:0] regs[30];
  // unpacking structs in the recommended way makes the below code look
  // strange
  // why do we unpack like this?

  assign rdata1_o = regs[~raddr1_i];
  assign rdata2_o = regs[~raddr2_i];

  always_ff @(posedge clk) begin
    if (wen_i) regs[~waddr_i] <= wdata_i;
  end

endmodule

