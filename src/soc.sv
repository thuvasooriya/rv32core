`default_nettype none

module soc (
    input  logic       clk,
    input  logic       rst_n,
    output logic [4:0] leds,
    input  logic       rxd_i,
    output logic       txd_o
);
  logic clk_internal;
  logic resetn;

  logic [4:0] count = 0;
  always @(posedge clk) begin
    count <= resetn ? 0 : count + 1;
  end

  clkworks #(
      .SLOW(21)  // Divide clock frequency by 2^21
  ) cw_inst (
      .clk(clk),
      .reset(rst_n),
      .clk_o(clk_internal),
      .resetn(resetn)
  );

  assign leds  = count;
  assign txd_o = 1'b0;  // not used for now

endmodule
