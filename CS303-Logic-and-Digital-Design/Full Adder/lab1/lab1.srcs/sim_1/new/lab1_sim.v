`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2021 01:21:49 AM
// Design Name: 
// Module Name: lab1_sim
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


module lab1_sim(

    );
    
    //Inputs
    reg A;
    reg B;
    reg C;
    
    //Outputs
    wire Sum;
    wire Carry;
    
    //Instantiate the UUT
    full_adder UUT (
    .A(A),
    .B(B),
    .C(C),
    .Sum(Sum),
    .Carry(Carry)
    );
    
    //Initialize Inputs
    initial begin
        A = 0;
        B = 0;
        C = 0;
        #10;
        C = 1;
        #10;
        C = 0;
        B = 1;
        #10;
        C = 1;
        #10;
        A = 1;
        B = 0;
        C = 0;
        #10;
        B = 1;
        #10;
        B = 0;
        C = 1;
        #10;
        B = 1;
    end
endmodule
