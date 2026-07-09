`timescale 1ns/1ps

module credit_reg (
  input  logic       clk,
  input  logic       rst,
  input  logic       cancel,
  input  logic       clear,
  input  logic       load,
  input  logic [7:0] coin_value,
  output logic [7:0] credit
);

  always_ff @(posedge clk) begin
    if (rst || cancel || clear) begin
      credit <= 8'd0;
    end else if (load) begin
      credit <= credit + coin_value;
    end
  end

endmodule
