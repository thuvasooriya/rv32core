module pipeline_controller
    import rv32_pkg::*;
(
    input  logic clk_i,
    input  logic rst_ni,
    // Hazard and control signals
    input  logic hazard_detected_i,
    input  logic branch_taken_i,
    input  logic jump_i,
    input  logic data_stall_i,
    input  logic instr_stall_i,
    input  logic misaligned_access_i,
    // Pipeline control outputs
    output logic if_stage_stall_o,
    output logic id_stage_stall_o,
    output logic ex_stage_stall_o,
    output logic mem_stage_stall_o,
    output logic wb_stage_stall_o,
    output logic if_stage_flush_o,
    output logic id_stage_flush_o,
    output logic ex_stage_flush_o,
    output logic mem_stage_flush_o,
    // Pipeline status
    output logic pipeline_stalled_o
);

    logic memory_stall;
    logic control_hazard;
    logic data_hazard;

    assign memory_stall       = data_stall_i | instr_stall_i;
    assign control_hazard     = branch_taken_i | jump_i;
    assign data_hazard        = hazard_detected_i;
    assign pipeline_stalled_o = memory_stall | data_hazard;

    // Stall control
    always_comb begin
        // Default values
        if_stage_stall_o  = 1'b0;
        id_stage_stall_o  = 1'b0;
        ex_stage_stall_o  = 1'b0;
        mem_stage_stall_o = 1'b0;
        wb_stage_stall_o  = 1'b0;

        // Memory stall
        if (memory_stall) begin
            if_stage_stall_o  = 1'b1;
            id_stage_stall_o  = 1'b1;
            ex_stage_stall_o  = 1'b1;
            mem_stage_stall_o = 1'b1;
            wb_stage_stall_o  = 1'b1;
        end

        // Data hazard stall
        if (data_hazard) begin
            if_stage_stall_o = 1'b1;
            id_stage_stall_o = 1'b1;
        end
    end

    // Flush control
    always_comb begin
        // Default values
        if_stage_flush_o  = 1'b0;
        id_stage_flush_o  = 1'b0;
        ex_stage_flush_o  = 1'b0;
        mem_stage_flush_o = 1'b0;

        // Control hazard flush
        if (control_hazard) begin
            id_stage_flush_o = 1'b1;
            if_stage_flush_o = 1'b1;
        end

        // Misaligned access flush
        if (misaligned_access_i) begin
            ex_stage_flush_o  = 1'b1;
            mem_stage_flush_o = 1'b1;
        end
    end

endmodule
