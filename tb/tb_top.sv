module tb_top;
  // Parameters
  localparam ADDR_WIDTH = 32;
  localparam DATA_WIDTH = 32;
  localparam MEM_DEPTH = 1024;  // Size of memory in words

  // Signals
  logic clk, reset;
  logic [ADDR_WIDTH-1:0] pc;
  logic [DATA_WIDTH-1:0] instruction;
  logic [DATA_WIDTH-1:0] mem_data_in, mem_data_out;
  logic mem_write, mem_read;
  logic [ADDR_WIDTH-1:0] mem_addr;

  // Instantiate the DUT (Device Under Test)
  rv32i_cpu #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) dut (
      .clk  (clk),
      .reset(reset)
  );

  // Memory Model
  logic [DATA_WIDTH-1:0] memory[0:MEM_DEPTH-1];

  // Clock Generation
  initial clk = 0;
  always #5 clk = ~clk;

  // Reset Generation
  initial begin
    reset = 1;
    #10 reset = 0;
  end

  // Memory Interface
  always_ff @(posedge clk) begin
    if (mem_write) begin
      memory[mem_addr>>2] <= mem_data_out;
    end
  end

  assign mem_data_in = memory[mem_addr>>2];

  // Preload Instruction Memory
  initial begin
    // Load test program into memory
    // Replace these instructions with your RV32I test program
    memory[0] = 32'h00000093;  // NOP (ADDI x1, x0, 0)
    memory[1] = 32'h00100093;  // ADDI x1, x0, 1
    memory[2] = 32'h00208133;  // ADD x2, x1, x2
    memory[3] = 32'h00310113;  // ADDI x2, x2, 3
    memory[4] = 32'h00400063;  // BEQ x0, x0, +4 (branch)
    memory[5] = 32'h005081B3;  // ADD x3, x1, x5
    memory[6] = 32'h00000073;  // ECALL (halt simulation)
  end

  // Monitor CPU Execution
  always_ff @(posedge clk) begin
    if (!reset) begin
      // Log current PC and instruction
      $display("PC: %h, Instruction: %h", pc, instruction);

      // Halt simulation on ECALL
      if (instruction == 32'h00000073) begin
        $display("Simulation complete.");
        $finish;
      end
    end
  end

  // Assertions
  initial begin
    @(negedge reset);
    // Check for basic instruction correctness
    #50;
    assert (dut.register_file_inst.registers[1] == 1)
    else $fatal("Test failed: ADDI x1, x0, 1");
    assert (dut.register_file_inst.registers[2] == 5)
    else $fatal("Test failed: ADD x2, x1, x2 and ADDI x2, x2, 3");
    $display("All tests passed!");
    $finish;
  end
endmodule
