`timescale 1ns/1ps

module control_unit (
  input  logic              clk,
  input  logic              rst,
  input  logic              cancel,
  input  logic [1:0]        coin_in,
  input  logic              confirm,
  input  logic              can_sell,

  output vending_pkg::state_t state,
  output logic              credit_load,
  output logic              credit_clear,
  output logic              mem_read,
  output logic              mem_write,
  output logic              dispense,
  output logic              error,
  output logic              change_load
);

  import vending_pkg::*;

  state_t current_state, next_state;
  logic check_wait, check_wait_next;

  assign state = current_state;

  always_ff @(posedge clk) begin
    if (rst || cancel) begin
      current_state <= IDLE;
      check_wait    <= 1'b0;
    end else begin
      current_state <= next_state;
      check_wait    <= check_wait_next;
    end
  end

  always_comb begin
    next_state      = current_state;
    check_wait_next = check_wait;

    unique case (current_state)
      IDLE: begin
        check_wait_next = 1'b0;
        if (coin_in != 2'b00) next_state = COLLECT;
      end

      COLLECT: begin
        check_wait_next = 1'b0;
        if (confirm) next_state = CHECK;
        else         next_state = COLLECT;
      end

      CHECK: begin
        // 1º ciclo em CHECK: aciona leitura síncrona da memória.
        // 2º ciclo em CHECK: price/stock já estão registrados e can_sell é válido.
        if (!check_wait) begin
          next_state      = CHECK;
          check_wait_next = 1'b1;
        end else begin
          next_state      = can_sell ? DISPENSE : ERROR;
          check_wait_next = 1'b0;
        end
      end

      DISPENSE: begin
        next_state = CHANGE;
      end

      CHANGE: begin
        next_state = IDLE;
      end

      ERROR: begin
        next_state = ERROR;
      end

      default: begin
        next_state      = IDLE;
        check_wait_next = 1'b0;
      end
    endcase
  end

  always_comb begin
    credit_load  = 1'b0;
    credit_clear = 1'b0;
    mem_read     = 1'b0;
    mem_write    = 1'b0;
    dispense     = 1'b0;
    error        = 1'b0;
    change_load  = 1'b0;

    unique case (current_state)
      IDLE: begin
        // Conta a primeira moeda no mesmo ciclo em que ela tira a FSM do IDLE.
        // Assim um pulso de coin_in com 1 ciclo já é suficiente.
        credit_load = (coin_in != 2'b00);
      end

      COLLECT: begin
        credit_load = (coin_in != 2'b00);
      end

      CHECK: begin
        mem_read = !check_wait;
      end

      DISPENSE: begin
        dispense  = 1'b1;
        mem_write = 1'b1;
      end

      CHANGE: begin
        change_load  = 1'b1;
        credit_clear = 1'b1;
      end

      ERROR: begin
        error       = 1'b1;
        change_load = 1'b1; // devolve crédito em change_out
      end

      default: begin
      end
    endcase
  end

endmodule
