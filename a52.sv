module multiplication;
  int unsigned n1, n2;
  int unsigned result_calculated;
  int unsigned result_expected;
  int unsigned result;

  // function automatic int unsigned product(input int unsigned n1, input int unsigned n2);
  //   int unsigned result = n1 * n2;//initialization // function needs to be automatic
  //   return result;
  // endfunction

  // function int unsigned product(input int unsigned n1, input int unsigned n2);
  //   int unsigned result;
  //   result = n1 * n2; // function need not to automatic
  //   return result;
  // endfunction

  function void product(input int unsigned n1, input int unsigned n2);
    // int unsigned result;
    result = n1 * n2; // function need not to automatic
    // return result;
  endfunction

  function int unsigned product(input int unsigned n1, input int unsigned n2);
    // int unsigned result;
    return n1 * n2;// simplest way
  endfunction




  initial
  begin
    n1 = 5;
    n2 = 3;
    result_expected = 15;
    product(n1, n2);
    // result_calculated = product(n1, n2);

    $display("\n\nresult = %0d\n\n", result);

    if (result == result_expected) 
      $display("Test Passed");
    else 
      $display("Test Failed");
  end
endmodule