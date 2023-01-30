`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem
// 
// Create Date: 01/29/2023 08:44:32 PM
// Design Name: 
// Module Name: Clock1kHz_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 1kHz clock
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clock1kHz_s(clk_out, clk);

    input clk; 
    output clk_out; 

    reg [18:0] counter = 0;
    reg clk_temp;        

    always @(posedge clk ) begin
        counter = counter + 1; 
        if (counter == 50000) begin         //count to 50,000 for 1000 Hz 
            counter = 0; 
            clk_temp = ~clk_temp; 
        end       
    end 

    assign clk_out = clk_temp; 

endmodule
