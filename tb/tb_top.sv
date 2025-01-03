`default_nettype none

module tb_top ();
  logic clk;
  logic reset = 0;
  logic [3:0] led;
  logic rxd = 1'b0;
  logic txd;

  soc uut (
      .clk  (clk),
      .reset(reset),
      .led  (led),
      .rxd_i(rxd),
      .txd_o(txd)
  );

  logic [3:0] prev_led = 0;

  initial begin
    clk = 0;
    forever begin
      #1 clk = ~clk;
      if (led != prev_led) begin
        $display("leds = %b", led);
      end
      prev_led = led;
    end
  end

  initial begin
    $dumpfile("sim/tb_top.vcd");
    $dumpvars(0, tb_top);
  end
  initial begin
    #500;
    $display("testbench timeout.");
    $finish;
  end

endmodule
