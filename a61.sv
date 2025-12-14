/*

Assume generator class consists of three 8-bit data members (x,y, and z). 
Write a code to generate 20 random values for all the data members at an interval of 20 ns.

*/

class generator;
  rand bit [7:0] x, y, z; ////////////rand or randc 
endclass
 
module tb;
  generator g;
  int i = 0;  
  initial begin
   g = new();
    
    for(i=0;i<20;i++) begin
      
      assert(g.randomize()) else $display("Randomization Failed");
      $display("Value of x :%0d and y: %0d and z: %0d", g.x,g.y, g.z);
      #20;
    end
    
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #450 $finish;
  end
  
endmodule