module alu #(
    parameter WIDTH = 32
) (
    input  logic [WIDTH-1:0] operand_a,
    input  logic [WIDTH-1:0] operand_b,
    input  logic [      3:0] alu_op,
    output logic [WIDTH-1:0] result,
    output logic             zero
);
  always_comb begin
    case (alu_op)
      4'b0000: result = operand_a + operand_b;  // ADD
      4'b0001: result = operand_a - operand_b;  // SUB
      4'b0010: result = operand_a & operand_b;  // AND
      4'b0011: result = operand_a | operand_b;  // OR
      4'b0100: result = operand_a ^ operand_b;  // XOR
      4'b0101: result = operand_a << operand_b[4:0];  // SLL
      4'b0110: result = operand_a >> operand_b[4:0];  // SRL
      4'b0111: result = $signed(operand_a) >>> operand_b[4:0];  // SRA
      default: result = 0;
    endcase
    zero = (result == 0);
  end
endmodule
