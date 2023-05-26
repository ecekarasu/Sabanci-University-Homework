`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 12:56:19 AM
// Design Name: 
// Module Name: lab1
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


module full_adder( input A,
                   input B,
                   input C,
                   output Sum,
                   output Carry

    );
    
    wire w1, w2, w3;
    
    assign Sum = (A ^ B ^ C);
    assign w1 = (A & B); 
    assign w2 = (A & C);
    assign w3 = (B & C);
    assign Carry = (w1 | w2 | w3);
        
endmodule
