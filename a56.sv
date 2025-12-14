/*
Assume class consists of three data members a, b, and c each of size 4-bit. 
Create a task inside the class that returns the result of the addition of data members. 
The task must also be capable of sending the value of a, b, c, and result to the console. 
Verify code for a = 1, b = 2, and c = 4.
*/

class data_class;

  bit [3:0] a, b, c;

  function new(bit [7:0] a, b, c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction

  task add_and_display();
    bit [5:0] result;
    result = this.a + this.b + this.c;
    $info(" [data_class]: a = %0d, b = %0d, c = %0d, Result = ", this.a, this.b, this.c, result);
  endtask

endclass

module sum_eg;

  data_class h1;

  initial begin
    h1 = new(1, 2, 4);
    h1.add_and_display();
  end
  
endmodule