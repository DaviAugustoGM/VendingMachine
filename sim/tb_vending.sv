`timescale 1ns/1ps

module tb_vending;

  import vending_pkg::*;

  logic clk;
  logic rst;
  logic [1:0] coin_in;
  logic [1:0] sel_item;
  logic confirm;
  logic cancel;

  logic dispense;
  logic [7:0] change_out;
  logic error;
  logic [7:0] display;
  logic [2:0] state_out;

  int pass_count;
  int fail_count;

  vending_top dut (
    .clk        (clk),
    .rst        (rst),
    .coin_in    (coin_in),
    .sel_item   (sel_item),
    .confirm    (confirm),
    .cancel     (cancel),
    .dispense   (dispense),
    .change_out (change_out),
    .error      (error),
    .display    (display),
    .state_out  (state_out)
  );

  always #5 clk = ~clk;

  task automatic check(input int expected, input int actual, input string label);
    if (expected === actual) begin
      $display("PASS: %s esperado=%0d atual=%0d", label, expected, actual);
      pass_count++;
    end else begin
      $display("FAIL: %s esperado=%0d atual=%0d", label, expected, actual);
      fail_count++;
    end
  endtask

  task automatic reset_dut();
    coin_in  = 2'b00;
    sel_item = 2'b00;
    confirm  = 1'b0;
    cancel   = 1'b0;
    rst      = 1'b1;
    repeat (2) @(posedge clk);
    rst = 1'b0;
    @(posedge clk);
  endtask

  task automatic apply_coin(input logic [1:0] value);
    coin_in = value;
    @(posedge clk);
    #1;
    coin_in = 2'b00;
    @(posedge clk);
    #1;
  endtask

  task automatic pulse_confirm(input logic [1:0] item);
    sel_item = item;
    confirm  = 1'b1;
    @(posedge clk);
    #1;
    confirm  = 1'b0;
  endtask

  task automatic wait_state(input logic [2:0] state, input int max_cycles);
    int i;
    begin
      i = 0;
      while ((state_out !== state) && (i < max_cycles)) begin
        @(posedge clk);
        #1;
        i++;
      end
      if (i >= max_cycles) begin
        $display("FAIL: timeout esperando estado %0d", state);
        fail_count++;
      end
    end
  endtask

  task automatic buy_item(input logic [1:0] item, input logic [1:0] coins[$]);
    foreach (coins[i]) begin
      apply_coin(coins[i]);
    end
    pulse_confirm(item);
  endtask

  initial begin
    $fsdbDumpfile("waves.fsdb");
    $fsdbDumpvars(0, tb_vending);
  end

  initial begin
    logic [1:0] coins[$];

    clk = 1'b0;
    pass_count = 0;
    fail_count = 0;
    reset_dut();

    $display("\nCENARIO 1: compra bem-sucedida com troco");
    coins = {};
    coins.push_back(2'b11); // R$1,00
    buy_item(2'd0, coins);  // café R$0,25
    wait_state(DISPENSE, 20);
    check(1, dispense, "dispense no estado DISPENSE");
    wait_state(IDLE, 20);
    check(75, change_out, "troco do cafe");
    check(0, display, "credito zerado ao final");

    $display("\nCENARIO 2: credito insuficiente");
    reset_dut();
    coins = {};
    coins.push_back(2'b01); // R$0,25
    buy_item(2'd3, coins);  // snack R$1,00
    wait_state(ERROR, 20);
    check(1, error, "error ativo");
    check(ERROR, state_out, "FSM em ERROR");

    $display("\nCENARIO 3: cancelamento");
    reset_dut();
    apply_coin(2'b11);
    apply_coin(2'b11);
    cancel = 1'b1;
    @(posedge clk);
    #1;
    cancel = 1'b0;
    check(0, display, "credito zerado apos cancel");
    check(IDLE, state_out, "FSM retorna para IDLE");
    check(200, change_out, "devolucao por cancelamento");

    $display("\nCENARIO 4: estoque zerado");
    reset_dut();
    for (int i = 0; i < 5; i++) begin
      coins = {};
      coins.push_back(2'b01); // R$0,25
      buy_item(2'd0, coins);
      wait_state(IDLE, 30);
    end

    coins = {};
    coins.push_back(2'b01);
    buy_item(2'd0, coins);
    wait_state(ERROR, 30);
    check(1, error, "6a compra de cafe com estoque zerado");
    check(ERROR, state_out, "FSM em ERROR por estoque zero");

    $display("\nRESULTADO: PASS=%0d FAIL=%0d", pass_count, fail_count);
    if (fail_count == 0) $display("TODOS OS TESTES PASSARAM");
    else                 $display("EXISTEM FALHAS");

    #20;
    $finish;
  end

endmodule
