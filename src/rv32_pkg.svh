package rv32_pkg;

    // instruction fields
    typedef struct packed {
        logic [6:0] funct7;
        logic [4:0] rs2;
        logic [4:0] rs1;
        logic [2:0] funct3;
        logic [4:0] rd;
        logic [6:0] opcode;
    } instr_t;

    // alu operations
    typedef enum logic [3:0] {
        ALU_ADD  = 4'b0000,
        ALU_SUB  = 4'b0001,
        ALU_SLL  = 4'b0010,
        ALU_SLT  = 4'b0011,
        ALU_SLTU = 4'b0100,
        ALU_XOR  = 4'b0101,
        ALU_SRL  = 4'b0110,
        ALU_SRA  = 4'b0111,
        ALU_OR   = 4'b1000,
        ALU_AND  = 4'b1001,
        ALU_PASS = 4'b1111
    } alu_op_e;

    // instruction formats
    typedef enum logic [6:0] {
        OP_LUI    = 7'b0110111,
        OP_AUIPC  = 7'b0010111,
        OP_JAL    = 7'b1101111,
        OP_JALR   = 7'b1100111,
        OP_BRANCH = 7'b1100011,
        OP_LOAD   = 7'b0000011,
        OP_STORE  = 7'b0100011,
        OP_OP_IMM = 7'b0010011,
        OP_OP     = 7'b0110011
    } opcode_e;

    // r-type function codes
    typedef enum logic [3:0] {
        R_ADD  = 4'b0000,  // funct3=0, funct7=0
        R_SUB  = 4'b1000,  // funct3=0, funct7=32
        R_SLL  = 4'b0001,  // funct3=1, funct7=0
        R_SLT  = 4'b0010,  // funct3=2, funct7=0
        R_SLTU = 4'b0011,  // funct3=3, funct7=0
        R_XOR  = 4'b0100,  // funct3=4, funct7=0
        R_SRL  = 4'b0101,  // funct3=5, funct7=0
        R_SRA  = 4'b1101,  // funct3=5, funct7=32
        R_OR   = 4'b0110,  // funct3=6, funct7=0
        R_AND  = 4'b0111   // funct3=7, funct7=0
    } rtype_funct_e;

    // // branch conditions
    // typedef enum logic [2:0] {
    //     BRANCH_EQ  = 3'b000,
    //     BRANCH_NE  = 3'b001,
    //     BRANCH_LT  = 3'b100,
    //     BRANCH_GE  = 3'b101,
    //     BRANCH_LTU = 3'b110,
    //     BRANCH_GEU = 3'b111
    // } branch_funct_e;

    // branch operations
    typedef enum logic [2:0] {
        BRANCH_EQ,
        BRANCH_NE,
        BRANCH_LT,
        BRANCH_GE,
        BRANCH_LTU,
        BRANCH_GEU
    } branch_op_e;

    // decoded instruction
    typedef struct packed {
        logic [31:0] imm;        // Immediate value
        logic [4:0]  rs1;        // Source register 1
        logic [4:0]  rs2;        // Source register 2
        logic [4:0]  rd;         // Destination register
        alu_op_e     alu_op;     // ALU operation
        logic        reg_write;  // Register write enable
        logic        mem_read;   // Memory read enable
        logic        mem_write;  // Memory write enable
        logic        branch;     // Branch instruction
        logic        jump;       // Jump instruction
        branch_op_e  branch_op;  // Branch operation
        logic [2:0]  mem_size;   // Memory access size
    } decoded_instr_t;

    // instruction field types
    typedef struct packed {
        logic [31:0] instr;
        logic [31:0] pc;
        logic        valid;
    } if_id_pipeline_reg_t;

    typedef struct packed {
        logic [31:0] rs1_data;
        logic [31:0] rs2_data;
        logic [31:0] imm;
        logic [31:0] pc;
        logic [4:0]  rs1_addr;
        logic [4:0]  rs2_addr;
        logic [4:0]  rd_addr;
        alu_op_e     alu_op;
        logic        reg_write;
        logic        mem_read;
        logic        mem_write;
        logic        branch;
        logic        jump;
        branch_op_e  branch_op;
        logic        valid;
    } id_ex_pipeline_reg_t;

    typedef struct packed {
        logic [31:0] alu_result;
        logic [31:0] rs2_data;
        logic [4:0]  rd_addr;
        logic        reg_write;
        logic        mem_read;
        logic        mem_write;
        logic        valid;
    } ex_mem_pipeline_reg_t;

    typedef struct packed {
        logic [31:0] result;
        logic [4:0]  rd_addr;
        logic        reg_write;
        logic        valid;
    } mem_wb_pipeline_reg_t;

    // control signals
    typedef struct packed {
        logic       reg_write;
        logic       mem_read;
        logic       mem_write;
        logic       branch;
        logic       jump;
        alu_op_e    alu_op;
        branch_op_e branch_op;
        logic [2:0] mem_size;
    } ctrl_signals_t;



    // memory operations
    typedef enum logic [1:0] {
        MEM_BYTE,
        MEM_HALF,
        MEM_WORD
    } mem_size_e;

    // forwarding types
    typedef enum logic [1:0] {
        FWD_NONE,
        FWD_MEM,
        FWD_WB
    } forward_sel_e;

    // CSR addresses
    parameter logic [11:0] CSR_MSTATUS = 12'h300;
    parameter logic [11:0] CSR_MTVEC = 12'h305;
    parameter logic [11:0] CSR_MEPC = 12'h341;
    parameter logic [11:0] CSR_MCAUSE = 12'h342;
    parameter logic [11:0] CSR_MTVAL = 12'h343;

    // Exception causes
    typedef enum logic [3:0] {
        EXC_INSTR_MISALIGNED = 4'h0,
        EXC_INSTR_ILLEGAL    = 4'h2,
        EXC_LOAD_MISALIGNED  = 4'h4,
        EXC_STORE_MISALIGNED = 4'h6
    } exception_cause_e;

    // Exception handler address
    parameter logic [31:0] EXCEPTION_HANDLER_ADDR = 32'h0000_0100;


    // typedef struct packed {
    //     logic [6:0] funct7;
    //     logic [4:0] rs2;
    //     logic [4:0] rs1;
    //     logic [2:0] funct3;
    //     logic [4:0] rd;
    //     logic [6:0] opcode;
    // } r_type_t;
    // typedef struct packed {
    //     logic [11:0] imm;
    //     logic [4:0]  rs1;
    //     logic [2:0]  funct3;
    //     logic [4:0]  rd;
    //     logic [6:0]  opcode;
    // } i_type_t;
    // typedef struct packed {
    //     logic [6:0] imm11_5;
    //     logic [4:0] rs2;
    //     logic [4:0] rs1;
    //     logic [2:0] funct3;
    //     logic [4:0] imm4_0;
    //     logic [6:0] opcode;
    // } s_type_t;
    // typedef struct packed {
    //     logic       imm12;
    //     logic [5:0] imm10_5;
    //     logic [4:0] rs2;
    //     logic [4:0] rs1;
    //     logic [2:0] funct3;
    //     logic [3:0] imm4_1;
    //     logic       imm11;
    //     logic [6:0] opcode;
    // } b_type_t;
    // typedef struct packed {
    //     logic [19:0] imm31_12;
    //     logic [4:0]  rd;
    //     logic [6:0]  opcode;
    // } u_type_t;
    // typedef struct packed {
    //     logic       imm20;
    //     logic [9:0] imm10_1;
    //     logic       imm11;
    //     logic [7:0] imm19_12;
    //     logic [4:0] rd;
    //     logic [6:0] opcode;
    // } j_type_t;

endpackage
