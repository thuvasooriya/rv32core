package tb_pkg;
    // Test parameters
    parameter int TIMEOUT_CYCLES = 10000;
    parameter int MAX_TESTS = 1000;

    // Memory parameters
    parameter int IMEM_SIZE = 'h10000;
    parameter int DMEM_SIZE = 'h10000;

    // Instruction patterns
    typedef enum {
        RTYPE_ALU,
        ITYPE_ALU,
        LOAD_STORE,
        BRANCHES,
        JUMPS,
        RANDOM
    } test_pattern_e;

    // Test result tracking
    typedef struct packed {
        int num_instructions;
        int num_branches;
        int num_loads;
        int num_stores;
        int num_jumps;
        int num_exceptions;
    } test_stats_t;

    // Test stimuli
    typedef struct packed {
        logic [31:0] instr;
        logic [31:0] pc;
        logic [31:0] expected_result;
        logic        expected_exception;
    } test_stimulus_t;
endpackage : tb_pkg
