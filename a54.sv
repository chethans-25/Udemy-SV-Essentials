/*
Create a function that generate and return 32 values of multiple of 8 (0, 8, 16, 24, 32, 40 .... 248). 
Store this value in the local array of the testbench top and also print the value of each element of this array on the console.
*/


module tb_top;
int arr[32];
int i;
initial
begin

  for (i = 0; i < $size(arr) ; i++ ) begin
    arr[i] = 8*(i);
  end

  $display("Array Vaues: %0p", arr);
end
endmodule