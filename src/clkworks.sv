`default_nettype none

module clkworks #(
    parameter SLOW = 0
) (
    input  wire  clk,    // clock pin of the board
    input  wire  reset,  // reset pin of the board
    output logic clk_o,  // (optionally divided) clock for the design.
    output logic resetn  // (optionally timed) negative reset for the design (more on this later)
);

  logic [SLOW:0] slow_clk = 0;

  always_ff @(posedge clk) begin
    slow_clk <= slow_clk + 1;
  end

  assign clk_o  = slow_clk[SLOW];
  assign resetn = !reset;

endmodule
