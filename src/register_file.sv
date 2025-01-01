module register_file #(
    parameter REG_WIDTH = 32,
    ADDR_WIDTH = 5
) (
    input  logic                  clk,
    input  logic [ADDR_WIDTH-1:0] rs1,
    input  logic [ADDR_WIDTH-1:0] rs2,
    input  logic [ADDR_WIDTH-1:0] rd,
    input  logic [ REG_WIDTH-1:0] write_data,
    input  logic                  reg_write,
    output logic [ REG_WIDTH-1:0] read_data1,
    output logic [ REG_WIDTH-1:0] read_data2
);
  logic [REG_WIDTH-1:0] registers[0:(1<<ADDR_WIDTH)-1];

  // Read logic
  assign read_data1 = registers[rs1];
  assign read_data2 = registers[rs2];

  // Write logic
  always_ff @(posedge clk) begin
    if (reg_write && rd != 0)  // Register 0 is hardwired to 0
      registers[rd] <= write_data;
  end
endmodule
