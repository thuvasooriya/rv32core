module control_unit (
    input  logic [6:0] opcode,
    output logic       reg_write,
    output logic       mem_to_reg,
    output logic       mem_write,
    output logic       alu_src,
    output logic [3:0] alu_op
);
  always_comb begin
    case (opcode)
      7'b0110011: begin  // R-type
        reg_write = 1;
        mem_to_reg = 0;
        mem_write = 0;
        alu_src = 0;
        alu_op = 4'b0000;  // ADD by default
      end
      7'b0010011: begin  // I-type
        reg_write = 1;
        mem_to_reg = 0;
        mem_write = 0;
        alu_src = 1;
        alu_op = 4'b0000;  // ADDI
      end
      7'b0000011: begin  // Load
        reg_write = 1;
        mem_to_reg = 1;
        mem_write = 0;
        alu_src = 1;
        alu_op = 4'b0000;  // ADD
      end
      7'b0100011: begin  // Store
        reg_write = 0;
        mem_to_reg = 0;
        mem_write = 1;
        alu_src = 1;
        alu_op = 4'b0000;  // ADD
      end
      default: begin
        reg_write = 0;
        mem_to_reg = 0;
        mem_write = 0;
        alu_src = 0;
        alu_op = 4'b0000;
      end
    endcase
  end
endmodule
