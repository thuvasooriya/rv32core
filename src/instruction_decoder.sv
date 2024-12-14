module instruction_decoder
    import rv32_pkg::*;
(
    input  logic           [31:0] instr_raw_i,
    output decoded_instr_t        decoded_instr_o
);
    // cast raw instruction to structured type
    rv32_inst_t instr;
    assign instr = rv32_inst_t'(instr_raw_i);

    opcode_e      opcode;
    rtype_funct_e r_funct;

    // extract opcode
    assign opcode  = opcode_e'(instr.opcode);

    // combine funct3 and funct7 for r-type instructions
    assign r_funct = rtype_funct_e'({instr.funct7[5], instr.funct3});

    always_comb begin
        decoded_instr_o = '0;
        decoded_instr_o.rs1 = instr.rs1;
        decoded_instr_o.rs2 = instr.rs2;
        decoded_instr_o.rd = instr.rd;

        unique case (opcode)
            OP_OP: begin
                decoded_instr_o.reg_write = 1'b1;
                unique case (r_funct)
                    R_ADD: decoded_instr_o.alu_op = ALU_ADD;
                    R_SUB: decoded_instr_o.alu_op = ALU_SUB;
                    R_SLL: decoded_instr_o.alu_op = ALU_SLL;
                    R_SLT: decoded_instr_o.alu_op = ALU_SLT;
                    R_SLTU: decoded_instr_o.alu_op = ALU_SLTU;
                    R_XOR: decoded_instr_o.alu_op = ALU_XOR;
                    R_SRL: decoded_instr_o.alu_op = ALU_SRL;
                    R_SRA: decoded_instr_o.alu_op = ALU_SRA;
                    R_OR: decoded_instr_o.alu_op = ALU_OR;
                    R_AND: decoded_instr_o.alu_op = ALU_AND;
                    default: decoded_instr_o.alu_op = ALU_ADD;
                endcase
            end

            OP_OP_IMM: begin
                decoded_instr_o.reg_write = 1'b1;
                decoded_instr_o.imm = {{20{instr_raw_i[31]}}, instr_raw_i[31:20]};

                unique case (instr.funct3)
                    3'b000: decoded_instr_o.alu_op = ALU_ADD;  // ADDI
                    3'b010: decoded_instr_o.alu_op = ALU_SLT;  // SLTI
                    3'b011: decoded_instr_o.alu_op = ALU_SLTU;  // SLTUI
                    3'b100: decoded_instr_o.alu_op = ALU_XOR;  // XORI
                    3'b110: decoded_instr_o.alu_op = ALU_OR;  // ORI
                    3'b111: decoded_instr_o.alu_op = ALU_AND;  // ANDI
                    3'b001: decoded_instr_o.alu_op = ALU_SLL;  // SLLI
                    3'b101:
                    decoded_instr_o.alu_op = instr_raw_i[30] ? ALU_SRA : ALU_SRL;  // SRAI/SRLI
                    default: decoded_instr_o.alu_op = ALU_ADD;
                endcase
            end

            OP_LOAD: begin
                decoded_instr_o.reg_write = 1'b1;
                decoded_instr_o.mem_read = 1'b1;
                decoded_instr_o.imm = {{20{instr_raw_i[31]}}, instr_raw_i[31:20]};
                decoded_instr_o.alu_op = ALU_ADD;
                decoded_instr_o.mem_size = instr.funct3;
            end

            OP_STORE: begin
                decoded_instr_o.mem_write = 1'b1;
                decoded_instr_o.imm = {
                    {20{instr_raw_i[31]}}, instr_raw_i[31:25], instr_raw_i[11:7]
                };
                decoded_instr_o.alu_op = ALU_ADD;
                decoded_instr_o.mem_size = instr.funct3;
            end

            OP_BRANCH: begin
                decoded_instr_o.branch = 1'b1;
                decoded_instr_o.imm = {
                    {20{instr_raw_i[31]}},
                    instr_raw_i[7],
                    instr_raw_i[30:25],
                    instr_raw_i[11:8],
                    1'b0
                };
                decoded_instr_o.branch_op = branch_op_e'(instr.funct3);
            end

            OP_JAL: begin
                decoded_instr_o.jump = 1'b1;
                decoded_instr_o.reg_write = 1'b1;
                decoded_instr_o.imm = {
                    {12{instr_raw_i[31]}},
                    instr_raw_i[19:12],
                    instr_raw_i[20],
                    instr_raw_i[30:21],
                    1'b0
                };
            end

            OP_JALR: begin
                decoded_instr_o.jump = 1'b1;
                decoded_instr_o.reg_write = 1'b1;
                decoded_instr_o.imm = {{20{instr_raw_i[31]}}, instr_raw_i[31:20]};
            end

            OP_LUI: begin
                decoded_instr_o.reg_write = 1'b1;
                decoded_instr_o.imm = {instr_raw_i[31:12], 12'b0};
                decoded_instr_o.alu_op = ALU_PASS;
            end

            OP_AUIPC: begin
                decoded_instr_o.reg_write = 1'b1;
                decoded_instr_o.imm = {instr_raw_i[31:12], 12'b0};
                decoded_instr_o.alu_op = ALU_ADD;
            end

            default: decoded_instr_o = '0;
        endcase
    end

endmodule
