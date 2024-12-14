package tb_pkg;
    // test parameters
    parameter int TIMEOUT_CYCLES = 10000;
    parameter int MAX_TESTS = 1000;

    // memory parameters
    parameter int IMEM_SIZE = 'h10000;
    parameter int DMEM_SIZE = 'h10000;

    // instruction patterns
    typedef enum logic [2:0] {
        RTYPE_ALU  = 3'd0,
        ITYPE_ALU  = 3'd1,
        LOAD_STORE = 3'd2,
        BRANCHES   = 3'd3,
        JUMPS      = 3'd4,
        RANDOM     = 3'd5
    } test_pattern_e;

    // test result tracking
    typedef struct packed {
        int num_instructions;
        int num_branches;
        int num_loads;
        int num_stores;
        int num_jumps;
        int num_exceptions;
    } test_stats_t;

    // test stimuli
    typedef struct packed {
        logic [31:0] instr;
        logic [31:0] pc;
        logic [31:0] expected_result;
        logic        expected_exception;
    } test_stimulus_t;
endpackage : tb_pkg
