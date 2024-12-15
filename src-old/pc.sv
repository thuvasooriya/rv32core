module pc #(
    parameter int WIDTH = 32
) (
    input logic clk,
    input logic rst,
    input logic load,
    input logic next_sel,
    input logic dmem_valid,
    input logic branch_result,
    input logic [WIDTH-1:0] next_address,
    input logic [WIDTH-1:0] address_in,

    output reg   [WIDTH-1:0] address_out,
    output logic [WIDTH-1:0] pre_address_pc
);

    reg [WIDTH-1:0] prev_addr;

    always_ff @(posedge clk) begin
        if (!rst) begin
            address_out <= 0;
        end else if (next_sel | branch_result) begin
            address_out <= next_address;
        end else begin
            address_out <= address_out + 32'd4;
        end

        prev_addr <= address_out;
    end

    assign pre_address_pc = prev_addr;

endmodule
