/*Generate values between 0 to 7 for addr signal when wr is high and values between 8 to 15 when wr is low. 
Generator code is mentioned in the Instruction tab. 
Verify your code for 20 iterations by sending values of both wr and addr on a console.
*/

class generator;
  
  rand bit [3:0] addr;
  rand bit wr;
  
  /////////////////add constraint 
  constraint high_c {wr -> addr inside {[0:7]};}
  constraint low_c {!wr -> addr inside {[8:15]};}

  function display;
    $display("addr: %0d, wr: %0b", addr, wr);
  endfunction

  
endclass
 
/////////////////Add testbench top code

module tb_top;
  generator g;

  initial begin
    g = new();

    repeat(20)
    begin
      g.randomize();
      g.display();
      #1;
    end
  end
endmodule