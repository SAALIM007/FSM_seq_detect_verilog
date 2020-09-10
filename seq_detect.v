//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: seq_detect.v
// Purpose: Implement a RTL level design of a sequence detector to detect pattern “10101011”. Including Repetation.  
// Concept: 1. The test-bench reads one bit at a time from an input file called “pattern.in” which contains a stream of 0’s and 1’s to be used as your input pattern. 
//          2. When the sequence detector detects the pattern, output signal “MATCH”, should go HIGH in the same clock cycle and remains high for 1-clock cycle. If “enable” (* active high) is not active then neither grant is generated, nor priorities updated.
//          3. output is written to a file “seq.out”..
// 
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ns/1ns

module seq_detect (D_IN, CLK, RST, MATCH);
input CLK, RST, D_IN;
output reg MATCH;

parameter  
Start=3'b000, 
S1=3'b001,
S10=3'b010,
S101=3'b011,
S1010=3'b100,
S10101=3'b101,
S101010=3'b110,
S1010101=3'b111;

reg [2:0] state; 

always @(posedge CLK, posedge RST)
begin
if(RST==1)
begin 
state <= Start;
MATCH<=0;
end
else
begin
 case(state) 
 
 Start:
 begin
  MATCH<=0;
  if(D_IN)
   state <= S1;
 end
 
 S1:
 begin
  MATCH<=0;
  if(!D_IN)
   state <= S10;
 end
 
 S10:
 begin
  MATCH<=0;
  if(D_IN)
   state <= S101;
  else
   state <= Start;
 end 
 
 S101:
 begin
  MATCH<=0;
  if(!D_IN)
   state <= S1010;
  else
   state <= S1;
 end
 
 S1010:
 begin
  MATCH<=0;
  if(D_IN)
   state = S10101;
  else
   state = Start;
 end
 
  S10101:
  begin
  MATCH<=0;
  if(!D_IN)
   state <= S101010;
  else
   state <= S1;
 end
 
 S101010:
 begin
  MATCH<=0;
  if(D_IN)
   state = S1010101;
  else
   state = Start;
 end
 
  S1010101:
  begin
  if(D_IN)
   begin
   state = S1;
   MATCH<=1;
   end
  else
   begin 
   state = S101010;
   MATCH<=0;
   end
  end
 
default:state = Start;
endcase
 end
end

endmodule