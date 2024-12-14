module memory_model
    import tb_pkg::*;
#(
    parameter int MEM_SIZE = 'h10000,
    parameter bit INSTRUCTION_MEMORY = 0
) (
    input  logic        clk_i,
    input  logic        rst_ni,
    input  logic [31:0] addr_i,
    input  logic [31:0] wdata_i,
    input  logic        req_i,
    input  logic        we_i,
    input  logic [ 3:0] be_i,
    output logic [31:0] rdata_o,
    output logic        gnt_o,
    output logic        rvalid_o
);
    // Memory array
    logic        [7:0] mem        [MEM_SIZE];

    // Response delay modeling
    int unsigned       resp_delay;
    logic              req_q;

    // Grant logic
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            gnt_o <= 1'b0;
            req_q <= 1'b0;
        end else begin
            gnt_o <= req_i && !req_q;
            req_q <= req_i;
        end
    end

    // Read/Write logic
    always_ff @(posedge clk_i) begin
        if (req_i && we_i && gnt_o) begin
            if (be_i[0]) mem[addr_i+0] <= wdata_i[7:0];
            if (be_i[1]) mem[addr_i+1] <= wdata_i[15:8];
            if (be_i[2]) mem[addr_i+2] <= wdata_i[23:16];
            if (be_i[3]) mem[addr_i+3] <= wdata_i[31:24];
        end
    end

    always_comb begin
        rdata_o = {mem[addr_i+3], mem[addr_i+2], mem[addr_i+1], mem[addr_i+0]};
    end

    // Response valid modeling
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            rvalid_o   <= 1'b0;
            resp_delay <= 0;
        end else begin
            if (gnt_o) begin
                resp_delay <= $urandom_range(1, 3);
                rvalid_o   <= 1'b0;
            end else if (resp_delay > 0) begin
                resp_delay <= resp_delay - 1;
                rvalid_o   <= (resp_delay == 1);
            end else begin
                rvalid_o <= 1'b0;
            end
        end
    end

    // Load memory contents for instruction memory
    initial begin
        if (INSTRUCTION_MEMORY) begin
            $readmemh("test_program.hex", mem);
        end
    end
endmodule
