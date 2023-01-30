`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/29/2023 09:37:36 PM
// Design Name: 
// Module Name: Top_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Top module; connects modules 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top_s (y, sevSeg_out, an_out, neg_out, c_out, zero_out, overflow_out, parity_out, a, b, opCode, c_in, clk);

    input [3:0] a, b, opCode; 
    input c_in;
    input clk; 

    output [6:0] sevSeg_out; 
    output [4:0] y; 
    output [3:0] an_out; 
    output neg_out; 
    output c_out, zero_out, overflow_out, parity_out; 


    wire [4:0] twosComp; 
    wire [3:0] bcd0, bcd1, bcd_out;
    wire [1:0] counter;  
    wire negFlag, clk_1kHz; 

    reg [3:0] muxZeros = 4'b0000;

    ALU_s U2 (y, twosComp, c_out, zero_out, negFlag, overflow_out, parity_out, a, b, c_in, opCode, clk); 
    BinarytoBCD_s U3 (bcd0, bcd1, twosComp, clk); 
    Clock1kHz_s U4 (clk_1kHz, clk); 
    Counter2Bit_s U5 (counter, clk_1kHz); 
    Mux4to1_s U6 (bcd_out, bcd0, bcd1, negFlag, muxZeros, counter);
    Decoder2to4_s U7 (an_out, counter);
    SevSegDisp_s U8 (sevSeg_out, bcd_out);

    assign neg_out = negFlag; 



endmodule
