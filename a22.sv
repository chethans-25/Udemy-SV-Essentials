/*Use an initial block to initialize clk to '0 and resetn to '0. The user must maintain resetn in an active-low state for 100 ns at the start of the simulation, then toggle resetn to active-high ('1) and back to active-low ('0) every 50 ns thereafter. Assume a timescale of 1 ns/1 ps.

A testbench skeleton is already provided on the edaplayground project. Your task is to use the resetn signal to generate reset stimulus. Add logic only in the designated "user logic goes here" section and complete the code before the "user code ends here" statement.

You can use as many lines as needed. Do not modify the rest of the code as it's essential for self-checking logic, but you can modify your code within this area freely.*/

class test;
  bit rst  = 1;
  int temp = 0;
  
  
  task display();
    $display("---------------------------");
    $display("magic_no = %0d", this.temp);
    $display("---------------------------");
  endtask
  
  task no_gen(rst);
    this.temp = rst*7*8*3; 
  endtask
  
endclass

`include "test.sv"


module tb;
  reg clk;
  reg resetn = 0;   //////rst represent DUT reset Signal

  /////// User Logic goes here
  initial begin
    clk = 1'b0;
    resetn = 1'b0;
    #100;
    resetn = 1'b1;
    #50;
    resetn = 1'b0;
    #50;
    resetn = 1'b1;
    #50;
    resetn = 1'b0;
    #50;
    resetn = 1'b1;
    #50;
    resetn = 1'b0;
  end

  
  
  
  
  /////// User code ends here
 
  
  test t1 = new();
  
  initial begin
    #201;
    t1.no_gen(resetn);
    t1.display();
  end
  
  
endmodule