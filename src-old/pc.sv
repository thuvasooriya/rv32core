module pc #(
    parameter int WIDTH = 32
) (
    input logic clk,
    input logic rst,
    input logic load,
    input logic next_sel,
    input logic dmem_valid,
    input logic branch_reselt,
    input logic [WIDTH-1:0] next_address,
    input logic [WIDTH-1:0] address_in,

    output reg   [WIDTH-1:0] address_out,
    output logic [WIDTH-1:0] pre_address_pc
);

    reg [WIDTH-1:0] prev_addr;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            address_out <= 0;
        end else if (next_sel | branch_reselt) begin
            address_out <= next_address;
        end else if ((load && !dmem_valid)) begin
            address_out <= address_out;
        end else begin
            address_out <= address_out + 32'd4;
        end

        prev_addr <= address_out;
    end

    assign pre_address_pc = prev_addr;

    //     input  logic             clk,
    //     input  logic             rst_n,
    //     input  logic             enable,
    //     input  logic             branch,
    //     input  logic [WIDTH-1:0] branch_target,
    //     input  logic             jump,
    //     input  logic [WIDTH-1:0] jump_target,
    //     output logic [WIDTH-1:0] pc
    // );
    //
    //   logic [WIDTH-1:0] next_pc;
    //
    //   always_comb begin
    //     if (jump) begin
    //       next_pc = jump_target;
    //     end else if (branch) begin
    //       next_pc = branch_target;
    //     end else begin
    //       next_pc = pc + 4;
    //     end
    //   end
    //
    //   always_ff @(posedge clk or negedge rst_n) begin
    //     if (~rst_n) begin
    //       pc <= '0;
    //     end else if (enable) begin
    //       pc <= next_pc;
    //     end
    //   end
endmodule
