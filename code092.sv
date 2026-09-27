// default constructor example 
// this keyword.

class first;
  
  int data1;
  bit [7:0] data2;
  shortint data3;
  // this keyword is used to refer to the current object instance of the class. It is used to differentiate between class members and local variables or parameters with the same name.
  function new(input int data1 = 0, input bit[7:0] data2 = 8'h00, input shortint data3 = 0);
   this.data1 = data1;
   this.data2 = data2;
   this.data3 = data3;    
  endfunction
  
endclass
 
 
module tb;
  
  first f1;
  
  initial begin
    // data3 will be 0 as default value is assigned in constructor
    //f1 = new(23,,35); ///follow position


    f1 = new( .data2(4), .data3(5), .data1(23)); //follow name
    $display("Data1 : %0d, Data2 : %0d and Data3 : %0d", f1.data1, f1.data2, f1.data3); 
  end
  
endmodule