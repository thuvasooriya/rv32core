module adder (
    a,
    adder_out
);
    input wire [31:0] a;
    output reg [31:0] adder_out;

    always_comb begin
        adder_out = a + 32'd4;
    end
endmodule
