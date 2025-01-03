`default_nettype none

module soc (
    input  wire        clk,
    input  wire        reset,
    output logic [3:0] led,
    input  wire        rxd_i,
    output logic       txd_o
);

  logic clk_internal;  // internal clock
  logic resetn;  // internal reset signal, goes low on reset

  reg [31:0] pc = 0;
  reg [31:0] mem[0:255];
  initial begin
    mem[0]  = 4'b0000;
    mem[1]  = 4'b0001;
    mem[2]  = 4'b0010;
    mem[3]  = 4'b0100;
    mem[4]  = 4'b1000;
    mem[5]  = 4'b0000;
    mem[6]  = 4'b0001;
    mem[7]  = 4'b0010;
    mem[8]  = 4'b0100;
    mem[9]  = 4'b1000;
    mem[10] = 4'b1001;
    mem[11] = 4'b1010;
    mem[12] = 4'b1100;
    mem[13] = 4'b1101;
    mem[14] = 4'b1110;
    mem[15] = 4'b1111;
  end

  logic [3:0] led_val = 0;
  assign led = led_val;

  always_ff @(posedge clk_internal) begin
    led_val <= mem[pc];
    pc <= (!resetn || pc == 15) ? 0 : (pc + 1);
  end

  clkworks #(
      .SLOW(22)  // divide clock frequency by 2^21
  ) cw_inst (
      .clk(clk),
      .reset(reset),
      .clk_o(clk_internal),
      .resetn(resetn)
  );

  assign txd_o = 1'b0;  // not used for now

endmodule
