`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/29/2023 08:46:47 PM
// Design Name: 
// Module Name: Counter2Bit_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: uses slowed clock to generate 2 bit counter used as selection input  
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Counter2Bit_s(count, clk);

    input clk; 

    output reg [1:0] count; 

    always @(posedge clk ) begin
        count = count + 1;  
    end

endmodule
