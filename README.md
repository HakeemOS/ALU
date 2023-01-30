ALU

ALU circuit that takes 2 4-bit inputs and performs arithmetic or bitwise operations on inputs based on 4 bit input operation code.
Also has carry input. The output is displayed both bitwise using LEDs and in decimal using three seven segement displays. 
Other outputs include: zero, parity, overflow, carry, and negative 

INPUTS: a[3:0], b[3:0], opCode[3:0], carry_in, clk
OUPTUTS: y[4:0], sevenSegment[6:0], an[3:0], negative_out, carry_out, zero_out, overflow_out, parity_out 

Operation code table 
0000: Zero
0001: Pass (a)			              0010: Pass (b)
0011: Inc (a)			                0100: Dec (a)
0101: Add (a,b+cin)		            0110: Sub (a,b-cin)
0111: AND (a,b) 		              1000: OR (a,b)
1001: XOR (a,b)			              1010: 1s Comp (a)
1011: 2s Comp (a)		              1100: A.shift (L: c_in = 0, R: c_in = 1)
1101: L.Shift (same as prev)	    1110: Rotate (b)
1111: Rotate through carry (b)
