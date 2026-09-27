`timescale 1ns / 1ps
// Clock generation with tasks
module tb();
 
  
  reg clk = 0; 
  reg clk50 = 0;
  
  always #5 clk = ~clk; //100 MHz
    
  /*
  real phase = 10;
  real ton = 5;
  real toff = 5;
  */
  
  /*  
  task clkgen(input real phase, input real ton, input real toff);  
    #phase;
    while(1) begin
    clk50 = 1;
    #ton;
    clk50 = 0;
    #toff;
    end
  endtask
  */
  
  // Task to calculate phase, ton and toff based on frequency, duty cycle and phase
  task calc (input real freq_hz, input real duty_cycle, input real phase, output real pout, output real ton, output real toff);
    pout = phase;
    ton = (1.0 / freq_hz) * duty_cycle * 10**9;
    toff =  (10**9 / freq_hz) - ton;
  endtask
  
  // Task to generate clock with given phase, ton and toff
  task clkgen(input real phase, input real ton, input real toff);  
    @(posedge clk);
    #phase;
    while(1) begin
    clk50 = 1;
    #ton;
    clk50 = 0;
    #toff;
    end
  endtask
 
  real phase;
  real ton;
  real toff;
  
 
  initial begin
    calc(100_000_000, 0.1, 2, phase, ton, toff);
    clkgen(phase, ton, toff);
  end
 
 
 
  initial begin
    #200;
    $finish();
  end

  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
  end
  
endmodule