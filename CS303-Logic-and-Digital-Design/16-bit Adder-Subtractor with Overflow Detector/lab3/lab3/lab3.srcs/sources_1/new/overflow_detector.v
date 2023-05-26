`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2021 11:12:36 PM
// Design Name: 
// Module Name: overflow_detector
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

module full_adder(input A,
                  input B,
                  input Cin,
                  output reg Carry,
                  output reg Sum
    );
       
    reg w1, w2, w3;
    
    always @ (*)
    begin
            w1 = A & B;
            w2 = A & Cin;
            w3 = B & Cin;
            Carry = w1 | w2 | w3; 
            Sum = A ^ B ^ Cin;
    end
   
endmodule

module overflow_detector(input A0,
                         input A1,
                         input A2,
                         input A3,
                         input A4,
                         input A5,
                         input A6,
                         input A7,
                         input A8,
                         input A9,
                         input A10,
                         input A11,
                         input A12,
                         input A13,
                         input A14,
                         input A15,
                         input B0,
                         input B1,
                         input B2,
                         input B3,
                         input B4,
                         input B5,
                         input B6,
                         input B7,
                         input B8,
                         input B9,
                         input B10,
                         input B11,
                         input B12,
                         input B13,
                         input B14,
                         input B15,
                         input SUB,
                         output C0,
                         output C1,
                         output C2,
                         output C3,
                         output C4,
                         output C5,
                         output C6,
                         output C7,
                         output C8,
                         output C9,
                         output C10,
                         output C11,
                         output C12,
                         output C13,                   
                         output C14,
                         output C15,
                         output OVF          
    );
    
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31; 
      
    assign w0 = B0 ^ SUB;
    assign w1 = B1 ^ SUB;
    assign w2 = B2 ^ SUB;
    assign w3 = B3 ^ SUB;
    assign w4 = B4 ^ SUB;
    assign w5 = B5 ^ SUB;
    assign w6 = B6 ^ SUB;
    assign w7 = B7 ^ SUB;
    assign w8 = B8 ^ SUB;
    assign w9 = B9 ^ SUB;
    assign w10 = B10 ^ SUB;
    assign w11 = B11 ^ SUB;
    assign w12 = B12 ^ SUB;
    assign w13 = B13 ^ SUB;
    assign w14 = B14 ^ SUB;
    assign w15 = B15 ^ SUB;
    
    full_adder FA0(.A(A0),
                   .B(w0),
                   .Cin(SUB),
                   .Carry(w16),
                   .Sum(C0)
    );
    full_adder FA1(.A(A1),
                   .B(w1),
                   .Cin(w16),
                   .Carry(w17),
                   .Sum(C1) 
    );
    full_adder FA2(.A(A2),
                   .B(w2),
                   .Cin(w17),
                   .Carry(w18),
                   .Sum(C2)
    );
    full_adder FA3(.A(A3),
                   .B(w3),
                   .Cin(w18),
                   .Carry(w19),
                   .Sum(C3) 
    );
    full_adder FA4(.A(A4),
                   .B(w4),
                   .Cin(w19),
                   .Carry(w20),
                   .Sum(C4)
    );
    full_adder FA5(.A(A5),
                   .B(w5),
                   .Cin(w20),
                   .Carry(w21),
                   .Sum(C5) 
    );
    full_adder FA6(.A(A6),
                   .B(w6),
                   .Cin(w21),
                   .Carry(w22),
                   .Sum(C6)
    );
    full_adder FA7(.A(A7),
                   .B(w7),
                   .Cin(w22),
                   .Carry(w23),
                   .Sum(C7) 
    );
    full_adder FA8(.A(A8),
                   .B(w8),
                   .Cin(w23),
                   .Carry(w24),
                   .Sum(C8)
    );
    full_adder FA9(.A(A9),
                   .B(w9),
                   .Cin(w24),
                   .Carry(w25),
                   .Sum(C9) 
    );
    full_adder FA10(.A(A10),
                    .B(w10),
                    .Cin(w25),
                    .Carry(w26),
                    .Sum(C10)
    );
    full_adder FA11(.A(A11),
                    .B(w11),
                    .Cin(w26),
                    .Carry(w27),
                    .Sum(C11) 
    );
    full_adder FA12(.A(A12),
                    .B(w12),
                    .Cin(w27),
                    .Carry(w28),
                    .Sum(C12)
    );
    full_adder FA13(.A(A13),
                    .B(w13),
                    .Cin(w28),
                    .Carry(w29),
                    .Sum(C13) 
    );
    full_adder FA14(.A(A14),
                    .B(w14),
                    .Cin(w29),
                    .Carry(w30),
                    .Sum(C14)
    );
    full_adder FA15(.A(A15),
                    .B(w15),
                    .Cin(w30),
                    .Carry(w31),
                    .Sum(C15)                    
    );
    assign OVF = w31 ^ w30;
    
endmodule
