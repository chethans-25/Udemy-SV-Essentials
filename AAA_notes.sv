Verification Series part 1


Signals: Global signals,  data signals,  control signals. 

Initial block
Used to initialize global signals
Used to call system tasks and functions, etc

Always block
Sensitivity list is not mandatory in test bench
If an always block is used without sensitivity list, make Sure to use finish call.

Timescale
Time unit and time precision
Decides how many decimal point can be used in time

Clock Generation 
Frequency, phase, duty cycle, period, half period

Variable types 
Reg, wire,  logic

Fixed - 2 state, 4 state
floating - real 

2 state
Signed- byte, short int, int, long int
Unsigned- bit

4 state
Unsigned -  time,  reg, logic,  wire
Signed - integer

They can be explicitly converted to signed or unsigned.

Arrays
Fixed array
Eg
Bit arr[8];
Bit arr[] = {1,2};

$size(arr);

Unique value  initialization 

Arr[] = '{1,2,3,4};

Repetitive values initialization
Arr[] = '{6{1}};

Default value initialization
Arr[]= '{default:0};

Not initialized arrays
Takes default value based on data type

Array Format specifier %p

Repetitive operation 
For loop, foreach loop, repeat loop, while loop

Use loops inside procedural block

Array copy
Array compare


Dynamic array
Int arr[];

Initial begin
Arr = new[5];
Arr = {1,2,3,4,5};

Arr = new[20];// erases previous data

Arr = new[20](Arr);// retains previous data

end


Queue
Int arr[$];

Initial arr = {1,2,3};// apostrophe not needed

arr.push_front(7);     //7,1,2,3
arr.push_back(5);     //7,1,2,3,5

arr.insert(2,10);       //7,1,10,2,3,5

J = arr.pop_front();      //1,10,2,3,5
// pop returns a value

J = arr.pop_back(); // 1,10,2,3

arr.delete(1);   // 1,2,3


Verification Plan
Directed test,  constrained random test


Layered Testbench architecture 
Layer 1: signal layer (dut)

Layer 2 command Layer
: signal to command and command to signal conversion.

Layer 3 functional Layer: 
schedule commands 

Layer 4 scenario Layer
Generate sequence
Check response against golden data 

Layer 5 test Layer
Control everything


Classes
Handle 
Memory allocation- object creation 
F= new();

Deallocation 
F=null;

Null pointer access error

Class methods
Tasks, Functions.
Go through differences between them

Use Variable after defining methods.

Otherwise don't use Arguments while defining tasks for already defined variables


Argument
Pass by value
Pass by reference ( ref keyword)

Port connection :  (name and position)



Use automatic task or function when using pass by reference

Use const keyword if any value needs to be unchanged when using ref.

Standard constructor new()
Don't use void for this function

this keyword 


Class inside the class
Sub class will have access to modify members and methods

Use local keyword to restrict access. 
Then use methods to get or set access

Copy object to another object for processing and not modifying actual elements. 

Inheritance
Extends keyword 

Polymorphism 
Virtual keyword 

Super keyword 

Randomization 
Rand,randc

Randomization failed or passed?
If statement 
Assertion 

Create new object for new stimuli
( create object inside loop where randomise is called)

Constraints 
Inside keyword 


External constraint 
Extern keyword 
Use semicolon at the end of statement when used externally

Pre randomize and post randomize 

Weighted distribution
Dist keyword

:=  equal weights to all the values inside a range

:/  divide the weights equally among all the values inside a range


Constraint Operators

Implication operator
->

Equivalence operator
<->
It is 2 way implication operator

If else operator
Use flower brackets 

Disable contraint
Constraint_mode(0)

Enable constraint
Constraint_mode(1)

Constraint_mode()
Returns constraint mode status ( 0 or 1)


FIFO transaction class


IPC
Event,  Semaphore,  Mailbox 

Event

example
event a

Trigger
 ->a

Edge sensitive and blocking 
 @( a )

Level sensitive and non blocking  
wait( a.triggered )

Generator and driver code example
Use of event Trigger and wait


Fork join
Fork join_any
Fork join_none


Mailbox and Semaphore need constructors

semaphore sem;
sem = new();

sem.get(1);
sem.put(1);


mailbox mbx;
mbx = new();

Mailbox methods:

mbx.put(data);
mbx.get(data_container);

Common Mailbox usage
Method 1
gen.mbx = mbx;
drv.mbx = mbx;

Method 2
Use
this. mbx = mbx;
 in standard constructor

Parameterize mail box



Interface

Instance of an interface needs parenthesis 

Virtual Interface

Modport
Declare modport inside interface




