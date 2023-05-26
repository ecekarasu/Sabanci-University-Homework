`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2021 02:01:24 AM
// Design Name: 
// Module Name: detector_sim
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


module detector_sim(

    );
    
    //Inputs
    reg A0;
    reg A1;
    reg A2;
    reg A3;
    reg A4;
    reg A5;
    reg A6;
    reg A7;
    reg A8;
    reg A9;
    reg A10;
    reg A11;
    reg A12;
    reg A13;
    reg A14;
    reg A15;
    reg B0;
    reg B1;
    reg B2;
    reg B3;
    reg B4;
    reg B5;
    reg B6;
    reg B7;
    reg B8;
    reg B9;
    reg B10;
    reg B11;
    reg B12;
    reg B13;
    reg B14;
    reg B15;
    reg SUB;
    
    //Outputs
    wire C0;
    wire C1;
    wire C2;
    wire C3;
    wire C4;
    wire C5;
    wire C6;
    wire C7;
    wire C8;
    wire C9;
    wire C10;
    wire C11;
    wire C12;
    wire C13;                   
    wire C14;
    wire C15;
    wire OVF;
    
    //Instantiate the UUT
    overflow_detector UUT(
    .A0(A0),
    .A2(A2),
    .A1(A1),
    .A3(A3),
    .A4(A4),
    .A5(A5),
    .A6(A6),
    .A7(A7),
    .A8(A8),
    .A9(A9),
    .A10(A10),
    .A11(A11),
    .A12(A12),
    .A13(A13),
    .A14(A14),
    .A15(A15),
    .B0(B0),
    .B1(B1),
    .B2(B2),
    .B3(B3),
    .B4(B4),
    .B5(B5),
    .B6(B6),
    .B7(B7),
    .B8(B8),
    .B9(B9),
    .B10(B10),
    .B11(B11),
    .B12(B12),
    .B13(B13),
    .B14(B14),
    .B15(B15),
    .SUB(SUB),
    .C0(C0),
    .C1(C1),
    .C2(C2),
    .C3(C3),
    .C4(C4),
    .C5(C5),
    .C6(C6),
    .C7(C7),
    .C8(C8),
    .C9(C9),
    .C10(C10),
    .C11(C11),
    .C12(C12),
    .C13(C13),
    .C14(C14),
    .C15(C15),
    .OVF(OVF)
    );
    
    //Initialize Inputs
//    initial begin
//        A0 = 0;
//        A1 = 0;
//        A2 = 0;
//        A3 = 0;
//        A4 = 1;
//        A5 = 0;
//        A6 = 0;
//        A7 = 0;
//        A8 = 1;
//        A9 = 1;
//        A10 = 0;
//        A11 = 0;
//        A12 = 0;
//        A13 = 0;
//        A14 = 0;
//        A15 = 0;
//        B0 = 1;
//        B1 = 0;
//        B2 = 1;
//        B3 = 0;
//        B4 = 1;
//        B5 = 1;
//        B6 = 0;
//        B7 = 0;
//        B8 = 0;
//        B9 = 0;
//        B10 = 0;
//        B11 = 0;
//        B12 = 0;
//        B13 = 0;
//        B14 = 0;
//        B15 = 0;
//        SUB = 0;
//        #10;
//        A2 = 1;
//        A3 = 1;
//        A5 = 1;
//        A6 = 1;
//        A7 = 1;
//        A10 = 1;
//        A11 = 1;
//        A12 = 1;
//        A13 = 1;
//        A14 = 1;
//        A15 = 1;
//        B0 = 0;
//        B1 = 1;
//        B2 = 0;
//        B3 = 1;
//        B7 = 1;
//        B8 = 1;
//        B9 = 1;
//        B10 = 1;
//        B11 = 1;
//        B12 = 1;
//        B13 = 1;
//        B14 = 1;
//        B15 = 1;
//        SUB = 1;
//        #10;
//        A2 = 0;
//        A3 = 0;
//        A8 = 0;
//        A9 = 0;
//        A10 = 0;
//        A11 = 0;
//        A12 = 0;
//        A13 = 0;
//        A14 = 0;
//        A15 = 0;
//        B3 = 0;
//        B5 = 0;
//        B6 = 1;
//        B8 = 0;
//        B10 = 0;
//        B11 = 0;
//        B12 = 0;
//        B13 = 0;
//        B14 = 0;
//        B15 = 0;
//        SUB = 0;
//        #10;
//        A1 = 1;
//        A2 = 1;
//        A3 = 1;
//        A7 = 0;
//        A8 = 1;
//        A9 = 1;
//        B3 = 1;
//        B7 = 0;
//        SUB = 1;
//        #10;
//    end
// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------

// Input & Output Definitions
// Operation A (- or +) B
// A,B: operation inputs
// SUB: Add/Sub control signal
// C: output
// OVF: overflow

// -----------------------------------------------------------
// Modify definitions below according to your pin names!
`define A  {A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0}
`define B  {B15,B14,B13,B12,B11,B10,B9,B8,B7,B6,B5,B4,B3,B2,B1,B0}
`define T  {SUB}
`define C  {C15,C14,C13,C12,C11,C10,C9,C8,C7,C6,C5,C4,C3,C2,C1,C0}
`define V  {OVF}
// -----------------------------------------------------------

// Test cases
reg [15:0] A_array [15:0];
reg [15:0] B_array [15:0];
reg [15:0] C_array [15:0];
reg [0:0]  V_array [15:0];

initial begin
    // Addition with No Overflow
    A_array[ 0]=   (1468); B_array[ 0]=   (2053); C_array[ 0]=   (3521); V_array[ 0]= 0; // (+) + (+) - No overflow
    A_array[ 1]=  (10744); B_array[ 1]=  (-8009); C_array[ 1]=   (2735); V_array[ 1]= 0; // (+) + (-) - No overflow (Sum: (+))
    A_array[ 2]=   (3563); B_array[ 2]=  (-6730); C_array[ 2]=  (-3167); V_array[ 2]= 0; // (+) + (-) - No overflow (Sum: (-))
    A_array[ 3]=  (-3208); B_array[ 3]=   (4745); C_array[ 3]=   (1537); V_array[ 3]= 0; // (-) + (+) - No overflow (Sum: (+))
    A_array[ 4]=  (-7581); B_array[ 4]=   (1802); C_array[ 4]=  (-5779); V_array[ 4]= 0; // (-) + (+) - No overflow (Sum: (-))
    A_array[ 5]=  (-1304); B_array[ 5]= (-12603); C_array[ 5]= (-13907); V_array[ 5]= 0; // (-) + (-) - No overflow
    // Addition with Overflow
    A_array[ 6]=   (32760); B_array[ 6]=   (32360); C_array[ 6]= (-416); V_array[ 6]= 1; // (+) + (+) - overflow
    A_array[ 7]=  (-7444); B_array[ 7]= (-25995); C_array[ 7]=  (32097); V_array[ 7]= 1; // (-) + (-) - overflow
    // Subtraction with No Overflow
    A_array[ 8]=  (10287); B_array[ 8]=   (4787); C_array[ 8]=   (5500); V_array[ 8]= 0; // (+) - (+) - No overflow (Sum: (+))
    A_array[ 9]=   (6650); B_array[ 9]=  (15398); C_array[ 9]=  (-8748); V_array[ 9]= 0; // (+) - (+) - No overflow (Sum: (-))
    A_array[10]=   (3214); B_array[10]=  (-3428); C_array[10]=   (6642); V_array[10]= 0; // (+) - (-) - No overflow
    A_array[11]= (-10657); B_array[11]=   (3396); C_array[11]= (-14053); V_array[11]= 0; // (-) - (+) - No overflow
    A_array[12]=  (-9893); B_array[12]= (-13495); C_array[12]=   (3602); V_array[12]= 0; // (-) - (-) - No overflow (Sum: (+))
    A_array[13]= (-16087); B_array[13]=  (-7443); C_array[13]=  (-8644); V_array[13]= 0; // (-) - (-) - No overflow (Sum: (-))
    // Subtraction with Overflow
    A_array[14]=  (26691); B_array[14]= (-28530); C_array[14]=  (-10315); V_array[14]= 1; // (+) - (-) - overflow
    A_array[15]=  (-16336); B_array[15]=  (30470); C_array[15]=  (18730); V_array[15]= 1; // (-) - (+) - overflow
    #0;
end

// Test signals
integer A_test;
integer B_test;

integer _MAX_VAL = 32'b00000000000000000111111111111111;
integer _MIN_VAL = 32'b11111111111111111000000000000000;

// Test & grade
integer k;
integer GRADE;

parameter ADD_SUM_RIGHT= 4;
parameter ADD_OVF_RIGHT= 2;
parameter SUB_SUM_RIGHT= 3;
parameter SUB_OVF_RIGHT= 2;
parameter TOTAL_GRADE  = 8*(ADD_SUM_RIGHT+ADD_OVF_RIGHT) + 8*(SUB_SUM_RIGHT+SUB_OVF_RIGHT);

initial begin
	// reset all signal
	`A = 16'd0;
	`B = 16'd0;
    `T = 1'b0;
    GRADE = 0;
    A_test = 0;	B_test = 0;
	k = 0;

    #100;
    // initialize
    `A = 16'd0;
    `B = 16'd0;
    `T = 1'b0;
    GRADE = 0;
    #10;

    // addition
    for(k=0; k<8; k=k+1) begin
        // give input
        `A = A_array[k];
        `B = B_array[k];
        `T = 1'b0;
        #1;

        // check result
        A_test = {{17{A_array[k][14]}},A_array[k]};
        B_test = {{17{B_array[k][14]}},B_array[k]};
        #1;

        $display("Addition -- Testcase:%d",k);

        if(C_array[k] === `C) begin
            $display("Addition result is correct! %d == %d",C_array[k],`C);
            GRADE = GRADE + ADD_SUM_RIGHT; #1;
        end
        else begin
            $display("Addition result is wrong! %d != %d",C_array[k],`C);
			#1;
        end

        if(((C_array[k] > _MAX_VAL) | (C_array[k] < _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + ADD_OVF_RIGHT; #1;
        end
        else if(((C_array[k] <= _MAX_VAL) | (C_array[k] >= _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + ADD_OVF_RIGHT; #1;
        end
        else begin
            $display("Overflow result is wrong! %d != %d\n",V_array[k],`V);
			#1;
        end
        #6;
    end
    #10;

    // subtraction
    for(k=8; k<16; k=k+1) begin
        `A = A_array[k];
        `B = B_array[k];
        `T = 1'b1;
        #1;

        // check result
        A_test = {{17{A_array[k][14]}},A_array[k]};
        B_test = {{17{B_array[k][14]}},B_array[k]};
        #1;

        $display("Subtraction -- Testcase:%d",k);

        if(C_array[k] === `C) begin
            $display("Subtraction result is correct! %d == %d",C_array[k],`C);
            GRADE = GRADE + SUB_SUM_RIGHT; #1;
        end
        else begin
            $display("Subtraction result is wrong! %d != %d",C_array[k],`C);
			#1;
        end

        if(((C_array[k] > _MAX_VAL) | (C_array[k] < _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + SUB_OVF_RIGHT; #1;
        end
        else if(((C_array[k] <= _MAX_VAL) | (C_array[k] >= _MIN_VAL)) & (`V === V_array[k])) begin
            $display("Overflow result is correct! %d == %d\n",V_array[k],`V);
            GRADE = GRADE + SUB_OVF_RIGHT; #1;
        end
        else begin
            $display("Overflow result is wrong! %d != %d\n",V_array[k],`V);
			#1;
        end
        #6;
    end

    $display("Your simulation grade is %d out of %d!\n",(GRADE>>1),(TOTAL_GRADE>>1));
	#1;
    $finish;
end

// ------------------------------------------------------------------------------------------------------------------
// ------------------------------------------------------------------------------------------------------------------

endmodule
