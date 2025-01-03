`default_nettype none

module tb_top ();
  logic clk;
  logic reset = 0;
  logic [4:0] led;
  logic rxd = 1'b0;
  logic txd;

  soc uut (
      .CLK  (clk),
      .RESET(reset),
      .LEDS (led),
      .RXD  (rxd),
      .TXD  (txd)
  );

  // logic [4:0] prev_led = 0;

  initial begin
    clk = 0;
    forever begin
      #1 clk = ~clk;
      // if (led != prev_led) begin
      //   $display("leds = %b", led);
      // end
      // prev_led = led;
    end
  end

  initial begin
    $dumpfile("tmp/tb_top.vcd");
    $dumpvars(0, tb_top);
  end
  // initial begin
  //   #5000;
  //   $display("testbench timeout.");
  //   $finish;
  // end

endmodule
