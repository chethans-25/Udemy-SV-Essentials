/*
Create two tasks each capable of sending a message to Console at a fixed interval. 
Assume Task1 sends the message "Task 1 Trigger" at an interval of 20 ns 
while Task2 sends the message "Task 2 Trigger" at an interval of 40 ns. 

Keep the count of the number of times Task 1 and Task 2 trigger by adding a variable for keeping the track of task execution and incrementing with each trigger. Execute both tasks in parallel till 200 nsec. 
Display the number of times Task 1 and Task 2 executed after 200 ns before calling $finish for stopping the simulation.
*/

module tb;
int count;

task task1();
  #20;
  $display("Task 1 Trigger");
  count = count + 1;
endtask

task task2();
  #40;
  $display("Task 2 Trigger");
  count = count + 1;
endtask

task display_finish();
  #200 $display("Count: %0d", count);
  $finish;
endtask

initial
begin
  fork
    forever task1();
    forever task2();
    display_finish();
  join
end

endmodule