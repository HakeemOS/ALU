`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2023 10:20:17 PM
// Design Name: 
// Module Name: BtoBCD_tb
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


module BtoBCD_tb();

    reg [4:0] INNUM; 
    reg CLK; 

    wire [3:0] BCD0, BCD1; 

    BinarytoBCD_s U1 (BCD0, BCD1, INNUM, CLK); 

    always #5 CLK = ~CLK; 

    initial begin

        CLK = 0; 
        INNUM = 3;

        #120
        INNUM = 7;

        #120
        INNUM = 12;

        #120
        INNUM = 29; 


    end

endmodule
