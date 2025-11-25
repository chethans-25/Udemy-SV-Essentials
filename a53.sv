/*
Create a task that will generate stimulus for 
addr , wr, and en signal as mentioned in a waveform of the Instruction tab. 
Assume address is 6-bit wide while en and wr both are 1-bit wide. 
The stimulus should be sent on a positive edge of 25 MHz clock signal.
*/
module assignment();
  bit clk;
  bit wr;
  bit en;
  bit [5:0] addr;

  always #20 clk = ~clk;

  task gen_stim();
    @posedge(clk);
    en = 1;
    wr = 1;
    addr = 'd12;
    @posedge(clk);
    addr = 'd14;
    @posedge(clk);
    wr = 0;
    addr = 'd23;
    @posedge(clk);
    addr = 'd48;
    @posedge(clk);
    en = 0;
    addr = 'd56;
  endtask

  initial begin
    gen_stim();
  end

endmodule