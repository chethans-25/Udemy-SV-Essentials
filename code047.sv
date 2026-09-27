// Looping constructs on Array

module tb;
  
  int arr[10];///0-9
  int i =0;
 
  /*
  // for loop
  initial begin
    for(i= 0; i< 10; i++) begin
      arr[i] = i;    
    end
    $display("arr : %0p", arr);
  end
  
  */
  
  /*
  // foreach loop
  initial begin
    foreach(arr[j]) begin //0---9
      arr[j] = 5;
      $display("%0d", arr[j]);
    end
  end
  */
  
  // repeat loop
  initial begin
    repeat(10) begin
      arr[i] = i;
      i++;
    end
    $display("arr : %0p",arr); 
  end
  
endmodule