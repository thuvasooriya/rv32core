
module tb_top ();
  logic clk;
  logic reset = 0;
  logic [4:0] leds;
  logic rxd = 1'b0;
  logic txd;

  soc uut (
      .clk  (clk),
      .rst_n(reset),
      .leds (leds),
      .rxd_i(rxd),
      .txd_o(txd)
  );

  logic [4:0] prev_leds = 0;
  initial begin
    clk = 0;
    forever begin
      #1 clk = ~clk;
      if (leds != prev_leds) begin
        $display("leds = %b", leds);
      end
      prev_leds <= leds;
    end
  end
endmodule
