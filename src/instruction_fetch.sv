module instruction_fetch #(
    parameter ADDR_WIDTH = 32,
    DATA_WIDTH = 32
) (
    input  logic                  clk,
    input  logic                  reset,
    input  logic [ADDR_WIDTH-1:0] pc_in,
    output logic [ADDR_WIDTH-1:0] pc_out,
    output logic [DATA_WIDTH-1:0] instruction
);
  logic [ADDR_WIDTH-1:0] pc_reg;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) pc_reg <= 0;
    else pc_reg <= pc_in;
  end


  assign pc_out = pc_reg;
  // Simple instruction memory for demonstration
  logic [DATA_WIDTH-1:0] instruction_memory[0:1023];
  assign instruction = instruction_memory[pc_reg>>2];
endmodule
