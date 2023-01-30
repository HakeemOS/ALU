`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Hakeem S
// 
// Create Date: 01/27/2023 11:53:27 AM
// Design Name: 
// Module Name: ALU_s
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: receives perfomes arithmetic and bitwise operations or either one or both of a, b 4 bit inputs based 4 bit opcode. 

// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_s(y, twosComp, c_out, zero_out, neg_out, overflow_out, parity_out, a, b, c_in, opCode, clk);

    input [3:0] a, b, opCode;
    input c_in, clk; 

    output reg [4:0] y, twosComp; 
    output reg c_out, zero_out, neg_out, overflow_out, parity_out = 0;  

    reg temp = 0;  
 

    always @(posedge clk) begin

        case (opCode)
            4'b0001 :begin                                              //Pass through (a)
                y = a;                                            
                twosComp = y;
                neg_out = 0;
            end  
            4'b0010 : begin                                             //Pass through (b)
                y = b;
                twosComp = y; 
                neg_out = 0;
            end                                             
            4'b0011 : begin                                             //inc (a)
                y = a + 1;
                twosComp = y; 
                neg_out = 0;
            end                                        
            4'b0100 : begin                                             //dec (a)
                y = a - 1;
                twosComp = y; 
                temp = y[3]; 
                if (temp) begin
                    neg_out = 1;
                end else begin
                    neg_out = 0;
                end
            end                                        
            4'b0101 : begin                                             //ADD (a, b, c_in)
                y = a + b + c_in;
                twosComp = y; 
                neg_out = 0;
            end                                 
            4'b0110 : begin                                             //SUB (a, b, c_in, also converting from twos comp)
                y = a - b - c_in;                           
                temp = y[4]; 
                if(temp)begin
                twosComp = ~y + 1; 
                neg_out = 1; 
                end
                else begin
                    twosComp = y;
                    neg_out = 0;
                end
            end
            4'b0111 : begin                                             //AND (a, b)
                y = a & b;
                twosComp = y; 
                neg_out = 0;
            end                                            
            4'b1000 : begin                                             //OR (a, b)
                y = a | b;
                twosComp = y; 
                neg_out = 0;
            end                                        
            4'b1001 : begin                                              //XOR (a, b)
                y = a ^ b; 
                twosComp = y; 
                neg_out = 0;
            end                                       
            4'b1010 : begin                                             //ones comp
                y = ~a;
                y[4] = 0;
                twosComp = y; 
                neg_out = 0;
            end  
            4'b1011 : begin                                             //twos comp
                temp = a[3]; 
                if(temp)begin
                    y = ~a + 1; 
                    y[4] = 0;
                    neg_out = 1; 
                    twosComp = y;  
                end 
                else begin
                    y = a; 
                    twosComp = y; 
                    neg_out = 0;
                end
                y[4] = 0; 
            end 
            4'b1100 :                                                   //a.shift 
                if(c_in)begin
                    overflow_out = y[0]; 
                    y = b >>> 1; 
                    twosComp = y;
                    neg_out = 0;
                end
                else begin
                    y = b <<< 1; 
                    twosComp = y; 
                    neg_out = 0;
                    overflow_out = y[4];
                end
            4'b1101 :                                                   //l.shift
                 if(c_in)begin
                    overflow_out = y[0]; 
                    y = b >> 1; 
                    twosComp = y; 
                    neg_out = 0;
                end
                else begin
                    y = b << 1; 
                    twosComp = y; 
                    neg_out = 0;
                    overflow_out = y[4];
                end
            4'b1110 :                                                   //rotate 
                begin
                    y = b << 1; 
                    y[0] = y[4];
                    y[4] = 0;  
                    twosComp = y; 
                    neg_out = 0;
                end
            4'b1111 :                                                   //rotate with carry; 
                begin
                    y = b << 1; 
                    y[0] = c_in; 
                    temp = y[4]; 
                    y = y << 1;  
                    y[0] = temp; 
                    twosComp = y; 
                    neg_out = 0;
                end
            default: begin
                y = 0;  
                twosComp = y; 
                zero_out = 1;                                           //zero opcode 
            end
        endcase
        temp = y[0]; 
        if (!temp) begin
            parity_out = 1;
        end
        else begin
            parity_out = 0; 
        end
        if(!y)begin
            zero_out = 1; 
        end
        else begin
            zero_out = 0; 
        end
   
    end

endmodule
