`timescale 1ns/1ps

package vending_pkg;

  typedef enum logic [2:0] {
    IDLE     = 3'b000,
    COLLECT  = 3'b001,
    CHECK    = 3'b010,
    DISPENSE = 3'b011,
    CHANGE   = 3'b100,
    ERROR    = 3'b101
  } state_t;

  localparam logic [7:0] COIN_NONE = 8'd0;
  localparam logic [7:0] COIN_25   = 8'd25;
  localparam logic [7:0] COIN_50   = 8'd50;
  localparam logic [7:0] COIN_100  = 8'd100;

endpackage
