
module forwarding_unit
    import rv32_pkg::*;
(
    input  logic [4:0] rs1_addr_i,
    input  logic [4:0] rs2_addr_i,
    input  logic [4:0] ex_rd_i,
    input  logic [4:0] mem_rd_i,
    input  logic       ex_reg_write_i,
    input  logic       mem_reg_write_i,
    output logic [1:0] forward_a_o,
    output logic [1:0] forward_b_o
);

    always_comb begin
        forward_a_o = 2'b00;
        forward_b_o = 2'b00;

        // EX hazard
        if (ex_reg_write_i && (ex_rd_i != '0) && (ex_rd_i == rs1_addr_i)) begin
            forward_a_o = 2'b10;
        end
        if (ex_reg_write_i && (ex_rd_i != '0) && (ex_rd_i == rs2_addr_i)) begin
            forward_b_o = 2'b10;
        end

        // MEM hazard
        if (mem_reg_write_i && (mem_rd_i != '0) &&
        !(ex_reg_write_i && (ex_rd_i != '0) && (ex_rd_i == rs1_addr_i)) &&
        (mem_rd_i == rs1_addr_i)) begin
            forward_a_o = 2'b01;
        end
        if (mem_reg_write_i && (mem_rd_i != '0) &&
        !(ex_reg_write_i && (ex_rd_i != '0) && (ex_rd_i == rs2_addr_i)) &&
        (mem_rd_i == rs2_addr_i)) begin
            forward_b_o = 2'b01;
        end
    end

endmodule
