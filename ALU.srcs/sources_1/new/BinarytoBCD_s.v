`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/28/2023 10:10:50 PM
// Design Name: 
// Module Name: BinarytoBCD_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: receives the output from the ALU and converts it to bcd to be used by sevensegment display
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BinarytoBCD_s(bcd0, bcd1, inNum, clk);

    output reg [3:0] bcd0, bcd1;                                    //ones, tens 

    input [4:0] inNum;                                              //input binary 
    input clk; 

    reg [3:0] n, bcd0_temp, bcd1_temp = 0;
    reg [4:0] inNum_init = 0; 
    reg [12:0] shiftReg = 0;                                        //min required bits for reg; 5 for binary + 8 for bcd 

    always @(posedge clk) begin
        if (n == 0 && (inNum != inNum_init)) begin                  //second cond means you only enter this if at the start 
            shiftReg = 13'b0; 
            inNum_init = inNum; 
            shiftReg[4:0] = inNum;                                  //set first to fifth bits to input number 
            bcd0_temp = shiftReg[8:5];                              //ones
            bcd1_temp = shiftReg[12:9];                             //tens                            
            n = n + 1;      
        end
        if (n > 0 && n < 6) begin                                   //5 shifts for 5 bits
            if(bcd0_temp >= 5) 
                bcd0_temp = bcd0_temp + 3;                          //check if any of the bcd blocks are >= 5 if so add 3
            if(bcd1_temp >= 5)
                bcd1_temp = bcd1_temp + 3; 
            shiftReg[12:5] = {bcd1_temp, bcd0_temp};                // set shift reg to new values if >= 5 condition met
            shiftReg = shiftReg << 1;                               // "<<" shift operator, shifts the bits left by the value on the right side; in this case 1 bit shift to the left 
            bcd0_temp = shiftReg[8:5];                             //ones
            bcd1_temp = shiftReg[12:9];                            //tens; setting our temp values to new values to be checked again
            n = n + 1;    
        end 
        else begin 
                bcd0 = bcd0_temp;                                   //set the two outputs                 
                bcd1 = bcd1_temp;  
                n = 0;                                              //shifting complete, n = 0; 
        end     
    end

endmodule
