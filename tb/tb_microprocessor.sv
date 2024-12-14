module tb_microprocessor ();
  reg clk;
  reg [31:0] instruction;
  reg rst;
  wire [31:0] res_out;

  microprocessor u_microprocessor0 (
      .clk(clk),
      .instruction(instruction),
      .rst(rst)
  );

  initial begin
    clk = 0;
    rst = 1;
    #10;
    rst = 0;
    #10;

    rst = 1;
    #120;
    #80;

    $finish;
  end

  initial begin
    $dumpfile("sim/microprocessor_tb.vcd");
    $dumpvars(0, u_microprocessor0);
  end

  always begin
    #5 clk = ~clk;
  end


  // // Instantiate the Unit Under Test (UUT)
  // pc #(.WIDTH(WIDTH)) uut (.*);
  //
  // // Clock generation
  // always #5 clk = ~clk;
  //
  // // Test stimulus
  // initial begin
  //   // Initialize inputs
  //   clk = 0;
  //   rst_n = 0;
  //   enable = 0;
  //   branch = 0;
  //   branch_target = 0;
  //   jump = 0;
  //   jump_target = 0;
  //
  //   // Reset
  //   #10 rst_n = 1;
  //
  //   // Test case 1: Normal increment
  //   #10 enable = 1;
  //   repeat (5) @(posedge clk);
  //
  //   // Test case 2: Branch
  //   branch = 1;
  //   branch_target = 32'h1000;
  //   @(posedge clk);
  //   branch = 0;
  //   repeat (3) @(posedge clk);
  //
  //   // Test case 3: Jump
  //   jump = 1;
  //   jump_target = 32'h2000;
  //   @(posedge clk);
  //   jump = 0;
  //   repeat (3) @(posedge clk);
  //
  //   // Test case 4: Disabled
  //   enable = 0;
  //   repeat (3) @(posedge clk);
  //
  //   // End simulation
  //   #10 $finish;
  // end
  //
  // // Monitor
  // always @(posedge clk) begin
  //   $display("Time=%0t: PC=%h, Enable=%b, Branch=%b, Jump=%b", $time, pc, enable, branch, jump);
  // end
  //
  // // Optional: Assertions
  // assert property (@(posedge clk) disable iff (~rst_n) (jump |-> ##1 pc == jump_target))
  // else $error("Jump failed");
  //
  // assert property (@(posedge clk) disable iff (~rst_n) (branch |-> ##1 pc == branch_target))
  // else $error("Branch failed");
  //
  // assert property (@(posedge clk) disable iff (~rst_n) (!enable |=> $stable(pc)))
  // else $error("PC changed while disabled");

endmodule

