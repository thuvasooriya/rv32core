class scoreboard;
    import tb_pkg::*;
    import rv32_pkg::*;

    // Register file model
    logic [31:0] reg_file[32];
    logic [31:0] pc;

    // Performance counters
    test_stats_t stats;

    // Expected results queue
    test_stimulus_t expected_queue[$];

    function void reset();
        foreach (reg_file[i]) reg_file[i] = 0;
        pc = 0;
        stats = '0;
    endfunction

    function void predict_result(test_stimulus_t stimulus);
        logic [31:0] result;

        // Decode instruction and predict result
        case (stimulus.instr[6:0])
            OP_OP: begin
                // R-type instruction result prediction
                logic [4:0] rd, rs1, rs2;
                logic [2:0] funct3;
                logic [6:0] funct7;

                {funct7, rs2, rs1, funct3, rd} = stimulus.instr[31:7];

                case (funct3)
                    3'b000:
                    result = (funct7[5]) ?
                                    (reg_file[rs1] - reg_file[rs2]) :
                                    (reg_file[rs1] + reg_file[rs2]);
                    3'b001: result = reg_file[rs1] << reg_file[rs2][4:0];
                    // Add more cases...
                endcase

                if (rd != 0) reg_file[rd] = result;
            end
            // Add more instruction types...
        endcase

        // Queue expected result
        stimulus.expected_result = result;
        expected_queue.push_back(stimulus);
    endfunction

    function void check_result(logic [4:0] rd_addr, logic [31:0] rd_data, logic valid);
        if (valid && expected_queue.size() > 0) begin
            test_stimulus_t expected = expected_queue.pop_front();
            if (rd_addr != 0 && rd_data !== expected.expected_result) begin
                $error("Result mismatch: Expected %0h, Got %0h", expected.expected_result, rd_data);
            end
        end
    endfunction
endclass
