`default_nettype none
`define BENCH


module soc (
    input            CLK,    // system clock 
    input            RESET,  // reset button
    output reg [4:0] LEDS,   // system LEDs
    input            RXD,    // UART receive
    output           TXD     // UART transmit
);

  wire        clk;
  wire        resetn;

  wire [31:0] IO_mem_addr;
  wire [31:0] IO_mem_rdata;
  wire [31:0] IO_mem_wdata;
  wire        IO_mem_wr;

  core cpu (
      .clk(clk),
      .resetn(resetn),
      .IO_mem_addr(IO_mem_addr),
      .IO_mem_rdata(IO_mem_rdata),
      .IO_mem_wdata(IO_mem_wdata),
      .IO_mem_wr(IO_mem_wr)
  );

  wire [13:0] IO_wordaddr = IO_mem_addr[15:2];

  // Memory-mapped IO in IO page, 1-hot addressing in word address.   
  localparam IO_LEDS_bit = 0;  // W five leds
  localparam IO_UART_DAT_bit = 1;  // W data to send (8 bits) 
  localparam IO_UART_CNTL_bit = 2;  // R status. bit 9: busy sending

  always @(posedge clk) begin
    if (IO_mem_wr & IO_wordaddr[IO_LEDS_bit]) begin
      LEDS <= IO_mem_wdata[4:0];
    end
  end

  wire uart_valid = IO_mem_wr & IO_wordaddr[IO_UART_DAT_bit];
  wire uart_ready;

  emitter_uart #(
      .clk_freq_hz(45000000),
      //      .baud_rate(115200)
      .baud_rate  (1000000)
  ) UART (
      .i_clk(clk),
      .i_rst(!resetn),
      .i_data(IO_mem_wdata[7:0]),
      .i_valid(uart_valid),
      .o_ready(uart_ready),
      .o_uart_tx(TXD)
  );

  assign IO_mem_rdata = IO_wordaddr[IO_UART_CNTL_bit] ? {22'b0, !uart_ready, 9'b0} : 32'b0;

`ifdef BENCH
  always @(posedge clk) begin
    if (uart_valid) begin
      $display("UART: %c", IO_mem_wdata[7:0]);
      $write("%c", IO_mem_wdata[7:0]);
      $fflush(32'h8000_0001);
    end
  end

  initial begin
    $display("starting sim");
    $dumpfile("tmp/soc.vcd");
    $dumpvars(0, soc);
  end
`endif

  // Gearbox and reset circuitry.
  // 
  clkworks #(
  // .SLOW(24)  // divide clock frequency by 2^21
  ) cw_inst (
      .clk(CLK),
      .reset(RESET),
      .clk_o(clk),
      .resetn(resetn)
  );
endmodule

// module soc (
//     input  wire        clk,
//     input  wire        reset,
//     output logic [3:0] led,
//     input  wire        rxd_i,
//     output logic       txd_o
// );
//
//   logic clk_internal;  // internal clock
//   logic resetn;  // internal reset signal, goes low on reset
//
//   reg [31:0] PC = 0;
//   reg [31:0] mem[0:255];
//   logic [31:0] instr;
//
//   initial begin
//     // add x1, x0, x0
//     //                    rs2   rs1  add  rd   alureg
//     mem[0]  = 32'b0000000_00000_00000_000_00001_0110011;
//     // addi x1, x1, 1
//     //             imm         rs1  add  rd   aluimm
//     mem[1]  = 32'b000000000001_00001_000_00001_0010011;
//     // addi x1, x1, 1
//     //             imm         rs1  add  rd   aluimm
//     mem[2]  = 32'b000000000001_00001_000_00001_0010011;
//     // addi x1, x1, 1
//     //             imm         rs1  add  rd   aluimm
//     mem[3]  = 32'b000000000001_00001_000_00001_0010011;
//     // addi x1, x1, 1
//     //             imm         rs1  add  rd   aluimm
//     mem[4]  = 32'b000000000001_00001_000_00001_0010011;
//     // add x2, x1, x0
//     //                    rs2   rs1  add  rd   alureg
//     mem[5]  = 32'b0000000_00000_00001_000_00010_0110011;
//     // add x3, x1, x2
//     //                    rs2   rs1  add  rd   alureg
//     mem[6]  = 32'b0000000_00010_00001_000_00011_0110011;
//     // srli x3, x3, 3
//     //                   shamt   rs1  sr  rd   aluimm
//     mem[7]  = 32'b0000000_00011_00011_101_00011_0010011;
//     // slli x3, x3, 31
//     //                   shamt   rs1  sl  rd   aluimm
//     mem[8]  = 32'b0000000_11111_00011_001_00011_0010011;
//     // srai x3, x3, 5
//     //                   shamt   rs1  sr  rd   aluimm
//     mem[9]  = 32'b0100000_00101_00011_101_00011_0010011;
//     // srli x1, x3, 26
//     //                   shamt   rs1  sr  rd   aluimm
//     mem[10] = 32'b0000000_11010_00011_101_00001_0010011;
//
//     // ebreak
//     //                                          system
//     mem[11] = 32'b000000000001_00000_000_00000_1110011;
//   end
//
//   typedef enum logic [6:0] {
//     OP     = 7'b0110011,  // R : rd <- rs1 OP rs2
//     OP_IMM = 7'b0010011,  // I : rd <- rs1 OP Iimm
//     LOAD   = 7'b0000011,  // S : rd <- mem[rs1 + Iimm]
//     STORE  = 7'b0100011,  // S : mem[rs1 + Iimm] <- rs2
//     BRANCH = 7'b1100011,  // B : if (rs1 OP rs2) PC <- PC + Bimm
//     JAL    = 7'b1101111,  // J :
//     JALR   = 7'b1100111,  // J :
//     LUI    = 7'b0110111,  // U : rd <- Uimm
//     AUIPC  = 7'b0010111,  // Add Upper Immediate to PC
//     SYSTEM = 7'b1110011
//   } opcode_e;
//
//   opcode_e opcode = opcode_e'(instr[6:0]);
//   wire     isALUreg = (opcode == OP);  // rd <- rs1 OP rs2
//   wire     isALUimm = (opcode == OP_IMM);  // rd <- rs1 OP Iimm
//   wire     isBranch = (opcode == BRANCH);  // if (rs1 OP rs2) PC <- PC + Bimm
//   wire     isJALR = (opcode == JALR);  // rd <- PC + 4; PC <- rs1 + Iimm
//   wire     isJAL = (opcode == JAL);  // rd <- PC + 4; PC <- PC + Jimm
//   wire     isAUIPC = (opcode == AUIPC);  // rd <- PC + Uimm
//   wire     isLUI = (opcode == LUI);  // rd <- Uimm
//   wire     isLoad = (opcode == LOAD);  // rd <- mem[rs1 + Iimm]
//   wire     isStore = (opcode == STORE);  // mem[rs1 + Simm] <- rs2
//   wire     isSYSTEM = (opcode == SYSTEM);  // special
//
//   typedef enum logic [2:0] {
//     ALU_FUNC3_ADD_SUB = 3'b000,
//     ALU_FUNC3_SLL     = 3'b001,
//     ALU_FUNC3_SLT     = 3'b010,
//     ALU_FUNC3_SLTU    = 3'b011,
//     ALU_FUNC3_XOR     = 3'b100,
//     ALU_FUNC3_SRL_SRA = 3'b101,
//     ALU_FUNC3_OR      = 3'b110,
//     ALU_FUNC3_AND     = 3'b111
//   } alu_funct3_e;
//
//   typedef enum logic [2:0] {
//     LOAD_FUNC3_BYTE  = 3'b000,
//     LOAD_FUNC3_HALF  = 3'b001,
//     LOAD_FUNC3_WORD  = 3'b010,
//     LOAD_FUNC3_UBYTE = 3'b100,
//     LOAD_FUNC3_UHALF = 3'b101
//   } load_funct3_e;
//
//   typedef enum logic [2:0] {
//     STORE_FUNC3_BYTE = 3'b000,
//     STORE_FUNC3_HALF = 3'b001,
//     STORE_FUNC3_WORD = 3'b010
//   } store_funct3_e;
//
//   typedef enum logic [2:0] {
//     BRANCH_FUNC3_BEQ  = 3'b000,
//     BRANCH_FUNC3_BNE  = 3'b001,
//     BRANCH_FUNC3_BLT  = 3'b100,
//     BRANCH_FUNC3_BGE  = 3'b101,
//     BRANCH_FUNC3_BLTU = 3'b110,
//     BRANCH_FUNC3_BGEU = 3'b111
//   } branch_funct3_e;
//
//   // The 5 immediate formats
//   wire  [31:0] Uimm = {instr[31], instr[30:12], {12{1'b0}}};
//   wire  [31:0] Iimm = {{21{instr[31]}}, instr[30:20]};
//   wire  [31:0] Simm = {{21{instr[31]}}, instr[30:25], instr[11:7]};
//   wire  [31:0] Bimm = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
//   wire  [31:0] Jimm = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
//
//   // Source and destination registers
//   wire  [ 4:0] rs1Id = instr[19:15];
//   wire  [ 4:0] rs2Id = instr[24:20];
//   wire  [ 4:0] rdId = instr[11:7];
//
//   // function codes
//   wire  [ 2:0] funct3 = instr[14:12];
//   wire  [ 6:0] funct7 = instr[31:25];
//
//   logic [31:0] register_file                                                         [0:31];
//   logic [31:0] rs1;
//   logic [31:0] rs2;
//   // logic [31:0] wb_data;
//   // logic wb_en;
//
//   wire  [31:0] writeBackData;  // data to be written to rd
//   wire         writeBackEn;  // asserted if data should be written to rd
//
//   // assign wb_data = 0;
//   // assign wb_en   = 0;
//
// `ifdef BENCH
//   integer i;
//   initial begin
//     for (i = 0; i < 32; ++i) begin
//       register_file[i] = 0;
//     end
//   end
// `endif
//
//
//   //////////////////////////////////////
//   // ALU
//   logic [31:0] aluIn1 = rs1;
//   logic [31:0] aluIn2 = isALUreg ? rs2 : Iimm;
//   logic [31:0] aluOut;
//   logic [ 4:0] shamt = isALUreg ? rs2[4:0] : instr[24:20];
//
//   // ADD/SUB/ADDI: 
//   // funct7[5] is 1 for SUB and 0 for ADD. We need also to test instr[5]
//   // to make the difference with ADDI
//   //
//   // SRLI/SRAI/SRL/SRA: 
//   // funct7[5] is 1 for arithmetic shift (SRA/SRAI) and 
//   // 0 for logical shift (SRL/SRLI)
//   always_comb begin
//     case (funct3)
//       3'b000: aluOut = (funct7[5] & instr[5]) ? (aluIn1 - aluIn2) : (aluIn1 + aluIn2);
//       3'b001: aluOut = aluIn1 << shamt;
//       3'b010: aluOut = ($signed(aluIn1) < $signed(aluIn2));
//       3'b011: aluOut = (aluIn1 < aluIn2);
//       3'b100: aluOut = (aluIn1 ^ aluIn2);
//       3'b101: aluOut = funct7[5] ? ($signed(aluIn1) >>> shamt) : ($signed(aluIn1) >> shamt);
//       3'b110: aluOut = (aluIn1 | aluIn2);
//       3'b111: aluOut = (aluIn1 & aluIn2);
//     endcase
//   end
//
//
//   // The state machine
//   localparam FETCH_INSTR = 0;
//   localparam FETCH_REGS = 1;
//   localparam EXECUTE = 2;
//   reg [1:0] state = FETCH_INSTR;
//
//   // register write back
//   assign writeBackData = aluOut;
//   assign writeBackEn   = (state == EXECUTE && (isALUreg || isALUimm));
//
//   always @(posedge clk) begin
//     if (!resetn) begin
//       PC    <= 0;
//       state <= FETCH_INSTR;
//     end else begin
//       if (writeBackEn && rdId != 0) begin
//         register_file[rdId] <= writeBackData;
//         // For displaying what happens.
//         if (rdId == 1) begin
//           led <= writeBackData;
//         end
// `ifdef BENCH
//         $display("reg_x%0d <- %b : %d", rdId, writeBackData, writeBackData);
// `endif
//       end
//       case (state)
//         FETCH_INSTR: begin
//           instr <= mem[PC];
//           state <= FETCH_REGS;
//         end
//         FETCH_REGS: begin
//           rs1   <= register_file[rs1Id];
//           rs2   <= register_file[rs2Id];
//           state <= EXECUTE;
//         end
//         EXECUTE: begin
//           if (!isSYSTEM) begin
//             PC <= PC + 1;
//           end
//           state <= FETCH_INSTR;
// `ifdef BENCH
//           if (isSYSTEM) $finish();
// `endif
//         end
//       endcase
//     end
//   end
//
// `ifdef BENCH
//   always_ff @(posedge clk) begin
//     if (state == FETCH_REGS) begin
//       case (1'b1)
//         OP:
//         $display(
//             "ALUreg",
//             // "ALUreg rd=%d rs1=%d rs2=%d funct3=%b",
//             // rdId, rs1Id, rs2Id, funct3
//         );
//         isALUimm: $display("ALUimm rd=%d rs1=%d imm=%0d funct3=%b", rdId, rs1Id, Iimm, funct3);
//         isBranch: $display("BRANCH");
//         isJAL: $display("JAL");
//         isJALR: $display("JALR");
//         isAUIPC: $display("AUIPC");
//         isLUI: $display("LUI");
//         isLoad: $display("LOAD");
//         isStore: $display("STORE");
//         isSYSTEM: $display("SYSTEM");
//       endcase
//       if (isSYSTEM) begin
//         $finish();
//       end
//     end
//   end
// `endif
//
//   clkworks #(
//       .SLOW(24)  // divide clock frequency by 2^21
//   ) cw_inst (
//       .clk(clk),
//       .reset(reset),
//       .clk_o(clk_internal),
//       .resetn(resetn)
//   );
//
//   assign txd_o = 1'b0;  // not used for now
//
// endmodule
