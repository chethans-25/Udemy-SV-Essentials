Verification Series part 1

**********Section 2: Fundamentals: procedural constructs ************

Signals: Global signals,  data signals,  control signals. 

Initial block
Execution:Starts at simulation time 0, executes once, and never repeats.

Purpose: Commonly used in testbenches to:
* Initialize signals
* Apply reset sequences
* Generate stimulus
* Display outputs or terminate simulation
* call system tasks and functions, etc

Synthesizability:     Initial blocks are not synthesizable.

Sequential execution: Statements inside an initial block are executed sequentially, one after the other.

Delay control:        Delay control can be used to specify the time at which a statement is executed.



Always block
Execution: Runs continuously throughout simulation, starting at time 0.

Purpose: Describes behavior that should repeat or react to changes in signals.

Sensitivity: Executes whenever signals in its sensitivity list change.

Synthesizability: Unlike initial, always blocks can be synthesizable, depending on how they are written.

Types:

always_comb → for combinational logic

always_ff → for sequential logic (flip-flops)

always_latch → for latches

Sensitivity list is not mandatory in test bench
eg: always #5 clk = ~clk;
If an always block is used without sensitivity list, make sure to use finish call.

Timescale
Time unit and time precision
Decides how many decimal point can be used in time
syntax: `timescale <time_unit>/<time_precision>
time_unit → the base unit for delays (e.g., 1ns, 10ps, 1us).
time_precision → the resolution or rounding of simulation time (e.g., 1ps, 100fs).
default timescale is 1ns/1ps if not specified.
scope of timescale: Timescale directive is local to the file in which it is declared. It does not affect other files unless explicitly specified.

If presision is not proper, #5.6 will be rounded to #6.0, #5.4 will be rounded to #5.0, #5.5 will be rounded to #6.0


Clock Generation 
Frequency, phase, duty cycle, period, half period, t_on, t_off


**********Section 3: Understanding SV Data Types ************

Data types 
Hardware data types: reg, wire, logic

Variable data types: 
Fixed - 2 state, 4 state
floating - real (64 bit double precision), shortreal (32 bit single precision)

2 state
Signed- byte, short int, int, long int
Unsigned- bit

4 state
Unsigned -  time,  reg, logic,  wire
Signed - integer

They can be explicitly converted to signed or unsigned.

Simulation data types:
time
realtime


Arrays
Fixed array
Eg
Bit arr[8];

$size(arr);

Unique value  initialization 

Arr[] = '{1,2,3,4}; //dynamic unique value initialization

Repetitive values initialization
Arr[] = '{6{1}}; //dynamic repetitive value initialization

Default value initialization
Arr[]= '{default:0}; //dynamic default value initialization

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




