`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 09:58:11 PM
// Design Name: 
// Module Name: cla
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

module generate_p_and_g(input A0,
                        input A1,
                        input A2,
                        input A3,
                        input B0,
                        input B1,
                        input B2,
                        input B3,
                        output P0,
                        output P1,
                        output P2,
                        output P3,
                        output G0,
                        output G1,
                        output G2,
                        output G3
    );
    
    assign P0 = (A0 ^ B0);
    assign P1 = (A1 ^ B1);
    assign P2 = (A2 ^ B2);
    assign P3 = (A3 ^ B3);
    assign G0 = (A0 & B0);
    assign G1 = (A1 & B1);
    assign G2 = (A2 & B2);
    assign G3 = (A3 & B3);
    
endmodule

module clc4(input P0,
            input P1,
            input P2,
            input P3,
            input G0,
            input G1,
            input G2,
            input G3,
            input C0,
            output C1,
            output C2,
            output C3,
            output C4
    );
    
    assign C1 = G0 | (P0 & C0);    
    assign C2 = G1 | (P1 & G0) | (P1 & P0 & C0);
    assign C3 = G2 | (P2 & G1) | (P2 & P1 & G0) | (P2 & P1 & P0 & C0);
    assign C4 = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0) | (P3 & P2 & P1 & P0 & C0);
        
endmodule

module cla4(input A0,
            input A1,
            input A2,
            input A3,
            input B0,
            input B1,
            input B2,
            input B3,
            input C0,
            output S0,
            output S1,
            output S2,
            output S3,
            output C3,
            output C4
    );
    wire w_P0, w_P1, w_P2, w_P3, w_G0, w_G1, w_G2, w_G3;
    generate_p_and_g p_and_g(.A0(A0),
                             .A1(A1),
                             .A2(A2),
                             .A3(A3),
                             .B0(B0),
                             .B1(B1),
                             .B2(B2),
                             .B3(B3),
                             .P0(w_P0),
                             .P1(w_P1),
                             .P2(w_P2),
                             .P3(w_P3),
                             .G0(w_G0),
                             .G1(w_G1),
                             .G2(w_G2),
                             .G3(w_G3)
    );
    wire w_C1, w_C2, w_C3;
    clc4 clc_0(.P0(w_P0),
               .P1(w_P1),
               .P2(w_P2),
               .P3(w_P3),
               .G0(w_G0),
               .G1(w_G1),
               .G2(w_G2),
               .G3(w_G3),
               .C0(C0),
               .C1(w_C1),
               .C2(w_C2),
               .C3(w_C3),
               .C4(C4)
    );
    
    assign S0 = w_P0 ^ C0;
    assign S1 = w_P1 ^ w_C1; 
    assign S2 = w_P2 ^ w_C2;
    assign S3 = w_P3 ^ w_C3; 
    assign C3 = w_C3;
                    
endmodule

module cla(input A0,
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
    
    wire w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
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
    
    wire wire_C4, wire_C8, wire_C12, wire_C16, dummy_1, dummy_2, dummy_3, dummy_4;
    cla4 cla_0(.A0(A0),
               .A1(A1),
               .A2(A2),
               .A3(A3),
               .B0(w0),
               .B1(w1),
               .B2(w2),
               .B3(w3),
               .C0(SUB),
               .S0(C0),
               .S1(C1),
               .S2(C2),
               .S3(C3),
               .C3(dummy_1),
               .C4(wire_C4)
     );
     cla4 cla_1(.A0(A4),
                .A1(A5),
                .A2(A6),
                .A3(A7),
                .B0(w4),
                .B1(w5),
                .B2(w6),
                .B3(w7),
                .C0(wire_C4),
                .S0(C4),
                .S1(C5),
                .S2(C6),
                .S3(C7),
                .C3(dummy_2),
                .C4(wire_C8)
      );
      cla4 cla_2(.A0(A8),
                 .A1(A9),
                 .A2(A10),
                 .A3(A11),
                 .B0(w8),
                 .B1(w9),
                 .B2(w10),
                 .B3(w11),
                 .C0(wire_C8),
                 .S0(C8),
                 .S1(C9),
                 .S2(C10),
                 .S3(C11),
                 .C3(dummy_3),
                 .C4(wire_C12)
       );
       cla4 cla_3(.A0(A12),
                  .A1(A13),
                  .A2(A14),
                  .A3(A15),
                  .B0(w12),
                  .B1(w13),
                  .B2(w14),
                  .B3(w15),
                  .C0(wire_C12),
                  .S0(C12),
                  .S1(C13),
                  .S2(C14),
                  .S3(C15),
                  .C3(dummy_4),
                  .C4(wire_C16)
        );
        assign OVF = wire_C16 ^ dummy_4;
endmodule
