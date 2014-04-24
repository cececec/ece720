
module DW_ahb ( hclk, hresetn, haddr_m1, hburst_m1, hlock_m1, hprot_m1, 
        hsize_m1, htrans_m1, hwdata_m1, hwrite_m1, hsel_s1, hready_resp_s1, 
        hresp_s1, hrdata_s1, hsel_s2, hready_resp_s2, hresp_s2, hrdata_s2, 
        haddr, hburst, hprot, hsize, htrans, hwdata, hwrite, hready, hresp, 
        hrdata, hmaster, hmaster_data, hmastlock );
  input [31:0] haddr_m1;
  input [2:0] hburst_m1;
  input [3:0] hprot_m1;
  input [2:0] hsize_m1;
  input [1:0] htrans_m1;
  input [31:0] hwdata_m1;
  input [1:0] hresp_s1;
  input [31:0] hrdata_s1;
  input [1:0] hresp_s2;
  input [31:0] hrdata_s2;
  output [31:0] haddr;
  output [2:0] hburst;
  output [3:0] hprot;
  output [2:0] hsize;
  output [1:0] htrans;
  output [31:0] hwdata;
  output [1:0] hresp;
  output [31:0] hrdata;
  output [3:0] hmaster;
  output [3:0] hmaster_data;
  input hclk, hresetn, hlock_m1, hwrite_m1, hready_resp_s1, hready_resp_s2;
  output hsel_s1, hsel_s2, hwrite, hready, hmastlock;
  wire   hwrite, hsel_3_, hready_resp_none, hresp_none_0_, U_mux_n51,
         U_mux_n50, U_mux_n49, U_mux_n48, U_mux_n47, U_mux_n46, U_mux_n45,
         U_mux_n44, U_mux_n43, U_mux_n42, U_mux_n41, U_mux_n40, U_mux_n39,
         U_mux_n38, U_mux_n37, U_mux_n36, U_mux_n35, U_mux_n34, U_mux_n33,
         U_mux_n32, U_mux_n31, U_mux_n30, U_mux_n29, U_mux_n28, U_mux_n27,
         U_mux_n26, U_mux_n25, U_mux_n24, U_mux_n21, U_mux_n20, U_mux_n19,
         U_mux_n18, U_mux_n17, U_mux_n16, U_mux_n15, U_mux_n14, U_mux_n13,
         U_mux_n12, U_mux_n11, U_mux_n10, U_mux_n9, U_mux_n8, U_mux_n7,
         U_mux_n6, U_mux_n5, U_mux_n4, U_mux_n3, U_mux_n2, U_mux_n1, U_mux_n23,
         U_mux_n22, U_mux_hsel_prev_1_, U_dcdr_n1, U_arblite_n1, U_dfltslv_n3,
         U_dfltslv_n2, U_dfltslv_n1, U_dfltslv_N4, U_dfltslv_current_state;
  assign haddr[31] = haddr_m1[31];
  assign haddr[30] = haddr_m1[30];
  assign haddr[29] = haddr_m1[29];
  assign haddr[28] = haddr_m1[28];
  assign haddr[27] = haddr_m1[27];
  assign haddr[26] = haddr_m1[26];
  assign haddr[25] = haddr_m1[25];
  assign haddr[24] = haddr_m1[24];
  assign haddr[23] = haddr_m1[23];
  assign haddr[22] = haddr_m1[22];
  assign haddr[21] = haddr_m1[21];
  assign haddr[20] = haddr_m1[20];
  assign haddr[19] = haddr_m1[19];
  assign haddr[18] = haddr_m1[18];
  assign haddr[17] = haddr_m1[17];
  assign haddr[16] = haddr_m1[16];
  assign haddr[15] = haddr_m1[15];
  assign haddr[14] = haddr_m1[14];
  assign haddr[13] = haddr_m1[13];
  assign haddr[12] = haddr_m1[12];
  assign haddr[11] = haddr_m1[11];
  assign haddr[10] = haddr_m1[10];
  assign haddr[9] = haddr_m1[9];
  assign haddr[8] = haddr_m1[8];
  assign haddr[7] = haddr_m1[7];
  assign haddr[6] = haddr_m1[6];
  assign haddr[5] = haddr_m1[5];
  assign haddr[4] = haddr_m1[4];
  assign haddr[3] = haddr_m1[3];
  assign haddr[2] = haddr_m1[2];
  assign haddr[1] = haddr_m1[1];
  assign haddr[0] = haddr_m1[0];
  assign hburst[2] = hburst_m1[2];
  assign hburst[1] = hburst_m1[1];
  assign hburst[0] = hburst_m1[0];
  assign hprot[3] = hprot_m1[3];
  assign hprot[2] = hprot_m1[2];
  assign hprot[1] = hprot_m1[1];
  assign hprot[0] = hprot_m1[0];
  assign hsize[2] = hsize_m1[2];
  assign hsize[1] = hsize_m1[1];
  assign hsize[0] = hsize_m1[0];
  assign htrans[1] = htrans_m1[1];
  assign htrans[0] = htrans_m1[0];
  assign hwdata[31] = hwdata_m1[31];
  assign hwdata[30] = hwdata_m1[30];
  assign hwdata[29] = hwdata_m1[29];
  assign hwdata[28] = hwdata_m1[28];
  assign hwdata[27] = hwdata_m1[27];
  assign hwdata[26] = hwdata_m1[26];
  assign hwdata[25] = hwdata_m1[25];
  assign hwdata[24] = hwdata_m1[24];
  assign hwdata[23] = hwdata_m1[23];
  assign hwdata[22] = hwdata_m1[22];
  assign hwdata[21] = hwdata_m1[21];
  assign hwdata[20] = hwdata_m1[20];
  assign hwdata[19] = hwdata_m1[19];
  assign hwdata[18] = hwdata_m1[18];
  assign hwdata[17] = hwdata_m1[17];
  assign hwdata[16] = hwdata_m1[16];
  assign hwdata[15] = hwdata_m1[15];
  assign hwdata[14] = hwdata_m1[14];
  assign hwdata[13] = hwdata_m1[13];
  assign hwdata[12] = hwdata_m1[12];
  assign hwdata[11] = hwdata_m1[11];
  assign hwdata[10] = hwdata_m1[10];
  assign hwdata[9] = hwdata_m1[9];
  assign hwdata[8] = hwdata_m1[8];
  assign hwdata[7] = hwdata_m1[7];
  assign hwdata[6] = hwdata_m1[6];
  assign hwdata[5] = hwdata_m1[5];
  assign hwdata[4] = hwdata_m1[4];
  assign hwdata[3] = hwdata_m1[3];
  assign hwdata[2] = hwdata_m1[2];
  assign hwdata[1] = hwdata_m1[1];
  assign hwdata[0] = hwdata_m1[0];
  assign hwrite = hwrite_m1;
  assign hmaster_data[1] = 1'b0;
  assign hmaster_data[2] = 1'b0;
  assign hmaster_data[3] = 1'b0;
  assign hmaster[1] = 1'b0;
  assign hmaster[2] = 1'b0;
  assign hmaster[3] = 1'b0;
  assign hmaster_data[0] = 1'b1;
  assign hmaster[0] = 1'b1;

  AOI22_X1 U_mux_U88 ( .A1(U_mux_n50), .A2(U_mux_n49), .B1(U_mux_n2), .B2(
        hready_resp_s1), .ZN(U_mux_n51) );
  OAI21_X1 U_mux_U87 ( .B1(hready_resp_s1), .B2(U_mux_n47), .A(U_mux_n46), 
        .ZN(U_mux_n23) );
  OAI22_X1 U_mux_U86 ( .A1(U_mux_n45), .A2(hsel_s1), .B1(U_mux_n44), .B2(
        U_mux_hsel_prev_1_), .ZN(U_mux_n46) );
  NOR2_X1 U_mux_U85 ( .A1(U_mux_n45), .A2(U_mux_n43), .ZN(U_mux_n44) );
  NOR2_X1 U_mux_U84 ( .A1(U_mux_n3), .A2(hready_resp_none), .ZN(U_mux_n43) );
  NAND2_X1 U_mux_U83 ( .A1(U_mux_n50), .A2(U_mux_n42), .ZN(U_mux_n22) );
  OAI221_X1 U_mux_U82 ( .B1(U_mux_n49), .B2(U_mux_hsel_prev_1_), .C1(U_mux_n49), .C2(hready_resp_s1), .A(hsel_s2), .ZN(U_mux_n42) );
  OAI21_X1 U_mux_U81 ( .B1(U_mux_hsel_prev_1_), .B2(U_mux_n41), .A(U_mux_n1), 
        .ZN(U_mux_n49) );
  INV_X1 U_mux_U79 ( .A(U_mux_n45), .ZN(U_mux_n50) );
  NOR2_X1 U_mux_U78 ( .A1(hready_resp_s2), .A2(U_mux_n1), .ZN(U_mux_n45) );
  OAI21_X1 U_mux_U77 ( .B1(U_mux_hsel_prev_1_), .B2(U_mux_n40), .A(U_mux_n39), 
        .ZN(hresp[0]) );
  AOI22_X1 U_mux_U76 ( .A1(U_mux_n3), .A2(hresp_s2[0]), .B1(U_mux_n2), .B2(
        hresp_s1[0]), .ZN(U_mux_n39) );
  NAND2_X1 U_mux_U75 ( .A1(U_mux_n1), .A2(hresp_none_0_), .ZN(U_mux_n40) );
  INV_X1 U_mux_U72 ( .A(U_mux_n38), .ZN(hresp[1]) );
  AOI22_X1 U_mux_U71 ( .A1(U_mux_n3), .A2(hresp_s2[1]), .B1(U_mux_n2), .B2(
        hresp_s1[1]), .ZN(U_mux_n38) );
  INV_X1 U_mux_U70 ( .A(U_mux_n37), .ZN(hrdata[31]) );
  AOI22_X1 U_mux_U69 ( .A1(U_mux_n3), .A2(hrdata_s2[31]), .B1(U_mux_n2), .B2(
        hrdata_s1[31]), .ZN(U_mux_n37) );
  INV_X1 U_mux_U68 ( .A(U_mux_n36), .ZN(hrdata[30]) );
  AOI22_X1 U_mux_U67 ( .A1(U_mux_n3), .A2(hrdata_s2[30]), .B1(U_mux_n2), .B2(
        hrdata_s1[30]), .ZN(U_mux_n36) );
  INV_X1 U_mux_U66 ( .A(U_mux_n35), .ZN(hrdata[29]) );
  AOI22_X1 U_mux_U65 ( .A1(U_mux_n3), .A2(hrdata_s2[29]), .B1(U_mux_n2), .B2(
        hrdata_s1[29]), .ZN(U_mux_n35) );
  INV_X1 U_mux_U64 ( .A(U_mux_n34), .ZN(hrdata[28]) );
  AOI22_X1 U_mux_U63 ( .A1(U_mux_n3), .A2(hrdata_s2[28]), .B1(U_mux_n2), .B2(
        hrdata_s1[28]), .ZN(U_mux_n34) );
  INV_X1 U_mux_U62 ( .A(U_mux_n33), .ZN(hrdata[27]) );
  AOI22_X1 U_mux_U61 ( .A1(U_mux_n3), .A2(hrdata_s2[27]), .B1(U_mux_n2), .B2(
        hrdata_s1[27]), .ZN(U_mux_n33) );
  INV_X1 U_mux_U60 ( .A(U_mux_n32), .ZN(hrdata[26]) );
  AOI22_X1 U_mux_U59 ( .A1(U_mux_n3), .A2(hrdata_s2[26]), .B1(U_mux_n2), .B2(
        hrdata_s1[26]), .ZN(U_mux_n32) );
  INV_X1 U_mux_U58 ( .A(U_mux_n31), .ZN(hrdata[25]) );
  AOI22_X1 U_mux_U57 ( .A1(U_mux_n3), .A2(hrdata_s2[25]), .B1(U_mux_n2), .B2(
        hrdata_s1[25]), .ZN(U_mux_n31) );
  INV_X1 U_mux_U56 ( .A(U_mux_n30), .ZN(hrdata[24]) );
  AOI22_X1 U_mux_U55 ( .A1(U_mux_n3), .A2(hrdata_s2[24]), .B1(U_mux_n2), .B2(
        hrdata_s1[24]), .ZN(U_mux_n30) );
  INV_X1 U_mux_U54 ( .A(U_mux_n29), .ZN(hrdata[23]) );
  AOI22_X1 U_mux_U53 ( .A1(U_mux_n3), .A2(hrdata_s2[23]), .B1(U_mux_n48), .B2(
        hrdata_s1[23]), .ZN(U_mux_n29) );
  INV_X1 U_mux_U52 ( .A(U_mux_n28), .ZN(hrdata[22]) );
  AOI22_X1 U_mux_U51 ( .A1(U_mux_n3), .A2(hrdata_s2[22]), .B1(U_mux_n48), .B2(
        hrdata_s1[22]), .ZN(U_mux_n28) );
  INV_X1 U_mux_U50 ( .A(U_mux_n27), .ZN(hrdata[21]) );
  AOI22_X1 U_mux_U49 ( .A1(U_mux_n3), .A2(hrdata_s2[21]), .B1(U_mux_n48), .B2(
        hrdata_s1[21]), .ZN(U_mux_n27) );
  INV_X1 U_mux_U48 ( .A(U_mux_n26), .ZN(hrdata[20]) );
  AOI22_X1 U_mux_U47 ( .A1(U_mux_n3), .A2(hrdata_s2[20]), .B1(U_mux_n48), .B2(
        hrdata_s1[20]), .ZN(U_mux_n26) );
  INV_X1 U_mux_U46 ( .A(U_mux_n25), .ZN(hrdata[19]) );
  AOI22_X1 U_mux_U45 ( .A1(U_mux_n3), .A2(hrdata_s2[19]), .B1(U_mux_n48), .B2(
        hrdata_s1[19]), .ZN(U_mux_n25) );
  INV_X1 U_mux_U44 ( .A(U_mux_n24), .ZN(hrdata[18]) );
  AOI22_X1 U_mux_U43 ( .A1(U_mux_n3), .A2(hrdata_s2[18]), .B1(U_mux_n48), .B2(
        hrdata_s1[18]), .ZN(U_mux_n24) );
  INV_X1 U_mux_U42 ( .A(U_mux_n21), .ZN(hrdata[17]) );
  AOI22_X1 U_mux_U41 ( .A1(U_mux_n3), .A2(hrdata_s2[17]), .B1(U_mux_n48), .B2(
        hrdata_s1[17]), .ZN(U_mux_n21) );
  INV_X1 U_mux_U40 ( .A(U_mux_n20), .ZN(hrdata[16]) );
  AOI22_X1 U_mux_U39 ( .A1(U_mux_n3), .A2(hrdata_s2[16]), .B1(U_mux_n48), .B2(
        hrdata_s1[16]), .ZN(U_mux_n20) );
  INV_X1 U_mux_U38 ( .A(U_mux_n19), .ZN(hrdata[15]) );
  AOI22_X1 U_mux_U37 ( .A1(U_mux_n3), .A2(hrdata_s2[15]), .B1(U_mux_n48), .B2(
        hrdata_s1[15]), .ZN(U_mux_n19) );
  INV_X1 U_mux_U36 ( .A(U_mux_n18), .ZN(hrdata[14]) );
  AOI22_X1 U_mux_U35 ( .A1(U_mux_n3), .A2(hrdata_s2[14]), .B1(U_mux_n48), .B2(
        hrdata_s1[14]), .ZN(U_mux_n18) );
  INV_X1 U_mux_U34 ( .A(U_mux_n17), .ZN(hrdata[13]) );
  AOI22_X1 U_mux_U33 ( .A1(U_mux_n3), .A2(hrdata_s2[13]), .B1(U_mux_n48), .B2(
        hrdata_s1[13]), .ZN(U_mux_n17) );
  INV_X1 U_mux_U32 ( .A(U_mux_n16), .ZN(hrdata[12]) );
  AOI22_X1 U_mux_U31 ( .A1(U_mux_n3), .A2(hrdata_s2[12]), .B1(U_mux_n48), .B2(
        hrdata_s1[12]), .ZN(U_mux_n16) );
  INV_X1 U_mux_U30 ( .A(U_mux_n15), .ZN(hrdata[11]) );
  AOI22_X1 U_mux_U29 ( .A1(U_mux_n3), .A2(hrdata_s2[11]), .B1(U_mux_n48), .B2(
        hrdata_s1[11]), .ZN(U_mux_n15) );
  INV_X1 U_mux_U28 ( .A(U_mux_n14), .ZN(hrdata[10]) );
  AOI22_X1 U_mux_U27 ( .A1(U_mux_n3), .A2(hrdata_s2[10]), .B1(U_mux_n48), .B2(
        hrdata_s1[10]), .ZN(U_mux_n14) );
  INV_X1 U_mux_U26 ( .A(U_mux_n13), .ZN(hrdata[9]) );
  AOI22_X1 U_mux_U25 ( .A1(U_mux_n3), .A2(hrdata_s2[9]), .B1(U_mux_n48), .B2(
        hrdata_s1[9]), .ZN(U_mux_n13) );
  INV_X1 U_mux_U24 ( .A(U_mux_n12), .ZN(hrdata[8]) );
  AOI22_X1 U_mux_U23 ( .A1(U_mux_n3), .A2(hrdata_s2[8]), .B1(U_mux_n2), .B2(
        hrdata_s1[8]), .ZN(U_mux_n12) );
  INV_X1 U_mux_U22 ( .A(U_mux_n11), .ZN(hrdata[7]) );
  AOI22_X1 U_mux_U21 ( .A1(U_mux_n3), .A2(hrdata_s2[7]), .B1(U_mux_n48), .B2(
        hrdata_s1[7]), .ZN(U_mux_n11) );
  INV_X1 U_mux_U20 ( .A(U_mux_n10), .ZN(hrdata[6]) );
  AOI22_X1 U_mux_U19 ( .A1(U_mux_n3), .A2(hrdata_s2[6]), .B1(U_mux_n48), .B2(
        hrdata_s1[6]), .ZN(U_mux_n10) );
  INV_X1 U_mux_U18 ( .A(U_mux_n9), .ZN(hrdata[5]) );
  AOI22_X1 U_mux_U17 ( .A1(U_mux_n3), .A2(hrdata_s2[5]), .B1(U_mux_n48), .B2(
        hrdata_s1[5]), .ZN(U_mux_n9) );
  INV_X1 U_mux_U16 ( .A(U_mux_n8), .ZN(hrdata[4]) );
  AOI22_X1 U_mux_U15 ( .A1(U_mux_n3), .A2(hrdata_s2[4]), .B1(U_mux_n48), .B2(
        hrdata_s1[4]), .ZN(U_mux_n8) );
  INV_X1 U_mux_U14 ( .A(U_mux_n7), .ZN(hrdata[3]) );
  AOI22_X1 U_mux_U13 ( .A1(U_mux_n3), .A2(hrdata_s2[3]), .B1(U_mux_n48), .B2(
        hrdata_s1[3]), .ZN(U_mux_n7) );
  INV_X1 U_mux_U12 ( .A(U_mux_n6), .ZN(hrdata[2]) );
  AOI22_X1 U_mux_U11 ( .A1(U_mux_n3), .A2(hrdata_s2[2]), .B1(U_mux_n48), .B2(
        hrdata_s1[2]), .ZN(U_mux_n6) );
  INV_X1 U_mux_U10 ( .A(U_mux_n5), .ZN(hrdata[1]) );
  AOI22_X1 U_mux_U9 ( .A1(U_mux_n3), .A2(hrdata_s2[1]), .B1(U_mux_n48), .B2(
        hrdata_s1[1]), .ZN(U_mux_n5) );
  INV_X1 U_mux_U8 ( .A(U_mux_n4), .ZN(hrdata[0]) );
  AOI22_X1 U_mux_U7 ( .A1(U_mux_n3), .A2(hrdata_s2[0]), .B1(U_mux_n48), .B2(
        hrdata_s1[0]), .ZN(U_mux_n4) );
  NAND2_X1 U_mux_U6 ( .A1(U_mux_hsel_prev_1_), .A2(U_mux_n1), .ZN(U_mux_n47)
         );
  BUF_X1 U_mux_U5 ( .A(U_mux_n48), .Z(U_mux_n2) );
  INV_X1 U_mux_U4 ( .A(U_mux_n51), .ZN(hready) );
  INV_X1 U_mux_U3 ( .A(U_mux_n47), .ZN(U_mux_n48) );
  DFFR_X2 U_mux_hsel_prev_reg_2_ ( .D(U_mux_n22), .CK(hclk), .RN(hresetn), .Q(
        U_mux_n3), .QN(U_mux_n1) );
  DFFR_X1 U_mux_hsel_prev_reg_1_ ( .D(U_mux_n23), .CK(hclk), .RN(hresetn), .Q(
        U_mux_hsel_prev_1_) );
  NOR2_X1 U_dcdr_U6 ( .A1(haddr[30]), .A2(hsel_3_), .ZN(hsel_s1) );
  NOR2_X1 U_dcdr_U5 ( .A1(hsel_3_), .A2(U_dcdr_n1), .ZN(hsel_s2) );
  INV_X1 U_dcdr_U4 ( .A(haddr[30]), .ZN(U_dcdr_n1) );
  OR2_X1 U_dcdr_U3 ( .A1(haddr[31]), .A2(haddr[29]), .ZN(hsel_3_) );
  MUX2_X1 U_arblite_U3 ( .A(hmastlock), .B(hlock_m1), .S(hready), .Z(
        U_arblite_n1) );
  DFFR_X1 U_arblite_hmastlock_reg ( .D(U_arblite_n1), .CK(hclk), .RN(hresetn), 
        .Q(hmastlock) );
  OR2_X1 U_dfltslv_U5 ( .A1(U_dfltslv_current_state), .A2(U_dfltslv_n3), .ZN(
        U_dfltslv_n1) );
  NAND2_X1 U_dfltslv_U4 ( .A1(U_dfltslv_n2), .A2(U_dfltslv_n3), .ZN(
        U_dfltslv_N4) );
  NAND3_X1 U_dfltslv_U3 ( .A1(htrans[1]), .A2(hready), .A3(hsel_3_), .ZN(
        U_dfltslv_n3) );
  DFFR_X1 U_dfltslv_hresp_none_reg_0_ ( .D(U_dfltslv_N4), .CK(hclk), .RN(
        hresetn), .Q(hresp_none_0_) );
  DFFS_X1 U_dfltslv_current_state_reg ( .D(U_dfltslv_n1), .CK(hclk), .SN(
        hresetn), .Q(U_dfltslv_n2), .QN(U_dfltslv_current_state) );
  DFFS_X1 U_dfltslv_hready_resp_none_reg ( .D(U_dfltslv_n1), .CK(hclk), .SN(
        hresetn), .Q(hready_resp_none), .QN(U_mux_n41) );
endmodule

