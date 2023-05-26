// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Nov 29 02:04:07 2021
// Host        : CS303SW running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               C:/Users/ecekarasu/lab3_2/lab3_2.sim/sim_1/impl/timing/xsim/cla_sim_time_impl.v
// Design      : cla
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "5a37a0d" *) 
(* NotValidForBitStream *)
module cla
   (A0,
    A1,
    A2,
    A3,
    A4,
    A5,
    A6,
    A7,
    A8,
    A9,
    A10,
    A11,
    A12,
    A13,
    A14,
    A15,
    B0,
    B1,
    B2,
    B3,
    B4,
    B5,
    B6,
    B7,
    B8,
    B9,
    B10,
    B11,
    B12,
    B13,
    B14,
    B15,
    SUB,
    C0,
    C1,
    C2,
    C3,
    C4,
    C5,
    C6,
    C7,
    C8,
    C9,
    C10,
    C11,
    C12,
    C13,
    C14,
    C15,
    OVF);
  input A0;
  input A1;
  input A2;
  input A3;
  input A4;
  input A5;
  input A6;
  input A7;
  input A8;
  input A9;
  input A10;
  input A11;
  input A12;
  input A13;
  input A14;
  input A15;
  input B0;
  input B1;
  input B2;
  input B3;
  input B4;
  input B5;
  input B6;
  input B7;
  input B8;
  input B9;
  input B10;
  input B11;
  input B12;
  input B13;
  input B14;
  input B15;
  input SUB;
  output C0;
  output C1;
  output C2;
  output C3;
  output C4;
  output C5;
  output C6;
  output C7;
  output C8;
  output C9;
  output C10;
  output C11;
  output C12;
  output C13;
  output C14;
  output C15;
  output OVF;

  wire A0;
  wire A0_IBUF;
  wire A1;
  wire A10;
  wire A10_IBUF;
  wire A11;
  wire A11_IBUF;
  wire A12;
  wire A12_IBUF;
  wire A13;
  wire A13_IBUF;
  wire A14;
  wire A14_IBUF;
  wire A15;
  wire A15_IBUF;
  wire A1_IBUF;
  wire A2;
  wire A2_IBUF;
  wire A3;
  wire A3_IBUF;
  wire A4;
  wire A4_IBUF;
  wire A5;
  wire A5_IBUF;
  wire A6;
  wire A6_IBUF;
  wire A7;
  wire A7_IBUF;
  wire A8;
  wire A8_IBUF;
  wire A9;
  wire A9_IBUF;
  wire B0;
  wire B0_IBUF;
  wire B1;
  wire B10;
  wire B10_IBUF;
  wire B11;
  wire B11_IBUF;
  wire B12;
  wire B12_IBUF;
  wire B13;
  wire B13_IBUF;
  wire B14;
  wire B14_IBUF;
  wire B15;
  wire B15_IBUF;
  wire B1_IBUF;
  wire B2;
  wire B2_IBUF;
  wire B3;
  wire B3_IBUF;
  wire B4;
  wire B4_IBUF;
  wire B5;
  wire B5_IBUF;
  wire B6;
  wire B6_IBUF;
  wire B7;
  wire B7_IBUF;
  wire B8;
  wire B8_IBUF;
  wire B9;
  wire B9_IBUF;
  wire C0;
  wire C0_OBUF;
  wire C1;
  wire C10;
  wire C10_OBUF;
  wire C11;
  wire C11_OBUF;
  wire C11_OBUF_inst_i_2_n_0;
  wire C11_OBUF_inst_i_3_n_0;
  wire C12;
  wire C12_OBUF;
  wire C12_OBUF_inst_i_2_n_0;
  wire C13;
  wire C13_OBUF;
  wire C13_OBUF_inst_i_2_n_0;
  wire C13_OBUF_inst_i_3_n_0;
  wire C13_OBUF_inst_i_4_n_0;
  wire C13_OBUF_inst_i_5_n_0;
  wire C14;
  wire C14_OBUF;
  wire C15;
  wire C15_OBUF;
  wire C15_OBUF_inst_i_2_n_0;
  wire C15_OBUF_inst_i_3_n_0;
  wire C1_OBUF;
  wire C2;
  wire C2_OBUF;
  wire C2_OBUF_inst_i_2_n_0;
  wire C3;
  wire C3_OBUF;
  wire C3_OBUF_inst_i_2_n_0;
  wire C4;
  wire C4_OBUF;
  wire C5;
  wire C5_OBUF;
  wire C5_OBUF_inst_i_2_n_0;
  wire C6;
  wire C6_OBUF;
  wire C7;
  wire C7_OBUF;
  wire C7_OBUF_inst_i_2_n_0;
  wire C7_OBUF_inst_i_3_n_0;
  wire C8;
  wire C8_OBUF;
  wire C8_OBUF_inst_i_2_n_0;
  wire C8_OBUF_inst_i_3_n_0;
  wire C9;
  wire C9_OBUF;
  wire C9_OBUF_inst_i_10_n_0;
  wire C9_OBUF_inst_i_11_n_0;
  wire C9_OBUF_inst_i_12_n_0;
  wire C9_OBUF_inst_i_2_n_0;
  wire C9_OBUF_inst_i_3_n_0;
  wire C9_OBUF_inst_i_4_n_0;
  wire C9_OBUF_inst_i_5_n_0;
  wire C9_OBUF_inst_i_6_n_0;
  wire C9_OBUF_inst_i_7_n_0;
  wire C9_OBUF_inst_i_8_n_0;
  wire C9_OBUF_inst_i_9_n_0;
  wire OVF;
  wire OVF_OBUF;
  wire SUB;
  wire SUB_IBUF;

initial begin
 $sdf_annotate("cla_sim_time_impl.sdf",,,,"tool_control");
end
  IBUF A0_IBUF_inst
       (.I(A0),
        .O(A0_IBUF));
  IBUF A10_IBUF_inst
       (.I(A10),
        .O(A10_IBUF));
  IBUF A11_IBUF_inst
       (.I(A11),
        .O(A11_IBUF));
  IBUF A12_IBUF_inst
       (.I(A12),
        .O(A12_IBUF));
  IBUF A13_IBUF_inst
       (.I(A13),
        .O(A13_IBUF));
  IBUF A14_IBUF_inst
       (.I(A14),
        .O(A14_IBUF));
  IBUF A15_IBUF_inst
       (.I(A15),
        .O(A15_IBUF));
  IBUF A1_IBUF_inst
       (.I(A1),
        .O(A1_IBUF));
  IBUF A2_IBUF_inst
       (.I(A2),
        .O(A2_IBUF));
  IBUF A3_IBUF_inst
       (.I(A3),
        .O(A3_IBUF));
  IBUF A4_IBUF_inst
       (.I(A4),
        .O(A4_IBUF));
  IBUF A5_IBUF_inst
       (.I(A5),
        .O(A5_IBUF));
  IBUF A6_IBUF_inst
       (.I(A6),
        .O(A6_IBUF));
  IBUF A7_IBUF_inst
       (.I(A7),
        .O(A7_IBUF));
  IBUF A8_IBUF_inst
       (.I(A8),
        .O(A8_IBUF));
  IBUF A9_IBUF_inst
       (.I(A9),
        .O(A9_IBUF));
  IBUF B0_IBUF_inst
       (.I(B0),
        .O(B0_IBUF));
  IBUF B10_IBUF_inst
       (.I(B10),
        .O(B10_IBUF));
  IBUF B11_IBUF_inst
       (.I(B11),
        .O(B11_IBUF));
  IBUF B12_IBUF_inst
       (.I(B12),
        .O(B12_IBUF));
  IBUF B13_IBUF_inst
       (.I(B13),
        .O(B13_IBUF));
  IBUF B14_IBUF_inst
       (.I(B14),
        .O(B14_IBUF));
  IBUF B15_IBUF_inst
       (.I(B15),
        .O(B15_IBUF));
  IBUF B1_IBUF_inst
       (.I(B1),
        .O(B1_IBUF));
  IBUF B2_IBUF_inst
       (.I(B2),
        .O(B2_IBUF));
  IBUF B3_IBUF_inst
       (.I(B3),
        .O(B3_IBUF));
  IBUF B4_IBUF_inst
       (.I(B4),
        .O(B4_IBUF));
  IBUF B5_IBUF_inst
       (.I(B5),
        .O(B5_IBUF));
  IBUF B6_IBUF_inst
       (.I(B6),
        .O(B6_IBUF));
  IBUF B7_IBUF_inst
       (.I(B7),
        .O(B7_IBUF));
  IBUF B8_IBUF_inst
       (.I(B8),
        .O(B8_IBUF));
  IBUF B9_IBUF_inst
       (.I(B9),
        .O(B9_IBUF));
  OBUF C0_OBUF_inst
       (.I(C0_OBUF),
        .O(C0));
  LUT2 #(
    .INIT(4'h6)) 
    C0_OBUF_inst_i_1
       (.I0(B0_IBUF),
        .I1(A0_IBUF),
        .O(C0_OBUF));
  OBUF C10_OBUF_inst
       (.I(C10_OBUF),
        .O(C10));
  LUT6 #(
    .INIT(64'h6999669699966966)) 
    C10_OBUF_inst_i_1
       (.I0(A10_IBUF),
        .I1(B10_IBUF),
        .I2(C9_OBUF_inst_i_2_n_0),
        .I3(SUB_IBUF),
        .I4(B9_IBUF),
        .I5(A9_IBUF),
        .O(C10_OBUF));
  OBUF C11_OBUF_inst
       (.I(C11_OBUF),
        .O(C11));
  LUT6 #(
    .INIT(64'h9696699669696969)) 
    C11_OBUF_inst_i_1
       (.I0(SUB_IBUF),
        .I1(B11_IBUF),
        .I2(A11_IBUF),
        .I3(C9_OBUF_inst_i_2_n_0),
        .I4(C11_OBUF_inst_i_2_n_0),
        .I5(C11_OBUF_inst_i_3_n_0),
        .O(C11_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6FF9F96F)) 
    C11_OBUF_inst_i_2
       (.I0(A10_IBUF),
        .I1(B10_IBUF),
        .I2(SUB_IBUF),
        .I3(B9_IBUF),
        .I4(A9_IBUF),
        .O(C11_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hD0F707DF)) 
    C11_OBUF_inst_i_3
       (.I0(A9_IBUF),
        .I1(B9_IBUF),
        .I2(SUB_IBUF),
        .I3(A10_IBUF),
        .I4(B10_IBUF),
        .O(C11_OBUF_inst_i_3_n_0));
  OBUF C12_OBUF_inst
       (.I(C12_OBUF),
        .O(C12));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h9669)) 
    C12_OBUF_inst_i_1
       (.I0(C12_OBUF_inst_i_2_n_0),
        .I1(SUB_IBUF),
        .I2(B12_IBUF),
        .I3(A12_IBUF),
        .O(C12_OBUF));
  LUT6 #(
    .INIT(64'hB00BFBBF0000F00F)) 
    C12_OBUF_inst_i_2
       (.I0(C11_OBUF_inst_i_2_n_0),
        .I1(C9_OBUF_inst_i_2_n_0),
        .I2(SUB_IBUF),
        .I3(B11_IBUF),
        .I4(A11_IBUF),
        .I5(C11_OBUF_inst_i_3_n_0),
        .O(C12_OBUF_inst_i_2_n_0));
  OBUF C13_OBUF_inst
       (.I(C13_OBUF),
        .O(C13));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    C13_OBUF_inst_i_1
       (.I0(C13_OBUF_inst_i_2_n_0),
        .I1(SUB_IBUF),
        .I2(B13_IBUF),
        .I3(A13_IBUF),
        .O(C13_OBUF));
  LUT6 #(
    .INIT(64'hBEBEBEBE28BE2828)) 
    C13_OBUF_inst_i_2
       (.I0(A12_IBUF),
        .I1(B12_IBUF),
        .I2(SUB_IBUF),
        .I3(C13_OBUF_inst_i_3_n_0),
        .I4(C9_OBUF_inst_i_2_n_0),
        .I5(C13_OBUF_inst_i_4_n_0),
        .O(C13_OBUF_inst_i_2_n_0));
  LUT6 #(
    .INIT(64'h6FFFFF9FFF9F6FFF)) 
    C13_OBUF_inst_i_3
       (.I0(B11_IBUF),
        .I1(A11_IBUF),
        .I2(C13_OBUF_inst_i_5_n_0),
        .I3(SUB_IBUF),
        .I4(B10_IBUF),
        .I5(A10_IBUF),
        .O(C13_OBUF_inst_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h4DD4)) 
    C13_OBUF_inst_i_4
       (.I0(C11_OBUF_inst_i_3_n_0),
        .I1(A11_IBUF),
        .I2(B11_IBUF),
        .I3(SUB_IBUF),
        .O(C13_OBUF_inst_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h96)) 
    C13_OBUF_inst_i_5
       (.I0(A9_IBUF),
        .I1(B9_IBUF),
        .I2(SUB_IBUF),
        .O(C13_OBUF_inst_i_5_n_0));
  OBUF C14_OBUF_inst
       (.I(C14_OBUF),
        .O(C14));
  LUT6 #(
    .INIT(64'h6999669699966966)) 
    C14_OBUF_inst_i_1
       (.I0(A14_IBUF),
        .I1(B14_IBUF),
        .I2(C13_OBUF_inst_i_2_n_0),
        .I3(SUB_IBUF),
        .I4(B13_IBUF),
        .I5(A13_IBUF),
        .O(C14_OBUF));
  OBUF C15_OBUF_inst
       (.I(C15_OBUF),
        .O(C15));
  LUT6 #(
    .INIT(64'h9696699669696969)) 
    C15_OBUF_inst_i_1
       (.I0(SUB_IBUF),
        .I1(B15_IBUF),
        .I2(A15_IBUF),
        .I3(C13_OBUF_inst_i_2_n_0),
        .I4(C15_OBUF_inst_i_2_n_0),
        .I5(C15_OBUF_inst_i_3_n_0),
        .O(C15_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6FF9F96F)) 
    C15_OBUF_inst_i_2
       (.I0(A14_IBUF),
        .I1(B14_IBUF),
        .I2(SUB_IBUF),
        .I3(B13_IBUF),
        .I4(A13_IBUF),
        .O(C15_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hD0F707DF)) 
    C15_OBUF_inst_i_3
       (.I0(A13_IBUF),
        .I1(B13_IBUF),
        .I2(SUB_IBUF),
        .I3(A14_IBUF),
        .I4(B14_IBUF),
        .O(C15_OBUF_inst_i_3_n_0));
  OBUF C1_OBUF_inst
       (.I(C1_OBUF),
        .O(C1));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h69669666)) 
    C1_OBUF_inst_i_1
       (.I0(B1_IBUF),
        .I1(A1_IBUF),
        .I2(SUB_IBUF),
        .I3(B0_IBUF),
        .I4(A0_IBUF),
        .O(C1_OBUF));
  OBUF C2_OBUF_inst
       (.I(C2_OBUF),
        .O(C2));
  LUT6 #(
    .INIT(64'h9696996666999696)) 
    C2_OBUF_inst_i_1
       (.I0(B2_IBUF),
        .I1(A2_IBUF),
        .I2(B1_IBUF),
        .I3(SUB_IBUF),
        .I4(A1_IBUF),
        .I5(C2_OBUF_inst_i_2_n_0),
        .O(C2_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h47)) 
    C2_OBUF_inst_i_2
       (.I0(A0_IBUF),
        .I1(B0_IBUF),
        .I2(SUB_IBUF),
        .O(C2_OBUF_inst_i_2_n_0));
  OBUF C3_OBUF_inst
       (.I(C3_OBUF),
        .O(C3));
  LUT4 #(
    .INIT(16'h9669)) 
    C3_OBUF_inst_i_1
       (.I0(SUB_IBUF),
        .I1(B3_IBUF),
        .I2(A3_IBUF),
        .I3(C3_OBUF_inst_i_2_n_0),
        .O(C3_OBUF));
  LUT6 #(
    .INIT(64'h8ECF032B0C8E2B3F)) 
    C3_OBUF_inst_i_2
       (.I0(C2_OBUF_inst_i_2_n_0),
        .I1(B2_IBUF),
        .I2(A2_IBUF),
        .I3(A1_IBUF),
        .I4(SUB_IBUF),
        .I5(B1_IBUF),
        .O(C3_OBUF_inst_i_2_n_0));
  OBUF C4_OBUF_inst
       (.I(C4_OBUF),
        .O(C4));
  LUT6 #(
    .INIT(64'h8ED4712B712B8ED4)) 
    C4_OBUF_inst_i_1
       (.I0(C3_OBUF_inst_i_2_n_0),
        .I1(B3_IBUF),
        .I2(A3_IBUF),
        .I3(SUB_IBUF),
        .I4(B4_IBUF),
        .I5(A4_IBUF),
        .O(C4_OBUF));
  OBUF C5_OBUF_inst
       (.I(C5_OBUF),
        .O(C5));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    C5_OBUF_inst_i_1
       (.I0(C5_OBUF_inst_i_2_n_0),
        .I1(SUB_IBUF),
        .I2(B5_IBUF),
        .I3(A5_IBUF),
        .O(C5_OBUF));
  LUT6 #(
    .INIT(64'h2E28B828BE2EBEB8)) 
    C5_OBUF_inst_i_2
       (.I0(A4_IBUF),
        .I1(B4_IBUF),
        .I2(SUB_IBUF),
        .I3(A3_IBUF),
        .I4(B3_IBUF),
        .I5(C3_OBUF_inst_i_2_n_0),
        .O(C5_OBUF_inst_i_2_n_0));
  OBUF C6_OBUF_inst
       (.I(C6_OBUF),
        .O(C6));
  LUT6 #(
    .INIT(64'h6999669699966966)) 
    C6_OBUF_inst_i_1
       (.I0(A6_IBUF),
        .I1(B6_IBUF),
        .I2(C5_OBUF_inst_i_2_n_0),
        .I3(SUB_IBUF),
        .I4(B5_IBUF),
        .I5(A5_IBUF),
        .O(C6_OBUF));
  OBUF C7_OBUF_inst
       (.I(C7_OBUF),
        .O(C7));
  LUT6 #(
    .INIT(64'h9696699669696969)) 
    C7_OBUF_inst_i_1
       (.I0(SUB_IBUF),
        .I1(B7_IBUF),
        .I2(A7_IBUF),
        .I3(C5_OBUF_inst_i_2_n_0),
        .I4(C7_OBUF_inst_i_2_n_0),
        .I5(C7_OBUF_inst_i_3_n_0),
        .O(C7_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h6FF9F96F)) 
    C7_OBUF_inst_i_2
       (.I0(A6_IBUF),
        .I1(B6_IBUF),
        .I2(SUB_IBUF),
        .I3(B5_IBUF),
        .I4(A5_IBUF),
        .O(C7_OBUF_inst_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hD0F707DF)) 
    C7_OBUF_inst_i_3
       (.I0(A5_IBUF),
        .I1(B5_IBUF),
        .I2(SUB_IBUF),
        .I3(A6_IBUF),
        .I4(B6_IBUF),
        .O(C7_OBUF_inst_i_3_n_0));
  OBUF C8_OBUF_inst
       (.I(C8_OBUF),
        .O(C8));
  LUT6 #(
    .INIT(64'h2B2B032BD4D4FCD4)) 
    C8_OBUF_inst_i_1
       (.I0(C7_OBUF_inst_i_3_n_0),
        .I1(A7_IBUF),
        .I2(C8_OBUF_inst_i_2_n_0),
        .I3(C5_OBUF_inst_i_2_n_0),
        .I4(C7_OBUF_inst_i_2_n_0),
        .I5(C8_OBUF_inst_i_3_n_0),
        .O(C8_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    C8_OBUF_inst_i_2
       (.I0(SUB_IBUF),
        .I1(B7_IBUF),
        .O(C8_OBUF_inst_i_2_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    C8_OBUF_inst_i_3
       (.I0(A8_IBUF),
        .I1(B8_IBUF),
        .I2(SUB_IBUF),
        .O(C8_OBUF_inst_i_3_n_0));
  OBUF C9_OBUF_inst
       (.I(C9_OBUF),
        .O(C9));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    C9_OBUF_inst_i_1
       (.I0(C9_OBUF_inst_i_2_n_0),
        .I1(SUB_IBUF),
        .I2(B9_IBUF),
        .I3(A9_IBUF),
        .O(C9_OBUF));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h6FF9F96F)) 
    C9_OBUF_inst_i_10
       (.I0(B2_IBUF),
        .I1(A2_IBUF),
        .I2(SUB_IBUF),
        .I3(B1_IBUF),
        .I4(A1_IBUF),
        .O(C9_OBUF_inst_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    C9_OBUF_inst_i_11
       (.I0(SUB_IBUF),
        .I1(B3_IBUF),
        .O(C9_OBUF_inst_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h96)) 
    C9_OBUF_inst_i_12
       (.I0(A4_IBUF),
        .I1(B4_IBUF),
        .I2(SUB_IBUF),
        .O(C9_OBUF_inst_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFF15FF150000)) 
    C9_OBUF_inst_i_2
       (.I0(C9_OBUF_inst_i_3_n_0),
        .I1(C9_OBUF_inst_i_4_n_0),
        .I2(C9_OBUF_inst_i_5_n_0),
        .I3(C9_OBUF_inst_i_6_n_0),
        .I4(C9_OBUF_inst_i_7_n_0),
        .I5(A8_IBUF),
        .O(C9_OBUF_inst_i_2_n_0));
  LUT6 #(
    .INIT(64'h6FFFFF9FFF9F6FFF)) 
    C9_OBUF_inst_i_3
       (.I0(B7_IBUF),
        .I1(A7_IBUF),
        .I2(C9_OBUF_inst_i_8_n_0),
        .I3(SUB_IBUF),
        .I4(B6_IBUF),
        .I5(A6_IBUF),
        .O(C9_OBUF_inst_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    C9_OBUF_inst_i_4
       (.I0(A4_IBUF),
        .I1(B4_IBUF),
        .I2(SUB_IBUF),
        .O(C9_OBUF_inst_i_4_n_0));
  LUT6 #(
    .INIT(64'h005454FFFFFFFFFF)) 
    C9_OBUF_inst_i_5
       (.I0(C9_OBUF_inst_i_9_n_0),
        .I1(C9_OBUF_inst_i_10_n_0),
        .I2(C2_OBUF_inst_i_2_n_0),
        .I3(C9_OBUF_inst_i_11_n_0),
        .I4(A3_IBUF),
        .I5(C9_OBUF_inst_i_12_n_0),
        .O(C9_OBUF_inst_i_5_n_0));
  LUT4 #(
    .INIT(16'h4DD4)) 
    C9_OBUF_inst_i_6
       (.I0(C7_OBUF_inst_i_3_n_0),
        .I1(A7_IBUF),
        .I2(B7_IBUF),
        .I3(SUB_IBUF),
        .O(C9_OBUF_inst_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h6)) 
    C9_OBUF_inst_i_7
       (.I0(SUB_IBUF),
        .I1(B8_IBUF),
        .O(C9_OBUF_inst_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h96)) 
    C9_OBUF_inst_i_8
       (.I0(A5_IBUF),
        .I1(B5_IBUF),
        .I2(SUB_IBUF),
        .O(C9_OBUF_inst_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h7320EC40)) 
    C9_OBUF_inst_i_9
       (.I0(B1_IBUF),
        .I1(SUB_IBUF),
        .I2(A1_IBUF),
        .I3(A2_IBUF),
        .I4(B2_IBUF),
        .O(C9_OBUF_inst_i_9_n_0));
  OBUF OVF_OBUF_inst
       (.I(OVF_OBUF),
        .O(OVF));
  LUT6 #(
    .INIT(64'hB2D4B2D430FCB2D4)) 
    OVF_OBUF_inst_i_1
       (.I0(C15_OBUF_inst_i_3_n_0),
        .I1(A15_IBUF),
        .I2(B15_IBUF),
        .I3(SUB_IBUF),
        .I4(C13_OBUF_inst_i_2_n_0),
        .I5(C15_OBUF_inst_i_2_n_0),
        .O(OVF_OBUF));
  IBUF SUB_IBUF_inst
       (.I(SUB),
        .O(SUB_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
