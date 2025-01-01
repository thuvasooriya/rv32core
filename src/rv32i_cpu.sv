module rv32i_cpu #(
    parameter ADDR_WIDTH = 32,
    DATA_WIDTH = 32
) (
    input logic clk,
    input logic reset
);
  // PC signals
  logic [ADDR_WIDTH-1:0] pc, next_pc;
  logic [DATA_WIDTH-1:0] instruction;

  // Control signals
  logic reg_write, mem_to_reg, mem_write, alu_src;
  logic [3:0] alu_op;

  // Register file signals
  logic [4:0] rs1, rs2, rd;
  logic [DATA_WIDTH-1:0] reg_data1, reg_data2, write_data;

  // ALU signals
  logic [DATA_WIDTH-1:0] alu_operand_b, alu_result;
  logic alu_zero;

  // Fetch instruction
  instruction_fetch #(
      .ADDR_WIDTH(ADDR_WIDTH),
      .DATA_WIDTH(DATA_WIDTH)
  ) fetch (
      .clk(clk),
      .reset(reset),
      .pc_in(next_pc),
      .pc_out(pc),
      .instruction(instruction)
  );

  // Decode instruction
  assign rs1 = instruction[19:15];
  assign rs2 = instruction[24:20];
  assign rd  = instruction[11:7];

  control_unit control (
      .opcode(instruction[6:0]),
      .reg_write(reg_write),
      .mem_to_reg(mem_to_reg),
      .mem_write(mem_write),
      .alu_src(alu_src),
      .alu_op(alu_op)
  );

  register_file #(
      .REG_WIDTH(DATA_WIDTH)
  ) register_file_inst (
      .clk(clk),
      .rs1(rs1),
      .rs2(rs2),
      .rd(rd),
      .write_data(write_data),
      .reg_write(reg_write),
      .read_data1(reg_data1),
      .read_data2(reg_data2)
  );

  // ALU
  // assign alu_operand_b = alu_src ? instruction[31:20] : reg_data2;
  assign alu_operand_b = alu_src ? {{20{instruction[31]}}, instruction[31:20]} : reg_data2;

  alu #(
      .WIDTH(DATA_WIDTH)
  ) alu_inst (
      .operand_a(reg_data1),
      .operand_b(alu_operand_b),
      .alu_op(alu_op),
      .result(alu_result),
      .zero(alu_zero)
  );

  // Next PC logic
  assign next_pc = pc + 4;

  // Write-back
  assign write_data = mem_to_reg ? alu_result : alu_result;

endmodule
