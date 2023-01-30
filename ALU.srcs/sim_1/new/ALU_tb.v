`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 02:30:56 PM
// Design Name: 
// Module Name: ALU_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_tb();

    reg [3:0] A, B, OPCODE;
    reg C_IN;

    wire [4:0] Y, TWOSCOMP; 
    wire C_OUT, ZERO_OUT, NEG_OUT, OVERFLOW_OUT, PARITY_OUT; 

    ALU_s U0 (Y, TWOSCOMP, C_OUT, ZERO_OUT, NEG_OUT, OVERFLOW_OUT, PARITY_OUT, A, B, C_IN, OPCODE);

    initial begin

        A = 9; 
        B = 14;
        C_IN = 0;
        OPCODE = 4'b0000; 

        #50
        OPCODE = 4'b0001;

        #50
        OPCODE = 4'b0010;

        #50
        OPCODE = 4'b0011;

        #50
        OPCODE = 4'b0100;

        #50
        OPCODE = 4'b0101;

        #50
        OPCODE = 4'b0110;

        #50
        OPCODE = 4'b0111;

        #50
        OPCODE = 4'b1000;

        #50
        OPCODE = 4'b1001;

        #50
        OPCODE = 4'b1010;

        #50
        OPCODE = 4'b1011; 

        #50
        C_IN = 1; 


    end
   

endmodule
