// transaction, generator, driver, interface, DUT, and testbench
class transaction;
  rand logic [3:0] a, b;
  logic [7:0] mul;

  function new();
  endfunction

  function void display(string msg = "");
    $display("%0s: a = %0d, b = %0d", msg, this.a, this.b);
  endfunction
endclass

class generator;
  mailbox #(transaction) mbx;
  event done;
  int unsigned n_transactions;

  function new(mailbox #(transaction) mbx, int unsigned n = 10);
    this.mbx = mbx;
    this.n_transactions = n;
  endfunction

  task run();
    transaction tx;
    repeat (n_transactions) begin
      tx = new();
      assert(tx.randomize());
      tx.mul = tx.a * tx.b;
      mbx.put(tx);
      tx.display("[GEN] Data sent to driver");
      #10;
    end
    -> done;
  endtask
endclass

class driver;
  virtual mul_if vif;
  mailbox #(transaction) mbx;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task run();
    transaction tr;
    forever begin
      mbx.get(tr);                // blocking get
      @(posedge vif.clk);
      // drive DUT inputs from transaction
      vif.a <= tr.a;
      vif.b <= tr.b;
      tr.display("[DRV] Data sent to interface");
      @(posedge vif.clk); // hold for one cycle if desired
    end
  endtask
endclass


// Interface for connecting generator/driver to DUT
interface mul_if();
  logic clk;
  logic [3:0] a;
  logic [3:0] b;
  logic [7:0] mul;
endinterface : mul_if

// Testbench top
module tb_top;
  // interface instance
  mul_if vif();

  // DUT instance
  top dut (
    .clk(vif.clk),
    .a(vif.a),
    .b(vif.b),
    .mul(vif.mul)
  );

  // TB components
  mailbox #(transaction) mbx;
  generator gen;
  driver drv;
  event gen_done;

  initial begin
    // clock init
    vif.clk = 0;
    forever #5 vif.clk = ~vif.clk; // 10 time unit period
  end

  initial begin
    mbx = new();
    gen = new(mbx, 10);
    drv = new(mbx);
    drv.vif = vif;
    gen_done = gen.done;
  end

  initial begin
    fork
      gen.run();
      drv.run();
    join_none
    // wait for generator done event, then give a few cycles for last transaction to propagate
    wait (gen_done.triggered);
    #20;
    $display("Test complete - finishing simulation");
    $finish;
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_top);
  end
endmodule


// Synchronous 4-bit multiplier DUT
module top
(
  input logic clk,
  input logic [3:0] a,
  input logic [3:0] b,
  output logic [7:0] mul
);
  always @(posedge clk) begin
    mul <= a * b;
  end
endmodule