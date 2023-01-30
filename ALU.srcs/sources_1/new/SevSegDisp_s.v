`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/29/2023 08:57:03 PM
// Design Name: 
// Module Name: SevSegDisp_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: receives a bcd input and displays it as the correct digit in seven segement display
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SevSegDisp_s(disp_out, bcd_in);

    input [3:0] bcd_in; 

    output reg [6:0] disp_out; 

    always @(bcd_in) begin
        case (bcd_in)
            4'b0000 : disp_out = 7'b1000000; 
            4'b0001 : disp_out = 7'b1111001; 
            4'b0010 : disp_out = 7'b0100100; 
            4'b0011 : disp_out = 7'b0110000; 
            4'b0100 : disp_out = 7'b0011001; 
            4'b0101 : disp_out = 7'b0010010; 
            4'b0110 : disp_out = 7'b0000010; 
            4'b0111 : disp_out = 7'b1111000; 
            4'b1000 : disp_out = 7'b0000000; 
            4'b1001 : disp_out = 7'b0010000; 
            4'b1111 : disp_out = 7'b0111111; 
            default: 
            disp_out = 7'b1000000; 
        endcase
    end

endmodule


