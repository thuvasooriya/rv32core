`define TEST_BENCH_LOADED
`include "rv32_pkg.svh"
`include "tb_pkg.svh"

module tb_top;
    import tb_pkg::*;
    import rv32_pkg::*;

    // Clock and reset
    logic                 clk;
    logic                 rst_n;

    // DUT signals
    logic          [31:0] instr_addr;
    logic          [31:0] instr_rdata;
    logic                 instr_req;
    logic                 instr_gnt;
    logic                 instr_rvalid;

    logic          [31:0] data_addr;
    logic          [31:0] data_wdata;
    logic          [31:0] data_rdata;
    logic                 data_req;
    logic                 data_we;
    logic          [ 3:0] data_be;
    logic                 data_gnt;
    logic                 data_rvalid;

    // Test environment
    test_generator        generator;
    scoreboard            scoreboard;
    rv32i_coverage        coverage;

    // DUT instantiation
    rv32_core dut (
        .clk_i(clk),
        .rst_ni(rst_n),
        .instr_addr_o(instr_addr),
        .instr_rdata_i(instr_rdata),
        .instr_req_o(instr_req),
        .instr_gnt_i(instr_gnt),
        .instr_rvalid_i(instr_rvalid),
        .data_addr_o(data_addr),
        .data_wdata_o(data_wdata),
        .data_rdata_i(data_rdata),
        .data_req_o(data_req),
        .data_we_o(data_we),
        .data_be_o(data_be),
        .data_gnt_i(data_gnt),
        .data_rvalid_i(data_rvalid)
    );

    // Instruction memory
    memory_model #(
        .MEM_SIZE(IMEM_SIZE),
        .INSTRUCTION_MEMORY(1)
    ) i_mem (
        .clk_i(clk),
        .rst_ni(rst_n),
        .addr_i(instr_addr),
        .wdata_i('0),
        .req_i(instr_req),
        .we_i('0),
        .be_i('0),
        .rdata_o(instr_rdata),
        .gnt_o(instr_gnt),
        .rvalid_o(instr_rvalid)
    );

    // Data memory
    memory_model #(
        .MEM_SIZE(DMEM_SIZE),
        .INSTRUCTION_MEMORY(0)
    ) d_mem (
        .clk_i(clk),
        .rst_ni(rst_n),
        .addr_i(data_addr),
        .wdata_i(data_wdata),
        .req_i(data_req),
        .we_i(data_we),
        .be_i(data_be),
        .rdata_o(data_rdata),
        .gnt_o(data_gnt),
        .rvalid_o(data_rvalid)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset generation
    initial begin
        rst_n = 0;
        repeat (5) @(posedge clk);
        rst_n = 1;
    end

    // Test execution
    initial begin
        // Initialize test environment
        generator  = new();
        scoreboard = new();
        coverage   = new();

        // Wait for reset
        wait (rst_n);
        @(posedge clk);

        // Run tests
        fork
            // Stimulus generation
            begin
                for (int i = 0; i < MAX_TESTS; i++) begin
                    test_stimulus_t stimulus;

                    // Generate and load instruction
                    case ($urandom_range(
                        0, 5
                    ))
                        RTYPE_ALU: stimulus.instr = generator.generate_rtype_inst();
                        ITYPE_ALU: stimulus.instr = generator.generate_itype_inst();
                        // Add more cases...
                    endcase

                    // Predict result
                    scoreboard.predict_result(stimulus);

                    // Update coverage
                    coverage.sample();

                    @(posedge clk);
                end
            end

            // Result checking
            begin
                forever begin
                    @(posedge clk);
                    if (dut.mem_wb_pipe_reg.valid) begin
                        scoreboard.check_result(dut.mem_wb_pipe_reg.rd_addr,
                                                dut.mem_wb_pipe_reg.result,
                                                dut.mem_wb_pipe_reg.valid);
                    end
                end
            end

            // Timeout
            begin
                repeat (TIMEOUT_CYCLES) @(posedge clk);
                $error("Test timeout!");
                $finish;
            end
        join_any

        // Report results
        $display("Test completed!");
        $display("Coverage: %0.2f%%", $get_coverage());
        $finish;
    end

    // Assertions
    // Basic protocol checks
    property valid_pc_range;
        @(posedge clk) disable iff (!rst_n) instr_req |-> (instr_addr inside {[0 : IMEM_SIZE - 1]});
    endproperty

    property valid_data_addr_range;
        @(posedge clk) disable iff (!rst_n) data_req |-> (data_addr inside {[0 : DMEM_SIZE - 1]});
    endproperty

    // Pipeline behavior checks
    property no_bubble_after_valid;
        @(posedge clk) disable iff (!rst_n)
        dut.if_id_pipe_reg.valid ##1 !pipe_stall |-> dut.id_ex_pipe_reg.valid;
    endproperty

    // Assert these properties
    assert property (valid_pc_range)
    else $error("PC out of valid range!");

    assert property (valid_data_addr_range)
    else $error("Data address out of valid range!");

    assert property (no_bubble_after_valid)
    else $error("Invalid pipeline bubble detected!");

endmodule
