/*
Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver. 
Also, verify the data by printing the value of data members of Generator and Driver.
*/

class transaction;
  bit [7:0] addr;
  bit [3:0] data;
  bit       we;
  bit       rst;

  function new(bit [7:0] addr = 8'h00,
               bit [3:0] data = 4'h0,
               bit       we   = 1'b0,
               bit       rst  = 1'b0);
    this.addr = addr;
    this.data = data;
    this.we   = we;
    this.rst  = rst;
  endfunction

  function void print(string path = "transaction");
    $display("[%0t] %s: addr=0x%0h data=0x%0h we=%0b rst=%0b",
             $time, path, addr, data, we, rst);
  endfunction
endclass

class generator;
  mailbox mbx;

  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction

  task run();
    transaction tx;
    tx = new(8'h12, 4'h4, 1'b1, 1'b0);
    $display("[%0t] Generator: created transaction and will send it", $time);
    tx.print("Generator (before send)");

    // Send the transaction handle to the mailbox (blocks if mailbox full)
    mbx.put(tx);
    $display("[%0t] Generator: put transaction into mailbox", $time);
    
  endtask
endclass

class driver;
  mailbox mbx;

  function new(mailbox mbx);
    this.mbx = mbx;
  endfunction

  task run();
    transaction rx;
    // Receive the transaction handle from the mailbox
    mbx.get(rx);
    $display("[%0t] Driver: got transaction from mailbox", $time);
    rx.print("Driver (after receive)");

    // Optionally, modify and show driver-side changes
    rx.data = 4'hA;
    $display("[%0t] Driver: modified transaction data to 0x%0h", $time, rx.data);
    rx.print("Driver (after modify)");
  endtask
endclass

module tb;
  mailbox mbx;
  generator gen;
  driver drv;

  initial begin
    mbx = new();
    gen  = new(mbx);
    drv  = new(mbx);

    // Run generator and driver concurrently
    fork
      gen.run();
      drv.run();
    join

    $display("[%0t] Test finished", $time);
    $finish;
  end
endmodule