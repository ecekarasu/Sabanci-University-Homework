`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2021 10:32:07 PM
// Design Name: 
// Module Name: comparator_sim
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


module comparator_sim(

    );
    
    //Inputs
    reg X1;
    reg X0;
    reg Y1;
    reg Y0;
    
    //Outputs
    wire LT;
    wire EQ;
    wire GT;
    
    //Instantiate the UUT
    comparator UUT(
    .X1(X1),
    .X0(X0),
    .Y1(Y1),
    .Y0(Y0),
    .LT(LT),
    .EQ(EQ),
    .GT(GT)
    );
    
    //Initialize Inputs
    initial begin
        X1 = 0;
        X0 = 0;
        Y1 = 0;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
        Y1 = 1;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
        X0 = 1;
        Y1 = 0;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
        Y1 = 1;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
        X1 = 1;
        X0 = 0;
        Y1 = 0;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
        Y1 = 1;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
        X0 = 1;
        Y1 = 0;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
        Y1 = 1;
        Y0 = 0;
        #10;
        Y0 = 1;
        #10;
    end
endmodule
