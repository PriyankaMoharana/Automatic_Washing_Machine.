
`include "Automatic_Washing_Machine.v"

module Automatic_Washing_Machine_Test_Bench;
reg Clock,Reset,Start,Door_Close,Filled,Drained,
   Detergent_Added,Cycle_Timeout,Spin_Timeout;
wire Motor_on,Fill_valve_on,Drained_valve_on,Door_Lock,Done;
 
  Automatic_Washing_Machine Machine(Clock,Reset,Start,Door_Close,
  Filled,Drained, Detergent_Added, Cycle_Timeout,Spin_Timeout,Motor_on,
  Fill_valve_on,Drained_valve_on, Door_Lock,Done);
 
 Automatic_Washing_Machine Automatic_Washing_Machine(.Clock(Clock),.Reset(Reset),.Start(Start),
 .Door_Close(Door_Close),.Filled(Filled),.Drained(Drained),.Detergent_Added(Detergent_Added),
 .Cycle_Timeout(Cycle_Timeout),.Spin_Timeout(Spin_Timeout),.Motor_on(Motor_on),.Fill_valve_on(Fill_valve_on),
 .Drained_valve_on(Drained_valve_on),.Door_Lock(Door_Lock),.Done(done));
 
  initial
  begin
    $dumpfile("Project.vcd");
    $dumpvars(0);
  end
  
  initial
  begin
   Clock=0;
   Reset=1;
   Start=0;
   Door_Close=0;
   Filled=0;
   Drained=0;
   Detergent_Added=0;
   Cycle_Timeout=0;
   Spin_Timeout=0;
   #5 Reset=0;
   #5 Start=1; Door_Close=1;
   #10 Filled=1;
   #10 Detergent_Added=1;
   #10 Cycle_Timeout=1;
   #10 Drained=1;
   #10 Spin_Timeout=1;
  end
  always
  begin
   #5 Clock = ~Clock;
  end
  
  endmodule