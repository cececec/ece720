module counter (
	clock, 
	in, 
	latch, 
	dec, 
	zero);
   input clock;
   input [3:0] in;
   input latch;
   input dec;
   output zero;

   // Internal wires
   wire FE_PHN14_n45;
   wire FE_PHN13_n43;
   wire FE_PHN12_n38;
   wire FE_PHN11_n45;
   wire FE_PHN10_n43;
   wire FE_PHN9_n52;
   wire FE_PHN8_n32;
   wire FE_PHN7_n51;
   wire FE_PHN6_n50;
   wire FE_PHN5_n32;
   wire FE_PHN4_n51;
   wire FE_PHN3_n46;
   wire FE_PHN2_n50;
   wire FE_PHN1_n52;
   wire FE_PHN0_latch;
   wire clock__L2_N0;
   wire clock__L1_N0;
   wire sub_42_S2_A_0_;
   wire sub_42_S2_A_1_;
   wire sub_42_S2_A_2_;
   wire sub_42_S2_A_3_;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;

   CLKBUF_X1 FE_PHC14_n45 (.Z(FE_PHN14_n45), 
	.A(FE_PHN11_n45));
   CLKBUF_X1 FE_PHC13_n43 (.Z(FE_PHN13_n43), 
	.A(FE_PHN10_n43));
   CLKBUF_X1 FE_PHC12_n38 (.Z(FE_PHN12_n38), 
	.A(n38));
   CLKBUF_X1 FE_PHC11_n45 (.Z(FE_PHN11_n45), 
	.A(n45));
   CLKBUF_X1 FE_PHC10_n43 (.Z(FE_PHN10_n43), 
	.A(n43));
   BUF_X32 FE_PHC9_n52 (.Z(FE_PHN9_n52), 
	.A(n52));
   BUF_X32 FE_PHC8_n32 (.Z(FE_PHN8_n32), 
	.A(n32));
   BUF_X32 FE_PHC7_n51 (.Z(FE_PHN7_n51), 
	.A(n51));
   BUF_X32 FE_PHC6_n50 (.Z(FE_PHN6_n50), 
	.A(n50));
   BUF_X32 FE_PHC5_n32 (.Z(FE_PHN5_n32), 
	.A(FE_PHN8_n32));
   BUF_X32 FE_PHC4_n51 (.Z(FE_PHN4_n51), 
	.A(FE_PHN7_n51));
   BUF_X32 FE_PHC3_n46 (.Z(FE_PHN3_n46), 
	.A(n46));
   BUF_X32 FE_PHC2_n50 (.Z(FE_PHN2_n50), 
	.A(FE_PHN6_n50));
   BUF_X32 FE_PHC1_n52 (.Z(FE_PHN1_n52), 
	.A(FE_PHN9_n52));
   CLKBUF_X1 FE_PHC0_latch (.Z(FE_PHN0_latch), 
	.A(latch));
   INV_X16 clock__L2_I0 (.ZN(clock__L2_N0), 
	.A(clock__L1_N0));
   INV_X32 clock__L1_I0 (.ZN(clock__L1_N0), 
	.A(clock));
   DFF_X1 value_reg_0_ (.Q(sub_42_S2_A_0_), 
	.D(FE_PHN5_n32), 
	.CK(clock__L2_N0));
   DFF_X1 value_reg_1_ (.QN(n36), 
	.Q(sub_42_S2_A_1_), 
	.D(FE_PHN4_n51), 
	.CK(clock__L2_N0));
   DFF_X1 value_reg_2_ (.QN(n35), 
	.Q(sub_42_S2_A_2_), 
	.D(FE_PHN2_n50), 
	.CK(clock__L2_N0));
   DFF_X1 value_reg_3_ (.QN(n31), 
	.Q(sub_42_S2_A_3_), 
	.D(FE_PHN1_n52), 
	.CK(clock__L2_N0));
   NAND2_X2 U9 (.ZN(n45), 
	.A2(FE_PHN0_latch), 
	.A1(in[3]));
   AND2_X2 U15 (.ZN(n49), 
	.A2(FE_PHN0_latch), 
	.A1(in[0]));
   NOR4_X2 U18 (.ZN(zero), 
	.A4(sub_42_S2_A_3_), 
	.A3(sub_42_S2_A_2_), 
	.A2(sub_42_S2_A_1_), 
	.A1(sub_42_S2_A_0_));
   INV_X4 U19 (.ZN(n32), 
	.A(n48));
   INV_X4 U20 (.ZN(n33), 
	.A(n41));
   INV_X4 U21 (.ZN(n34), 
	.A(FE_PHN3_n46));
   INV_X4 U22 (.ZN(n37), 
	.A(dec));
   NOR3_X2 U23 (.ZN(n46), 
	.A3(n37), 
	.A2(FE_PHN0_latch), 
	.A1(zero));
   NOR2_X2 U24 (.ZN(n40), 
	.A2(sub_42_S2_A_0_), 
	.A1(n34));
   AOI21_X2 U25 (.ZN(n42), 
	.B2(sub_42_S2_A_0_), 
	.B1(FE_PHN3_n46), 
	.A(n47));
   OAI21_X2 U26 (.ZN(n41), 
	.B2(n36), 
	.B1(n34), 
	.A(n42));
   NOR2_X2 U27 (.ZN(n47), 
	.A2(FE_PHN3_n46), 
	.A1(FE_PHN0_latch));
   OAI21_X2 U28 (.ZN(n51), 
	.B2(n36), 
	.B1(n42), 
	.A(FE_PHN13_n43));
   AOI22_X2 U29 (.ZN(n43), 
	.B2(n36), 
	.B1(n40), 
	.A2(FE_PHN0_latch), 
	.A1(in[1]));
   OAI21_X2 U30 (.ZN(n52), 
	.B2(n31), 
	.B1(n44), 
	.A(FE_PHN14_n45));
   AOI21_X2 U31 (.ZN(n44), 
	.B2(FE_PHN3_n46), 
	.B1(sub_42_S2_A_2_), 
	.A(n41));
   OAI21_X2 U32 (.ZN(n50), 
	.B2(n35), 
	.B1(n33), 
	.A(FE_PHN12_n38));
   AOI22_X2 U33 (.ZN(n38), 
	.B2(FE_PHN0_latch), 
	.B1(in[2]), 
	.A2(n40), 
	.A1(n39));
   NOR2_X2 U34 (.ZN(n39), 
	.A2(sub_42_S2_A_1_), 
	.A1(sub_42_S2_A_2_));
   AOI211_X2 U35 (.ZN(n48), 
	.C2(n47), 
	.C1(sub_42_S2_A_0_), 
	.B(n40), 
	.A(n49));
endmodule

