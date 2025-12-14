/*
Assume the class consists of three 8-bit data members a, b, and c. 
Create a Custom Constructor that allows the user to update the value of these data members while adding a constructor to the class. 
Test your code by adding the value of 2, 4, and 56 to a, b and c respectively.
*/

class data_class;

  bit [7:0] a, b, c;

  function new(bit [7:0] a, b, c);
    this.a = a;
    this.b = b;
    this.c = c;
  endfunction

  function display();
    $info(" [data_class]: a = %0d, b = %0d, c = %0d.", this.a, this.b, this.c);
  endfunction

endclass

module constructor_eg;

  data_class h1;

  initial begin
    h1 = new(2, 4, 56);
    h1.display();
  end
  
endmodule