/*
Assume generator class consists of three 8-bit data members (x,y, and z). 
Write a code to generate 20 random values for all the data members at an interval of 20 ns. 
Random values for all data members should range from 0 to 50.
*/

class generator;
  rand bit [7:0] x, y, z;
  constraint x_c {x>=0; x<=50;}
  constraint y_c {y>=0; y<=50;}
  constraint z_c {z>=0; z<=50;}
endclass

module tb;
  generator g;

  initial begin
    g = new();

    for (int i = 0; i < 20; i++)
    begin
      assert(g.randomize()) else $error("Randomization Failed!!");
      $display("Value of x :%0d and y: %0d and z: %0d", g.x,g.y, g.z);
      #20;
    end
  end
endmodule