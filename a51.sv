
// Create a Class consisting of 3 data members each of unsigned integer type. Initialize them to 45,78, and 90. Use the display function to print the values on the console.

class class_funda;
  int unsigned num1 = 45;
  int unsigned num2 = 78;
  int unsigned num3 = 90;


  function new();
    
  endfunction
endclass

module tb;
  class_funda class_1;
  initial begin
    class_1 = new();
    $display("num1 = %0d\nnum2 = %0d\nnum3 = %0d", class_1.num1, class_1.num2, class_1.num3);
  end
endmodule