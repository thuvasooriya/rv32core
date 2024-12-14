module alu
    import rv32_pkg::alu_op_e;
(
    input  logic    [31:0] operand_a_i,
    input  logic    [31:0] operand_b_i,
    input  alu_op_e        operator_i,
    output logic    [31:0] result_o
);
    always_comb begin
        unique case (operator_i)
            alu_add:  result_o = operand_a_i + operand_b_i;
            alu_sub:  result_o = operand_a_i - operand_b_i;
            alu_sll:  result_o = operand_a_i << operand_b_i[4:0];
            alu_slt:  result_o = $signed(operand_a_i) < $signed(operand_b_i);
            alu_sltu: result_o = operand_a_i < operand_b_i;
            alu_xor:  result_o = operand_a_i ^ operand_b_i;
            alu_srl:  result_o = operand_a_i >> operand_b_i[4:0];
            alu_sra:  result_o = $signed(operand_a_i) >>> operand_b_i[4:0];
            alu_or:   result_o = operand_a_i | operand_b_i;
            alu_and:  result_o = operand_a_i & operand_b_i;
            alu_pass: result_o = operand_b_i;
            default:  result_o = '0;
        endcase
    end
endmodule
