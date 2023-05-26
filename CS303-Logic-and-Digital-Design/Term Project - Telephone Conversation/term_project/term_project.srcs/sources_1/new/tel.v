`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2021 01:23:29 AM
// Design Name: 
// Module Name: tel
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

module tel(input clk,
           input rst,
           input startCall, answerCall,
           input endCall,
           input sendChar,
           input [7:0] charSent,
           output reg [63:0] statusMsg,
           output reg [63:0] sentMsg
    );
    
    parameter IDLE = 0;
    parameter RINGING = 1;
    parameter BUSY = 2; 
    parameter REJECTED = 3;
    parameter CALLER = 4;
    parameter COST = 5;
    
    reg [2:0] currState = IDLE, nextState;
    reg [3:0] counter = 0;
    reg [31:0] cost = 8'h00000000;
    reg [7:0] temp = 8'b00000000;
    reg [1:0] initial_flag = 2'b00; 
    
    always @ (posedge clk or posedge rst)
    begin
        if(rst)    
            counter <= 0;
        else if(clk) begin
            if(currState == IDLE) begin
                sentMsg = 0;
                cost = 0;
            end
            if(currState == RINGING | currState == BUSY | currState == REJECTED | currState == COST)
                counter <= counter + 1;
            else
                counter <= counter;
        end
    end
    
    always @ (posedge clk or posedge rst)
    begin
         if(rst)    
            currState <= 0;
        else if(clk)
            currState <= nextState;
    end
    
    always @ (*)
    begin
        if(initial_flag == 2'b00) begin
            statusMsg = 0;
            sentMsg = 0;
        initial_flag = 2'b01;
        end
        case(currState) 
            IDLE: begin
                if(startCall == 1) begin
                    nextState = RINGING;
                    counter = 1;
                end
                else
                    nextState = IDLE;
            end
            RINGING: begin
                if(endCall == 1) begin
                    nextState = REJECTED;
                    counter = 0;
                end
                else if(answerCall == 1) begin
                    nextState = CALLER;
                    counter = 1;
                end
                else if(counter == 10) begin
                    nextState = BUSY;
                    counter = 0;
                end
                else
                        nextState = RINGING;
            end
            BUSY: begin
                if(counter == 10) begin
                    nextState = IDLE;
                    counter = 1;
                end
                else
                    nextState = BUSY;
            end
            REJECTED: begin
                if(counter == 10) begin 
                    nextState = IDLE;
                    counter = 1;
                end
                else
                    nextState = REJECTED;
            end
            CALLER: begin
                if(endCall == 1) begin;
                    nextState = COST;
                    counter = 1;
                end
                else if(charSent == 127) begin
                    cost = cost + 2; 
                    nextState = COST;
                    counter = 1;
                end
                else
                    nextState = CALLER;
            end
            COST: begin
                if(counter == 5) begin
                    nextState = IDLE;
                    counter = 1;
                end
                else
                    nextState = COST;
            end
        endcase
    end
    
    always @ (posedge clk or posedge rst)
    begin
        if(rst) begin
            statusMsg <= 0;
            sentMsg <= 0;
        end
        else if(clk) begin
            case(currState)
                IDLE: begin
                    statusMsg[63:56] = "I";
                    statusMsg[55:48] = "D";
                    statusMsg[47:40] = "L";
                    statusMsg[39:32] = "E";
                    statusMsg[31:0] = " ";
                end
                RINGING: begin
                    statusMsg[63:56] = "R";
                    statusMsg[55:48] = "I";
                    statusMsg[47:40] = "N";
                    statusMsg[39:32] = "G";
                    statusMsg[31:24] = "I";
                    statusMsg[23:16] = "N";
                    statusMsg[15:8] = "G";
                    statusMsg[7:0] = " ";         
                end
                BUSY: begin
                    statusMsg[63:56] = "B";
                    statusMsg[55:48] = "U";
                    statusMsg[47:40] = "S";
                    statusMsg[39:32] = "Y";
                    statusMsg[31:0] = " ";
                end
                REJECTED: begin
                    statusMsg[63:56] = "R";
                    statusMsg[55:48] = "E";
                    statusMsg[47:40] = "J";
                    statusMsg[39:32] = "E";
                    statusMsg[31:24] = "C";
                    statusMsg[23:16] = "T";
                    statusMsg[15:8] = "E";
                    statusMsg[7:0] = "D";           
                end
                CALLER: begin
                    statusMsg[63:56] = "C";
                    statusMsg[55:48] = "A";
                    statusMsg[47:40] = "L";
                    statusMsg[39:32] = "L";
                    statusMsg[31:24] = "E";
                    statusMsg[23:16] = "R";
                    statusMsg[15:0] = " ";
                end
                COST: begin
                    statusMsg[63:56] = "C";
                    statusMsg[55:48] = "O";
                    statusMsg[47:40] = "S";
                    statusMsg[39:32] = "T";
                    statusMsg[31:0] = " ";         
                end
            endcase
        end
    end
    
    always @ (posedge clk)
    begin
        if(clk) begin
            case(currState)
                CALLER: begin
                    if(sendChar == 1) begin
                        if("0" <= charSent & charSent <= "9")
                            cost = cost + 1;
                        else if(32 <= charSent & charSent <= 126)
                            cost = cost + 2;
                        if(32 <= charSent & charSent <= 126) begin  
                            if(temp == 8'b00000000) begin
                                sentMsg[63:56] = charSent;
                                temp = 8'b10000000;
                            end
                            else if(temp == 8'b10000000) begin
                                sentMsg[55:48] = charSent;
                                temp = 8'b11000000;
                            end
                            else if(temp == 8'b11000000) begin
                                sentMsg[47:40] = charSent;
                                temp = 8'b11100000;
                            end
                            else if(temp == 8'b11100000) begin
                                sentMsg[39:32] = charSent;
                                temp = 8'b11110000;
                            end
                            else if(temp == 8'b11110000) begin
                                sentMsg[31:24] = charSent;
                                temp = 8'b11111000;
                            end
                            else if(temp == 8'b11111000) begin
                                sentMsg[23:16] = charSent;
                                temp = 8'b11111100;
                            end
                            else if(temp == 8'b11111100) begin
                                sentMsg[15:8] = charSent;
                                temp = 8'b11111110;
                            end
                            else if(temp == 8'b11111110) begin
                                sentMsg[7:0] = charSent;
                                temp = 8'b11111111;
                            end
                            else begin
                                sentMsg = sentMsg << 8;
                                sentMsg[7:0] = charSent;
                            end
                        end
                    end
                end
                COST: begin
                    if(cost[3:0] == 4'h0)
                        sentMsg[7:0] <= "0";
                    else if(cost[3:0] == 4'h1)
                        sentMsg[7:0] <= "1";
                    else if(cost[3:0] == 4'h2)
                        sentMsg[7:0] <= "2";
                    else if(cost[3:0] == 4'h3)
                        sentMsg[7:0] <= "3";
                    else if(cost[3:0] == 4'h4)
                        sentMsg[7:0] <= "4";
                    else if(cost[3:0] == 4'h5)
                        sentMsg[7:0] <= "5";  
                    else if(cost[3:0] == 4'h6)
                        sentMsg[7:0] <= "6";
                    else if(cost[3:0] == 4'h7)
                        sentMsg[7:0] <= "7";
                    else if(cost[3:0] == 4'h8)
                        sentMsg[7:0] <= "8";
                    else if(cost[3:0] == 4'h9)
                        sentMsg[7:0] <= "9";
                    else if(cost[3:0] == 4'hA)
                        sentMsg[7:0] <= "A";
                    else if(cost[3:0] == 4'hB)
                        sentMsg[7:0] <= "B";
                    else if(cost[3:0] == 4'hC)
                        sentMsg[7:0] <= "C";
                    else if(cost[3:0] == 4'hD)
                        sentMsg[7:0] <= "D";
                    else if(cost[3:0] == 4'hE)
                        sentMsg[7:0] <= "E";
                    else if(cost[3:0] == 4'hF)
                        sentMsg[7:0] <= "F";
                    
                    if(cost[7:4] == 4'h0)
                        sentMsg[15:8] <= "0";
                    else if(cost[7:4] == 4'h1)
                        sentMsg[15:8] <= "1";
                    else if(cost[7:4] == 4'h2)
                        sentMsg[15:8] <= "2";
                    else if(cost[7:4] == 4'h3)
                        sentMsg[15:8] <= "3";
                    else if(cost[7:4] == 4'h4)
                        sentMsg[15:8] <= "4";
                    else if(cost[7:4] == 4'h5)
                        sentMsg[15:8] <= "5";  
                    else if(cost[7:4] == 4'h6)
                        sentMsg[15:8] <= "6";
                    else if(cost[7:4] == 4'h7)
                        sentMsg[15:8] <= "7";
                    else if(cost[7:4] == 4'h8)
                        sentMsg[15:8] <= "8";
                    else if(cost[7:4] == 4'h9)
                        sentMsg[15:8] <= "9";
                    else if(cost[7:4] == 4'hA)
                        sentMsg[15:8] <= "A";
                    else if(cost[7:4] == 4'hB)
                        sentMsg[15:8] <= "B";
                    else if(cost[7:4] == 4'hC)
                        sentMsg[15:8] <= "C";
                    else if(cost[7:4] == 4'hD)
                        sentMsg[15:8] <= "D";
                    else if(cost[7:4] == 4'hE)
                        sentMsg[15:8] <= "E";
                    else if(cost[7:4] == 4'hF)
                        sentMsg[15:8] <= "F";
                    
                    if(cost[11:8] == 4'h0)
                        sentMsg[23:16] <= "0";
                    else if(cost[11:8] == 4'h1)
                        sentMsg[23:16] <= "1";
                    else if(cost[11:8] == 4'h2)
                        sentMsg[23:16] <= "2";
                    else if(cost[11:8] == 4'h3)
                        sentMsg[23:16] <= "3";
                    else if(cost[11:8] == 4'h4)
                        sentMsg[23:16] <= "4";
                    else if(cost[11:8] == 4'h5)
                        sentMsg[23:16] <= "5";  
                    else if(cost[11:8] == 4'h6)
                        sentMsg[23:16] <= "6";
                    else if(cost[11:8] == 4'h7)
                        sentMsg[23:16] <= "7";
                    else if(cost[11:8] == 4'h8)
                        sentMsg[23:16] <= "8";
                    else if(cost[11:8] == 4'h9)
                        sentMsg[23:16] <= "9";
                    else if(cost[11:8] == 4'hA)
                        sentMsg[23:16] <= "A";
                    else if(cost[11:8] == 4'hB)
                        sentMsg[23:16] <= "B";
                    else if(cost[11:8] == 4'hC)
                        sentMsg[23:16] <= "C";
                    else if(cost[11:8] == 4'hD)
                        sentMsg[23:16] <= "D";
                    else if(cost[11:8] == 4'hE)
                        sentMsg[23:16] <= "E";
                    else if(cost[11:8] == 4'hF)
                        sentMsg[23:16] <= "F";
                        
                    if(cost[15:12] == 4'h0)
                        sentMsg[31:24] <= "0";
                    else if(cost[15:12] == 4'h1)
                        sentMsg[31:24] <= "1";
                    else if(cost[15:12] == 4'h2)
                        sentMsg[31:24] <= "2";
                    else if(cost[15:12] == 4'h3)
                        sentMsg[31:24] <= "3";
                    else if(cost[15:12] == 4'h4)
                        sentMsg[31:24] <= "4";
                    else if(cost[15:12] == 4'h5)
                        sentMsg[31:24] <= "5";  
                    else if(cost[15:12] == 4'h6)
                        sentMsg[31:24] <= "6";
                    else if(cost[15:12] == 4'h7)
                        sentMsg[31:24] <= "7";
                    else if(cost[15:12] == 4'h8)
                        sentMsg[31:24] <= "8";
                    else if(cost[15:12] == 4'h9)
                        sentMsg[31:24] <= "9";
                    else if(cost[15:12] == 4'hA)
                        sentMsg[31:24] <= "A";
                    else if(cost[15:12] == 4'hB)
                        sentMsg[31:24] <= "B";
                    else if(cost[15:12] == 4'hC)
                        sentMsg[31:24] <= "C";
                    else if(cost[15:12] == 4'hD)
                        sentMsg[31:24] <= "D";
                    else if(cost[15:12] == 4'hE)
                        sentMsg[31:24] <= "E";
                    else if(cost[15:12] == 4'hF)
                        sentMsg[31:24] <= "F";
                        
                    if(cost[19:16] == 4'h0)
                        sentMsg[39:32] <= "0";
                    else if(cost[19:16] == 4'h1)
                        sentMsg[39:32] <= "1";
                    else if(cost[19:16] == 4'h2)
                        sentMsg[39:32] <= "2";
                    else if(cost[19:16] == 4'h3)
                        sentMsg[39:32] <= "3";
                    else if(cost[19:16] == 4'h4)
                        sentMsg[39:32] <= "4";
                    else if(cost[19:16] == 4'h5)
                        sentMsg[39:32] <= "5";  
                    else if(cost[19:16] == 4'h6)
                        sentMsg[39:32] <= "6";
                    else if(cost[19:16] == 4'h7)
                        sentMsg[39:32] <= "7";
                    else if(cost[19:16] == 4'h8)
                        sentMsg[39:32] <= "8";
                    else if(cost[19:16] == 4'h9)
                        sentMsg[39:32] <= "9";
                    else if(cost[19:16] == 4'hA)
                        sentMsg[39:32] <= "A";
                    else if(cost[19:16] == 4'hB)
                        sentMsg[39:32] <= "B";
                    else if(cost[19:16] == 4'hC)
                        sentMsg[39:32] <= "C";
                    else if(cost[19:16] == 4'hD)
                        sentMsg[39:32] <= "D";
                    else if(cost[19:16] == 4'hE)
                        sentMsg[39:32] <= "E";
                    else if(cost[19:16] == 4'hF)
                        sentMsg[39:32] <= "F";
                        
                    if(cost[23:20] == 4'h0)
                        sentMsg[47:40] <= "0";
                    else if(cost[23:20] == 4'h1)
                        sentMsg[47:40] <= "1";
                    else if(cost[23:20] == 4'h2)
                        sentMsg[47:40] <= "2";
                    else if(cost[23:20] == 4'h3)
                        sentMsg[47:40] <= "3";
                    else if(cost[23:20] == 4'h4)
                        sentMsg[47:40] <= "4";
                    else if(cost[23:20] == 4'h5)
                        sentMsg[47:40] <= "5";  
                    else if(cost[23:20] == 4'h6)
                        sentMsg[47:40] <= "6";
                    else if(cost[23:20] == 4'h7)
                        sentMsg[47:40] <= "7";
                    else if(cost[23:20] == 4'h8)
                        sentMsg[47:40] <= "8";
                    else if(cost[23:20] == 4'h9)
                        sentMsg[47:40] <= "9";
                    else if(cost[23:20] == 4'hA)
                        sentMsg[47:40] <= "A";
                    else if(cost[23:20] == 4'hB)
                        sentMsg[47:40] <= "B";
                    else if(cost[23:20] == 4'hC)
                        sentMsg[47:40] <= "C";
                    else if(cost[23:20] == 4'hD)
                        sentMsg[47:40] <= "D";
                    else if(cost[23:20] == 4'hE)
                        sentMsg[47:40] <= "E";
                    else if(cost[23:20] == 4'hF)
                        sentMsg[47:40] <= "F";
                        
                    if(cost[27:24] == 4'h0)
                        sentMsg[55:48] <= "0";
                    else if(cost[27:24] == 4'h1)
                        sentMsg[55:48] <= "1";
                    else if(cost[27:24] == 4'h2)
                        sentMsg[55:48] <= "2";
                    else if(cost[27:24] == 4'h3)
                        sentMsg[55:48] <= "3";
                    else if(cost[27:24] == 4'h4)
                        sentMsg[55:48] <= "4";
                    else if(cost[27:24] == 4'h5)
                        sentMsg[55:48] <= "5";  
                    else if(cost[27:24] == 4'h6)
                        sentMsg[55:48] <= "6";
                    else if(cost[27:24] == 4'h7)
                        sentMsg[55:48] <= "7";
                    else if(cost[27:24] == 4'h8)
                        sentMsg[55:48] <= "8";
                    else if(cost[27:24] == 4'h9)
                        sentMsg[55:48] <= "9";
                    else if(cost[27:24] == 4'hA)
                        sentMsg[55:48] <= "A";
                    else if(cost[27:24] == 4'hB)
                        sentMsg[55:48] <= "B";
                    else if(cost[27:24] == 4'hC)
                        sentMsg[55:48] <= "C";
                    else if(cost[27:24] == 4'hD)
                        sentMsg[55:48] <= "D";
                    else if(cost[27:24] == 4'hE)
                        sentMsg[55:48] <= "E";
                    else if(cost[27:24] == 4'hF)
                        sentMsg[55:48] <= "F";
                        
                    if(cost[31:28] == 4'h0)
                        sentMsg[63:56] <= "0";
                    else if(cost[31:28] == 4'h1)
                        sentMsg[63:56] <= "1";
                    else if(cost[31:28] == 4'h2)
                        sentMsg[63:56] <= "2";
                    else if(cost[31:28] == 4'h3)
                        sentMsg[63:56] <= "3";
                    else if(cost[31:28] == 4'h4)
                        sentMsg[63:56] <= "4";
                    else if(cost[31:28] == 4'h5)
                        sentMsg[63:56] <= "5";  
                    else if(cost[31:28] == 4'h6)
                        sentMsg[63:56] <= "6";
                    else if(cost[31:28] == 4'h7)
                        sentMsg[63:56] <= "7";
                    else if(cost[31:28] == 4'h8)
                        sentMsg[63:56] <= "8";
                    else if(cost[31:28] == 4'h9)
                        sentMsg[63:56] <= "9";
                    else if(cost[31:28] == 4'hA)
                        sentMsg[63:56] <= "A";
                    else if(cost[31:28] == 4'hB)
                        sentMsg[63:56] <= "B";
                    else if(cost[31:28] == 4'hC)
                        sentMsg[63:56] <= "C";
                    else if(cost[31:28] == 4'hD)
                        sentMsg[63:56] <= "D";
                    else if(cost[31:28] == 4'hE)
                        sentMsg[63:56] <= "E";
                    else if(cost[31:28] == 4'hF)
                        sentMsg[63:56] <= "F";
                end
            endcase
        end
    end
endmodule