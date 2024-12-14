covergroup rv32i_coverage;
    option.per_instance = 1;

    // Instruction type coverage
    cp_opcode: coverpoint rv32_pkg::opcode_e {
        bins valid_opcodes[] = {
            OP_LUI, OP_AUIPC, OP_JAL, OP_JALR,
            OP_BRANCH, OP_LOAD, OP_STORE,
            OP_OP_IMM, OP_OP
        };
    }

    // Register usage coverage
    cp_rs1: coverpoint instr[19:15] {
        bins registers[] = {[0 : 31]};
    }

    cp_rs2: coverpoint instr[24:20] {bins registers[] = {[0 : 31]};}

    cp_rd: coverpoint instr[11:7] {bins registers[] = {[0 : 31]};}

    // ALU operation coverage
    cp_alu_op: coverpoint alu_op {
        bins operations[] = {[0 : $]};
    }

    // Hazard coverage
    cp_hazards: coverpoint hazard_type {
        bins data_hazard = {1}; bins control_hazard = {2}; bins structural_hazard = {3};
    }

    // Cross coverage
    cross_reg_usage: cross cp_rs1, cp_rs2, cp_rd;
endgroup
