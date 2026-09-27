/*Assume a system consists of two global signals, resetn and clk. Use an initial block to initialize clk to '0 and resetn to '0. The user must maintain resetn in an active-low state for 60 ns at the start of the simulation and then make it active-high. Assume a timescale of 1 ns/1 ps.

A testbench skeleton is already provided on the edaplayground project. Your task is to use the rst signal to generate reset stimulus. Add logic only in the designated "user logic goes here" section and complete the code before the "user code ends here" statement. You can use as many lines as needed. Do not modify the rest of the code as it's essential for self-checking logic, but you can modify your code within this area freely.*/
class test;
  bit rst  = 1;
  int temp = 0;
  
  
  task display();
    $display("---------------------------");
    $display("magic_no = %0d", this.temp);
    $display("---------------------------");
  endtask
  
  task no_gen(rst);
    this.temp = rst*5*6*2; 
  endtask
  
endclass

`include "test.sv"
module tb;
  
  reg rst = 0;   //////rst represent DUT reset Signal
  reg clk;
  reg resetn;

  /////// User Logic goes here
  initial begin
    clk = 1'b0;
    resetn = 1'b0;
    #60;
    resetn = 1'b1;
  end
  /////// User code ends here
 
  
  test t1 = new();
  
  initial begin
    #59;
    t1.no_gen(rst);
    t1.display();
  end
  
  
endmodule


/*
After executing code without error you will see magic number in between series of hyphens, copy entire string and paste it in the exercise.py, editor that you see on the screen. for e.g. if you get following on console after running code then you need to copy "magic_no = 60" (double quotes are added for clarification, you don't need to add them while pasting code in exercise.py) and paste it in exercise.py*/