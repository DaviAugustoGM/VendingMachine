`timescale 1ns/1ps

module memory (
  input  logic       clk,
  input  logic       rst,
  input  logic       mem_read,
  input  logic       mem_write,
  input  logic [1:0] addr,
  output logic [7:0] price,
  output logic [7:0] stock
);

  logic [15:0] mem [0:3];

  always_ff @(posedge clk) begin
    if (rst) begin
      price <= 8'd0;
      stock <= 8'd0;

      mem[0] <= {8'h19, 8'h05}; // Café:  R$0,25, estoque 5
      mem[1] <= {8'h32, 8'h05}; // Água:  R$0,50, estoque 5
      mem[2] <= {8'h4B, 8'h03}; // Suco:  R$0,75, estoque 3
      mem[3] <= {8'h64, 8'h02}; // Snack: R$1,00, estoque 2

    end else begin
      if (mem_read) begin
        price <= mem[addr][15:8];
        stock <= mem[addr][7:0];
      end

      if (mem_write && (mem[addr][7:0] > 8'd0)) begin
        mem[addr][7:0] <= mem[addr][7:0] - 8'd1;
      end
    end
  end

endmodule
