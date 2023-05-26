`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2021 10:07:16 PM
// Design Name: 
// Module Name: comparator
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


module comparator(input X1,
                  input X0,
                  input Y1,
                  input Y0,
                  output LT,
                  output EQ,
                  output GT
    );
    
    wire w1, w2, w3, w4, w5, w6, w7, w8;
    
    assign w1 = (~X1) & Y1;
    assign w2 = (~X1) & (~X0) & Y0;
    assign w3 = (~X0) & Y1 & Y0;
    assign w4 = (X0 | (~Y0)) & ((~X0) | Y0);
    assign w5 = (X1 | (~Y1)) & ((~X1) | Y1);
    assign w6 = X1 & (~Y1);
    assign w7 = X0 & (~Y1) & (~Y0);
    assign w8 = X1 & X0 & (~Y0);
    assign LT = w1 | w2 | w3;
    assign EQ = w4 & w5;
    assign GT = w6 | w7 | w8;
        
endmodule
