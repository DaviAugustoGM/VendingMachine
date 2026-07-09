`timescale 1ns/1ps


module vending_top (
  input  logic       clk,
  input  logic       rst,
  input  logic [1:0] coin_in,
  input  logic [1:0] sel_item,
  input  logic       confirm,
  input  logic       cancel,

  output logic       dispense,
  output logic [7:0] change_out,
  output logic       error,
  output logic [7:0] display,
  output logic [2:0] state_out
);

  import vending_pkg::*;

  state_t state;

  logic [7:0] credit;
  logic [7:0] coin_value;
  logic [7:0] price;
  logic [7:0] stock;
  logic [7:0] change;

  logic credit_load;
  logic credit_clear;
  logic mem_read;
  logic mem_write;
  logic can_sell;
  logic change_load;

  always_comb begin
    unique case (coin_in)
      2'b00: coin_value = 8'd0;
      2'b01: coin_value = 8'd25;
      2'b10: coin_value = 8'd50;
      2'b11: coin_value = 8'd100;
      default: coin_value = 8'd0;
    endcase
  end

  credit_reg u_credit_reg (
    .clk        (clk),
    .rst        (rst),
    .cancel     (cancel),
    .clear      (credit_clear),
    .load       (credit_load),
    .coin_value (coin_value),
    .credit     (credit)
  );

  memory u_memory (
    .clk       (clk),
    .rst       (rst),
    .mem_read  (mem_read),
    .mem_write (mem_write),
    .addr      (sel_item),
    .price     (price),
    .stock     (stock)
  );

  comparator u_comparator (
    .credit   (credit),
    .price    (price),
    .stock    (stock),
    .can_sell (can_sell)
  );

  subtractor u_subtractor (
    .credit (credit),
    .price  (price),
    .change (change)
  );

  control_unit u_control_unit (
    .clk          (clk),
    .rst          (rst),
    .cancel       (cancel),
    .coin_in      (coin_in),
    .confirm      (confirm),
    .can_sell     (can_sell),
    .state        (state),
    .credit_load  (credit_load),
    .credit_clear (credit_clear),
    .mem_read     (mem_read),
    .mem_write    (mem_write),
    .dispense     (dispense),
    .error        (error),
    .change_load  (change_load)
  );

  always_ff @(posedge clk) begin
    if (rst) begin
      change_out <= 8'd0;
    end else if (cancel) begin
      change_out <= credit; // devolve todo o crédito no cancelamento
    end else if (change_load) begin
      if (state == ERROR) change_out <= credit;
      else                change_out <= change;
    end
  end

  assign display   = credit;
  assign state_out = state;

endmodule
