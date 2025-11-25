/*
Take the help of pseudo-random number generator to generate values for wr and rst signal. 
rst should be low for apprx. 30% of time whie wr should be high for apprx. 50% of time. 
Verify your code for 20 iterations by sending values of both wr and rst on a console.
*/

class generator;
  rand bit wr;
  rand bit rst;

  constraint wr_c {wr dist {0:=50, 1:=50};}
  constraint rst_c {rst dist {0:=30, 1:=70};}
  
endclass

module tb;
  generator g;
  int i;
  
  initial begin
    for (i = 0; i < 20 ; i++ ) begin
      g = new();
      assert (g.randomize()) 
      else   $display("Randomization Failed");

      $display("[iteration %0d]: Value of wr :%0d and rst: %0d ", i, g.wr, g.rst);
      #20;     
    end
  end
endmodule