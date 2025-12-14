/*
Create a deep copy of the Generator class. 
To verify the deep copy code assign value of the copy method to another instance of the generator class in TB top. 
Print the value of data members in the generator class as well as copied class. Refer Instruction tab for Generator class code.
*/

class generator;
  
  bit [3:0] a = 5,b =7;
  bit wr = 1;
  bit en = 1;
  bit [4:0] s = 12;
  
  function void display();
    $display("a:%0d b:%0d wr:%0b en:%0b s:%0d", a,b,wr,en,s);
  endfunction

  function generator copy();
    copy = new();
    copy.a = this.a;
    copy.b = this.b;
    copy.wr = this.wr;
    copy.en = this.en;
    copy.s = this.s;
  endfunction
 
endclass

module tb;
  
  generator g1;
  generator g2;
  
  initial begin
    g1 = new();
    $display("generator g1 members before deep copy:");
    g1.display();
    
    g2 = g1.copy();

    g1.a = 10;
    $display("generator g1 members after deep copy, after modifying g1 member a :");
    g1.display();
    
    $display("generator g2 members after deep copy, after modifying g1 member a :");
    g2.display();   
  end

endmodule