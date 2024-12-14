class test_generator;
    import tb_pkg::*;
    import rv32_pkg::*;

    // Random instruction generation
    function automatic logic [31:0] generate_rtype_inst();
        logic [4:0] rd, rs1, rs2;
        logic [2:0] funct3;
        logic [6:0] funct7;

        rd = $urandom_range(1, 31);  // x0 is hardwired to 0
        rs1 = $urandom_range(0, 31);
        rs2 = $urandom_range(0, 31);
        funct3 = $urandom_range(0, 7);
        funct7 = (funct3 inside {5}) ? ($urandom_range(0, 1) ? 7'b0100000 : 7'b0000000) :
            7'b0000000;

        return {funct7, rs2, rs1, funct3, rd, 7'b0110011};
    endfunction

    function automatic logic [31:0] generate_itype_inst();
        logic [4:0] rd, rs1;
        logic [ 2:0] funct3;
        logic [11:0] imm;

        rd = $urandom_range(1, 31);
        rs1 = $urandom_range(0, 31);
        funct3 = $urandom_range(0, 7);
        imm = $urandom();

        return {imm, rs1, funct3, rd, 7'b0010011};
    endfunction

    // Add more instruction generation functions...
endclass
