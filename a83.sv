/*
Code for transaction class is mentioned in the Instruction tab. Write a code to send transaction data between generator and driver. 
Also, verify the data by printing the value of data members of Generator and Driver in each transaction. Execute the code for 10 random transactions.
*/
class transaction;
 
rand bit [7:0] a;
rand bit [7:0] b;
rand bit wr;


  function void print(string Message = "transaction");
    $display("[%0t] %0s : a = %0d, b = %0d, wr = %0b", Message, a, b, wr);
  endfunction

endclass

// Generator: randomize and send transactions
  class generator;
    mailbox mbx;
    int   ntrans;
    function new(mailbox mbx, int ntrans);
      this.mbx = mbx;
      this.ntrans = ntrans;
    endfunction

    task run();
      transaction tx;
      for (int i = 0; i < ntrans; i++) begin
        tx = new();
        // randomize the transaction; check success (should usually pass)
        if (!tx.randomize()) begin
          $display("[%0t] Generator: randomize failed for transaction %0d", $time, i);
        end
        $display("[%0t] Generator: created transaction %0d (before send)", $time, i);
        tx.print($sformatf("Generator trans%0d", i));
        // send handle to mailbox
        mbx.put(tx);
        $display("[%0t] Generator: sent transaction %0d", $time, i);
        // small delay to allow interleaving in simulation
        #1;
      end
    endtask
  endclass

// Driver: receive and print transactions
  class driver;
    mailbox mbx;
    int   ntrans;
    function new(mailbox mbx, int ntrans);
      this.mbx = mbx;
      this.ntrans = ntrans;
    endfunction

    task run();
      transaction rx;
      for (int i = 0; i < ntrans; i++) begin
        mbx.get(rx); // receive handle
        $display("[%0t] Driver: received transaction %0d (after receive)", $time, i);
        rx.print($sformatf("Driver trans%0d", i));
        #1;
      end
    endtask
  endclass


module tb;

  mailbox mbx;
  int num_trans = 10;

  generator gen;
  driver    drv;
  

  initial begin

    // Create mailbox and components
    mbx = new();
    gen = new(mbx, num_trans);
    drv = new(mbx, num_trans);

    // Run generator and driver concurrently
    fork
      gen.run();
      drv.run();
    join

    $display("[%0t] Test finished", $time);
    $finish;
  end

endmodule