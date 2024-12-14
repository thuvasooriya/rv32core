module mem_stage
    import rv32_pkg::*;
(
    input  logic                        clk_i,
    input  logic                        rst_ni,
    // pipeline registers
    input  ex_mem_pipeline_reg_t        ex_mem_i,
    // memory interface
    input  logic                 [31:0] data_rdata_i,
    output logic                 [31:0] data_addr_o,
    output logic                 [31:0] data_wdata_o,
    output logic                        data_req_o,
    output logic                        data_we_o,
    output logic                 [ 3:0] data_be_o,
    input  logic                        data_gnt_i,
    input  logic                        data_rvalid_i,
    // pipeline output
    output mem_wb_pipeline_reg_t        mem_wb_o
);

    // memory interface assignments
    assign data_addr_o  = ex_mem_i.alu_result;
    assign data_wdata_o = ex_mem_i.rs2_data;
    assign data_req_o   = ex_mem_i.mem_read || ex_mem_i.mem_write;
    assign data_we_o    = ex_mem_i.mem_write;
    assign data_be_o    = 4'b1111; // for word access, can be modified for byte/halfword

    // pipeline register update
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            mem_wb_o <= '0;
        end else begin
            mem_wb_o.result    <= ex_mem_i.mem_read ? data_rdata_i : ex_mem_i.alu_result;
            mem_wb_o.rd_addr   <= ex_mem_i.rd_addr;
            mem_wb_o.reg_write <= ex_mem_i.reg_write;
            mem_wb_o.valid     <= ex_mem_i.valid && data_rvalid_i;
        end
    end

endmodule
