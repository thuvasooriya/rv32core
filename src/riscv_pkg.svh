package riscv_pkg;
  typedef enum logic [6:0] {
    OP     = 7'b0110011,  // R-type
    OP_IMM = 7'b0010011,  // I-type ALU
    LOAD   = 7'b0000011,  // Load
    STORE  = 7'b0100011,  // Store
    BRANCH = 7'b1100011,  // Branch
    JAL    = 7'b1101111,  // Jump and Link
    JALR   = 7'b1100111,  // Jump and Link Register
    LUI    = 7'b0110111,  // Load Upper Immediate
    AUIPC  = 7'b0010111   // Add Upper Immediate to PC
  } opcode_e;

  // Separate enums for different instruction types
  typedef enum logic [2:0] {
    ALU_FUNC3_ADD_SUB = 3'b000,
    ALU_FUNC3_SLL     = 3'b001,
    ALU_FUNC3_SLT     = 3'b010,
    ALU_FUNC3_SLTU    = 3'b011,
    ALU_FUNC3_XOR     = 3'b100,
    ALU_FUNC3_SRL_SRA = 3'b101,
    ALU_FUNC3_OR      = 3'b110,
    ALU_FUNC3_AND     = 3'b111
  } alu_funct3_e;

  typedef enum logic [2:0] {
    LOAD_FUNC3_BYTE  = 3'b000,
    LOAD_FUNC3_HALF  = 3'b001,
    LOAD_FUNC3_WORD  = 3'b010,
    LOAD_FUNC3_UBYTE = 3'b100,
    LOAD_FUNC3_UHALF = 3'b101
  } load_funct3_e;

  typedef enum logic [2:0] {
    STORE_FUNC3_BYTE = 3'b000,
    STORE_FUNC3_HALF = 3'b001,
    STORE_FUNC3_WORD = 3'b010
  } store_funct3_e;

  typedef enum logic [2:0] {
    BRANCH_FUNC3_BEQ  = 3'b000,
    BRANCH_FUNC3_BNE  = 3'b001,
    BRANCH_FUNC3_BLT  = 3'b100,
    BRANCH_FUNC3_BGE  = 3'b101,
    BRANCH_FUNC3_BLTU = 3'b110,
    BRANCH_FUNC3_BGEU = 3'b111
  } branch_funct3_e;

  typedef enum logic [3:0] {
    ALU_ADD,
    ALU_SUB,
    ALU_SLL,
    ALU_SLT,
    ALU_SLTU,
    ALU_XOR,
    ALU_SRL,
    ALU_SRA,
    ALU_OR,
    ALU_AND
  } alu_op_e;

  typedef enum logic [1:0] {
    SIZE_BYTE = 2'b00,
    SIZE_HALF = 2'b01,
    SIZE_WORD = 2'b10
  } mem_size_e;

  typedef struct packed {
    logic      reg_write;
    logic      mem_read;
    logic      mem_write;
    logic      branch;
    logic      jump;
    logic      alu_src;       // 0: reg, 1: imm
    alu_op_e   alu_op;
    mem_size_e mem_size;
    logic      mem_unsigned;  // For loads: 0: signed, 1: unsigned
  } ctrl_signals_t;

endpackage
