`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/29/2023 08:53:18 PM
// Design Name: 
// Module Name: Mux4to1_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: uses counter to cycle the bcd outputs for seven segement display, 4th display is always off, 3rd display is 0 or - only 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux4to1_s(y, a0, a1, negFlag, a3, sel);

    input [3:0] a0, a1, a3;                                 
    input [1:0] sel;                                    //selector 
    input negFlag; 

    output reg [3:0] y; 
    reg [3:0] a2; 

    always @(sel or a0 or a1 or a2 or a3 or negFlag) begin
        case (sel)
            2'b00 : y = a0; 
            2'b01 : y = a1;
            2'b10 : begin                               //this is the neg sign
                if(negFlag)begin
                    a2 = 4'b1111; 
                end
                else begin
                    a2 = 4'b0000; 
                end
                y = a2; 
            end                                        
            default: 
            y = a3;                                     //Off display
        endcase
    end

endmodule
