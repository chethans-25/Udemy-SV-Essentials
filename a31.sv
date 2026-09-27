// Variable example

/*Assume you have four variables ( a, b,c, and d )  in your testbench top. a and b are of the 8-bit reg type, while c and d are of the integer type. initialize a,b,c, and d to values of 12, 34, 67, and 255 respectively. Add a code to print the values of all the variables after 12 nSec.*/

module tb;
  reg [7:0] a, b;
  integer c, d;

  initial begin
    a = 8'd12;
    b = 8'd34;
    c = 32'd67;
    d = 32'd255;
    #12;
    $display("a = %0d, b = %0d, c = %0d, d = %0d", a, b, c, d);
  end

endmodule