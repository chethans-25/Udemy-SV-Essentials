/*
For the Generator code mentioned in the Instruction tab, expected values for variable a ranges from 0 to 8, 
variable b ranges from 0 to 5.
Also, add logic to store the number of times randomization failed.
Print values of variables during each iteration and error count after generating 20 random values for a and b.
Add Constraint Code and Testbench top code to  the Design.

*/

class generator;
  
  rand bit [4:0] a;
  rand bit [5:0] b;
  
  constraint a_c {a>=0; a<=8;}
  constraint b_c {b>=0; b<=5;}
 
  
endclass
 
 

module tb;
  generator g;
  shortint fail_count = 0;
  int i;

  initial begin

    for ( i= 0; i < 20; i++)
    begin
      g = new();
      assert(g.randomize()) else $display("Randomization Failed for iteration %0d!!", i);
      $display("[iteration %0d]: Value of a :%0d and b: %0d ", i, g.a, g.b);
      #20;
    end

    if (fail_count>0)
      $display(" Randomization failed %0d times!!", fail_count);

  end
endmodule