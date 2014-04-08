module i_ahb_DW_ahb (
	hclk, 
	hresetn, 
	haddr_m1, 
	hburst_m1, 
	hbusreq_m1, 
	hlock_m1, 
	hprot_m1, 
	hsize_m1, 
	htrans_m1, 
	hwdata_m1, 
	hwrite_m1, 
	hgrant_m1, 
	hsel_s0, 
	hready_resp_s0, 
	hresp_s0, 
	hrdata_s0, 
	hsel_s1, 
	hready_resp_s1, 
	hresp_s1, 
	hrdata_s1, 
	hsel_s2, 
	hready_resp_s2, 
	hresp_s2, 
	hrdata_s2, 
	haddr, 
	hburst, 
	hprot, 
	hsize, 
	htrans, 
	hwdata, 
	hwrite, 
	hready, 
	hresp, 
	hrdata, 
	ahbarbint, 
	hmaster, 
	hmaster_data, 
	hmastlock);
   input hclk;
   input hresetn;
   input [31:0] haddr_m1;
   input [2:0] hburst_m1;
   input hbusreq_m1;
   input hlock_m1;
   input [3:0] hprot_m1;
   input [2:0] hsize_m1;
   input [1:0] htrans_m1;
   input [31:0] hwdata_m1;
   input hwrite_m1;
   output hgrant_m1;
   output hsel_s0;
   output hready_resp_s0;
   output [1:0] hresp_s0;
   output [31:0] hrdata_s0;
   output hsel_s1;
   input hready_resp_s1;
   input [1:0] hresp_s1;
   input [31:0] hrdata_s1;
   output hsel_s2;
   input hready_resp_s2;
   input [1:0] hresp_s2;
   input [31:0] hrdata_s2;
   output [31:0] haddr;
   output [2:0] hburst;
   output [3:0] hprot;
   output [2:0] hsize;
   output [1:0] htrans;
   output [31:0] hwdata;
   output hwrite;
   output hready;
   output [1:0] hresp;
   output [31:0] hrdata;
   output ahbarbint;
   output [3:0] hmaster;
   output [3:0] hmaster_data;
   output hmastlock;

   // Internal wires
   wire n10;
   wire n4;
   wire hresp_none_0_;
   wire U_mux_n58;
   wire U_mux_n57;
   wire U_mux_n56;
   wire U_mux_n55;
   wire U_mux_n54;
   wire U_mux_n53;
   wire U_mux_n52;
   wire U_mux_n51;
   wire U_mux_n50;
   wire U_mux_n49;
   wire U_mux_n48;
   wire U_mux_n47;
   wire U_mux_n46;
   wire U_mux_n45;
   wire U_mux_n44;
   wire U_mux_n43;
   wire U_mux_n42;
   wire U_mux_n41;
   wire U_mux_n40;
   wire U_mux_n39;
   wire U_mux_n38;
   wire U_mux_n37;
   wire U_mux_n36;
   wire U_mux_n35;
   wire U_mux_n34;
   wire U_mux_n33;
   wire U_mux_n32;
   wire U_mux_n31;
   wire U_mux_n30;
   wire U_mux_n29;
   wire U_mux_n28;
   wire U_mux_n27;
   wire U_mux_n26;
   wire U_mux_n25;
   wire U_mux_n24;
   wire U_mux_n23;
   wire U_mux_n22;
   wire U_mux_n21;
   wire U_mux_n20;
   wire U_mux_n19;
   wire U_mux_n18;
   wire U_mux_n17;
   wire U_mux_n16;
   wire U_mux_n15;
   wire U_mux_n14;
   wire U_mux_n12;
   wire U_mux_n4;
   wire U_mux_n3;
   wire U_mux_n2;
   wire U_mux_n10;
   wire U_mux_n9;
   wire U_mux_n8;
   wire U_mux_n7;
   wire U_mux_hsel_prev_0_;
   wire U_mux_hsel_prev_1_;
   wire U_mux_hsel_prev_2_;
   wire U_dcdr_n16;
   wire U_dcdr_n15;
   wire U_dcdr_n14;
   wire U_dcdr_n13;
   wire U_dcdr_n12;
   wire U_dcdr_n11;
   wire U_dcdr_n10;
   wire U_dcdr_n6;
   wire U_dcdr_n5;
   wire U_arb_ibus_hbusreq_1_;
   wire U_arb_parked_2t;
   wire U_arb_mask_1_;
   wire U_arb_est;
   wire U_arb_csilt;
   wire U_arb_int_set_ebt;
   wire U_arb_ltip;
   wire U_arb_grant_changed;
   wire U_arb_new_tfr;
   wire U_arb_maskmaster_1_;
   wire U_arb_def_mst_0_;
   wire U_arb_ebten;
   wire U_arb_clr_arbint;
   wire U_dfltslv_n5;
   wire U_dfltslv_n3;
   wire U_dfltslv_n1;
   wire U_dfltslv_N4;
   wire U_dfltslv_current_state;
   wire U_arb_U_gctrl_n179;
   wire U_arb_U_gctrl_n178;
   wire U_arb_U_gctrl_n177;
   wire U_arb_U_gctrl_n176;
   wire U_arb_U_gctrl_n175;
   wire U_arb_U_gctrl_n174;
   wire U_arb_U_gctrl_n173;
   wire U_arb_U_gctrl_n171;
   wire U_arb_U_gctrl_n170;
   wire U_arb_U_gctrl_n169;
   wire U_arb_U_gctrl_n168;
   wire U_arb_U_gctrl_n167;
   wire U_arb_U_gctrl_n166;
   wire U_arb_U_gctrl_n165;
   wire U_arb_U_gctrl_n164;
   wire U_arb_U_gctrl_n163;
   wire U_arb_U_gctrl_n162;
   wire U_arb_U_gctrl_n161;
   wire U_arb_U_gctrl_n160;
   wire U_arb_U_gctrl_n159;
   wire U_arb_U_gctrl_n158;
   wire U_arb_U_gctrl_n157;
   wire U_arb_U_gctrl_n156;
   wire U_arb_U_gctrl_n155;
   wire U_arb_U_gctrl_n154;
   wire U_arb_U_gctrl_n153;
   wire U_arb_U_gctrl_n152;
   wire U_arb_U_gctrl_n151;
   wire U_arb_U_gctrl_n150;
   wire U_arb_U_gctrl_n149;
   wire U_arb_U_gctrl_n148;
   wire U_arb_U_gctrl_n147;
   wire U_arb_U_gctrl_n146;
   wire U_arb_U_gctrl_n145;
   wire U_arb_U_gctrl_n144;
   wire U_arb_U_gctrl_n143;
   wire U_arb_U_gctrl_n142;
   wire U_arb_U_gctrl_n141;
   wire U_arb_U_gctrl_n140;
   wire U_arb_U_gctrl_n139;
   wire U_arb_U_gctrl_n138;
   wire U_arb_U_gctrl_n137;
   wire U_arb_U_gctrl_n136;
   wire U_arb_U_gctrl_n135;
   wire U_arb_U_gctrl_n134;
   wire U_arb_U_gctrl_n133;
   wire U_arb_U_gctrl_n132;
   wire U_arb_U_gctrl_n131;
   wire U_arb_U_gctrl_n130;
   wire U_arb_U_gctrl_n129;
   wire U_arb_U_gctrl_n128;
   wire U_arb_U_gctrl_n127;
   wire U_arb_U_gctrl_n126;
   wire U_arb_U_gctrl_n125;
   wire U_arb_U_gctrl_n124;
   wire U_arb_U_gctrl_n123;
   wire U_arb_U_gctrl_n122;
   wire U_arb_U_gctrl_n121;
   wire U_arb_U_gctrl_n120;
   wire U_arb_U_gctrl_n119;
   wire U_arb_U_gctrl_n118;
   wire U_arb_U_gctrl_n117;
   wire U_arb_U_gctrl_n116;
   wire U_arb_U_gctrl_n115;
   wire U_arb_U_gctrl_n114;
   wire U_arb_U_gctrl_n113;
   wire U_arb_U_gctrl_n112;
   wire U_arb_U_gctrl_n111;
   wire U_arb_U_gctrl_n110;
   wire U_arb_U_gctrl_n109;
   wire U_arb_U_gctrl_n108;
   wire U_arb_U_gctrl_n107;
   wire U_arb_U_gctrl_n106;
   wire U_arb_U_gctrl_n105;
   wire U_arb_U_gctrl_n104;
   wire U_arb_U_gctrl_n103;
   wire U_arb_U_gctrl_n102;
   wire U_arb_U_gctrl_n101;
   wire U_arb_U_gctrl_n100;
   wire U_arb_U_gctrl_n84;
   wire U_arb_U_gctrl_n83;
   wire U_arb_U_gctrl_n82;
   wire U_arb_U_gctrl_n81;
   wire U_arb_U_gctrl_n80;
   wire U_arb_U_gctrl_n79;
   wire U_arb_U_gctrl_n78;
   wire U_arb_U_gctrl_n77;
   wire U_arb_U_gctrl_n76;
   wire U_arb_U_gctrl_n75;
   wire U_arb_U_gctrl_n74;
   wire U_arb_U_gctrl_n73;
   wire U_arb_U_gctrl_n72;
   wire U_arb_U_gctrl_n71;
   wire U_arb_U_gctrl_n70;
   wire U_arb_U_gctrl_n69;
   wire U_arb_U_gctrl_n68;
   wire U_arb_U_gctrl_n67;
   wire U_arb_U_gctrl_n66;
   wire U_arb_U_gctrl_n65;
   wire U_arb_U_gctrl_n64;
   wire U_arb_U_gctrl_n63;
   wire U_arb_U_gctrl_n62;
   wire U_arb_U_gctrl_n61;
   wire U_arb_U_gctrl_n60;
   wire U_arb_U_gctrl_n59;
   wire U_arb_U_gctrl_n58;
   wire U_arb_U_gctrl_n57;
   wire U_arb_U_gctrl_n56;
   wire U_arb_U_gctrl_n55;
   wire U_arb_U_gctrl_n54;
   wire U_arb_U_gctrl_n53;
   wire U_arb_U_gctrl_n52;
   wire U_arb_U_gctrl_n51;
   wire U_arb_U_gctrl_n48;
   wire U_arb_U_gctrl_n47;
   wire U_arb_U_gctrl_n46;
   wire U_arb_U_gctrl_n45;
   wire U_arb_U_gctrl_n44;
   wire U_arb_U_gctrl_n43;
   wire U_arb_U_gctrl_n42;
   wire U_arb_U_gctrl_n41;
   wire U_arb_U_gctrl_n38;
   wire U_arb_U_gctrl_n37;
   wire U_arb_U_gctrl_n36;
   wire U_arb_U_gctrl_n35;
   wire U_arb_U_gctrl_n34;
   wire U_arb_U_gctrl_n33;
   wire U_arb_U_gctrl_n32;
   wire U_arb_U_gctrl_n31;
   wire U_arb_U_gctrl_n30;
   wire U_arb_U_gctrl_n28;
   wire U_arb_U_gctrl_n27;
   wire U_arb_U_gctrl_n26;
   wire U_arb_U_gctrl_n25;
   wire U_arb_U_gctrl_n24;
   wire U_arb_U_gctrl_n23;
   wire U_arb_U_gctrl_n22;
   wire U_arb_U_gctrl_n21;
   wire U_arb_U_gctrl_n20;
   wire U_arb_U_gctrl_n19;
   wire U_arb_U_gctrl_n18;
   wire U_arb_U_gctrl_n17;
   wire U_arb_U_gctrl_n16;
   wire U_arb_U_gctrl_n15;
   wire U_arb_U_gctrl_n14;
   wire U_arb_U_gctrl_n13;
   wire U_arb_U_gctrl_n12;
   wire U_arb_U_gctrl_n11;
   wire U_arb_U_gctrl_n10;
   wire U_arb_U_gctrl_n9;
   wire U_arb_U_gctrl_n8;
   wire U_arb_U_gctrl_n6;
   wire U_arb_U_gctrl_n5;
   wire U_arb_U_gctrl_n3;
   wire U_arb_U_gctrl_n2;
   wire U_arb_U_gctrl_n1;
   wire U_arb_U_gctrl_n99;
   wire U_arb_U_gctrl_n98;
   wire U_arb_U_gctrl_n97;
   wire U_arb_U_gctrl_n96;
   wire U_arb_U_gctrl_n95;
   wire U_arb_U_gctrl_n94;
   wire U_arb_U_gctrl_n93;
   wire U_arb_U_gctrl_n92;
   wire U_arb_U_gctrl_n91;
   wire U_arb_U_gctrl_n90;
   wire U_arb_U_gctrl_n89;
   wire U_arb_U_gctrl_n88;
   wire U_arb_U_gctrl_n87;
   wire U_arb_U_gctrl_n86;
   wire U_arb_U_gctrl_n85;
   wire U_arb_U_gctrl_r_hmaster_d_0_;
   wire U_arb_U_gctrl_wasinn;
   wire U_arb_U_gctrl_nxt_lock_sm_1_;
   wire U_arb_U_gctrl_nxt_lock_sm_2_;
   wire U_arb_U_gctrl_lock_sm_0_;
   wire U_arb_U_gctrl_lock_sm_1_;
   wire U_arb_U_gctrl_lock_sm_2_;
   wire U_arb_U_gctrl_bbc_0_;
   wire U_arb_U_gctrl_bbc_1_;
   wire U_arb_U_gctrl_bbc_2_;
   wire U_arb_U_gctrl_bbc_3_;
   wire U_arb_U_gctrl_bc_0_;
   wire U_arb_U_gctrl_bc_1_;
   wire U_arb_U_gctrl_bc_2_;
   wire U_arb_U_gctrl_bc_3_;
   wire U_arb_U_gctrl_n181;
   wire U_arb_U_mask_n17;
   wire U_arb_U_mask_n16;
   wire U_arb_U_mask_n15;
   wire U_arb_U_mask_n14;
   wire U_arb_U_mask_n13;
   wire U_arb_U_mask_n12;
   wire U_arb_U_mask_n10;
   wire U_arb_U_mask_n9;
   wire U_arb_U_mask_n8;
   wire U_arb_U_mask_n4;
   wire U_arb_U_mask_n3;
   wire U_arb_U_mask_n2;
   wire U_arb_U_mask_n1;
   wire U_arb_U_mask_n7;
   wire U_arb_U_mask_n6;
   wire U_arb_U_mask_n5;
   wire U_arb_U_mask_r_mask_locked_1_;
   wire U_arb_U_ebt_n61;
   wire U_arb_U_ebt_n60;
   wire U_arb_U_ebt_n59;
   wire U_arb_U_ebt_n58;
   wire U_arb_U_ebt_n57;
   wire U_arb_U_ebt_n56;
   wire U_arb_U_ebt_n55;
   wire U_arb_U_ebt_n53;
   wire U_arb_U_ebt_n52;
   wire U_arb_U_ebt_n51;
   wire U_arb_U_ebt_n50;
   wire U_arb_U_ebt_n49;
   wire U_arb_U_ebt_n48;
   wire U_arb_U_ebt_n47;
   wire U_arb_U_ebt_n46;
   wire U_arb_U_ebt_n45;
   wire U_arb_U_ebt_n44;
   wire U_arb_U_ebt_n43;
   wire U_arb_U_ebt_n42;
   wire U_arb_U_ebt_n41;
   wire U_arb_U_ebt_n40;
   wire U_arb_U_ebt_n39;
   wire U_arb_U_ebt_n38;
   wire U_arb_U_ebt_n37;
   wire U_arb_U_ebt_n36;
   wire U_arb_U_ebt_n35;
   wire U_arb_U_ebt_n22;
   wire U_arb_U_ebt_n21;
   wire U_arb_U_ebt_n20;
   wire U_arb_U_ebt_n19;
   wire U_arb_U_ebt_n18;
   wire U_arb_U_ebt_n17;
   wire U_arb_U_ebt_n16;
   wire U_arb_U_ebt_n15;
   wire U_arb_U_ebt_n14;
   wire U_arb_U_ebt_n13;
   wire U_arb_U_ebt_n12;
   wire U_arb_U_ebt_n11;
   wire U_arb_U_ebt_n9;
   wire U_arb_U_ebt_n8;
   wire U_arb_U_ebt_n7;
   wire U_arb_U_ebt_n6;
   wire U_arb_U_ebt_n5;
   wire U_arb_U_ebt_n4;
   wire U_arb_U_ebt_n3;
   wire U_arb_U_ebt_n2;
   wire U_arb_U_ebt_n1;
   wire U_arb_U_ebt_n34;
   wire U_arb_U_ebt_n33;
   wire U_arb_U_ebt_n32;
   wire U_arb_U_ebt_n31;
   wire U_arb_U_ebt_n30;
   wire U_arb_U_ebt_n29;
   wire U_arb_U_ebt_n28;
   wire U_arb_U_ebt_n27;
   wire U_arb_U_ebt_n26;
   wire U_arb_U_ebt_n25;
   wire U_arb_U_ebt_n24;
   wire U_arb_U_ebt_n23;
   wire U_arb_U_ebt_int_reg_set_ebt;
   wire U_arb_U_ebt_int_count_0_;
   wire U_arb_U_ebt_int_count_1_;
   wire U_arb_U_ebt_int_count_2_;
   wire U_arb_U_ebt_int_count_3_;
   wire U_arb_U_ebt_int_count_4_;
   wire U_arb_U_ebt_int_count_5_;
   wire U_arb_U_ebt_int_count_6_;
   wire U_arb_U_ebt_int_count_7_;
   wire U_arb_U_ebt_int_count_8_;
   wire U_arb_U_ebt_int_count_9_;
   wire U_arb_U_ebt_int_current_state_0_;
   wire U_arb_U_ebt_int_current_state_1_;
   wire U_arb_U_arbif_n198;
   wire U_arb_U_arbif_n197;
   wire U_arb_U_arbif_n196;
   wire U_arb_U_arbif_n195;
   wire U_arb_U_arbif_n194;
   wire U_arb_U_arbif_n193;
   wire U_arb_U_arbif_n192;
   wire U_arb_U_arbif_n191;
   wire U_arb_U_arbif_n190;
   wire U_arb_U_arbif_n189;
   wire U_arb_U_arbif_n188;
   wire U_arb_U_arbif_n187;
   wire U_arb_U_arbif_n186;
   wire U_arb_U_arbif_n185;
   wire U_arb_U_arbif_n184;
   wire U_arb_U_arbif_n183;
   wire U_arb_U_arbif_n182;
   wire U_arb_U_arbif_n181;
   wire U_arb_U_arbif_n180;
   wire U_arb_U_arbif_n179;
   wire U_arb_U_arbif_n178;
   wire U_arb_U_arbif_n172;
   wire U_arb_U_arbif_n171;
   wire U_arb_U_arbif_n170;
   wire U_arb_U_arbif_n161;
   wire U_arb_U_arbif_n142;
   wire U_arb_U_arbif_n141;
   wire U_arb_U_arbif_n140;
   wire U_arb_U_arbif_n119;
   wire U_arb_U_arbif_n118;
   wire U_arb_U_arbif_n117;
   wire U_arb_U_arbif_n116;
   wire U_arb_U_arbif_n115;
   wire U_arb_U_arbif_n114;
   wire U_arb_U_arbif_n113;
   wire U_arb_U_arbif_n112;
   wire U_arb_U_arbif_n111;
   wire U_arb_U_arbif_n110;
   wire U_arb_U_arbif_n109;
   wire U_arb_U_arbif_n108;
   wire U_arb_U_arbif_n107;
   wire U_arb_U_arbif_n106;
   wire U_arb_U_arbif_n105;
   wire U_arb_U_arbif_n104;
   wire U_arb_U_arbif_n103;
   wire U_arb_U_arbif_n102;
   wire U_arb_U_arbif_n101;
   wire U_arb_U_arbif_n100;
   wire U_arb_U_arbif_n99;
   wire U_arb_U_arbif_n98;
   wire U_arb_U_arbif_n97;
   wire U_arb_U_arbif_n96;
   wire U_arb_U_arbif_n95;
   wire U_arb_U_arbif_n94;
   wire U_arb_U_arbif_n91;
   wire U_arb_U_arbif_n90;
   wire U_arb_U_arbif_n87;
   wire U_arb_U_arbif_n86;
   wire U_arb_U_arbif_n84;
   wire U_arb_U_arbif_n83;
   wire U_arb_U_arbif_n82;
   wire U_arb_U_arbif_n81;
   wire U_arb_U_arbif_n80;
   wire U_arb_U_arbif_n79;
   wire U_arb_U_arbif_n78;
   wire U_arb_U_arbif_n76;
   wire U_arb_U_arbif_n75;
   wire U_arb_U_arbif_n74;
   wire U_arb_U_arbif_n73;
   wire U_arb_U_arbif_n72;
   wire U_arb_U_arbif_n71;
   wire U_arb_U_arbif_n70;
   wire U_arb_U_arbif_n69;
   wire U_arb_U_arbif_n68;
   wire U_arb_U_arbif_n67;
   wire U_arb_U_arbif_n66;
   wire U_arb_U_arbif_n65;
   wire U_arb_U_arbif_n64;
   wire U_arb_U_arbif_n63;
   wire U_arb_U_arbif_n62;
   wire U_arb_U_arbif_n61;
   wire U_arb_U_arbif_n60;
   wire U_arb_U_arbif_n59;
   wire U_arb_U_arbif_n58;
   wire U_arb_U_arbif_n57;
   wire U_arb_U_arbif_n56;
   wire U_arb_U_arbif_n55;
   wire U_arb_U_arbif_n54;
   wire U_arb_U_arbif_n53;
   wire U_arb_U_arbif_n52;
   wire U_arb_U_arbif_n51;
   wire U_arb_U_arbif_n50;
   wire U_arb_U_arbif_n49;
   wire U_arb_U_arbif_n48;
   wire U_arb_U_arbif_n47;
   wire U_arb_U_arbif_n46;
   wire U_arb_U_arbif_n45;
   wire U_arb_U_arbif_n44;
   wire U_arb_U_arbif_n43;
   wire U_arb_U_arbif_n42;
   wire U_arb_U_arbif_n41;
   wire U_arb_U_arbif_n40;
   wire U_arb_U_arbif_n39;
   wire U_arb_U_arbif_n38;
   wire U_arb_U_arbif_n34;
   wire U_arb_U_arbif_n33;
   wire U_arb_U_arbif_n32;
   wire U_arb_U_arbif_n31;
   wire U_arb_U_arbif_n30;
   wire U_arb_U_arbif_n29;
   wire U_arb_U_arbif_n28;
   wire U_arb_U_arbif_n27;
   wire U_arb_U_arbif_n26;
   wire U_arb_U_arbif_n25;
   wire U_arb_U_arbif_n24;
   wire U_arb_U_arbif_n23;
   wire U_arb_U_arbif_n22;
   wire U_arb_U_arbif_n21;
   wire U_arb_U_arbif_n20;
   wire U_arb_U_arbif_n19;
   wire U_arb_U_arbif_n18;
   wire U_arb_U_arbif_n17;
   wire U_arb_U_arbif_n14;
   wire U_arb_U_arbif_n13;
   wire U_arb_U_arbif_n12;
   wire U_arb_U_arbif_n11;
   wire U_arb_U_arbif_n8;
   wire U_arb_U_arbif_n7;
   wire U_arb_U_arbif_n6;
   wire U_arb_U_arbif_n5;
   wire U_arb_U_arbif_n3;
   wire U_arb_U_arbif_n2;
   wire U_arb_U_arbif_n1;
   wire U_arb_U_arbif_n215;
   wire U_arb_U_arbif_n177;
   wire U_arb_U_arbif_n176;
   wire U_arb_U_arbif_n175;
   wire U_arb_U_arbif_n174;
   wire U_arb_U_arbif_n173;
   wire U_arb_U_arbif_n169;
   wire U_arb_U_arbif_n168;
   wire U_arb_U_arbif_n167;
   wire U_arb_U_arbif_n166;
   wire U_arb_U_arbif_n165;
   wire U_arb_U_arbif_n164;
   wire U_arb_U_arbif_n163;
   wire U_arb_U_arbif_n162;
   wire U_arb_U_arbif_n160;
   wire U_arb_U_arbif_n159;
   wire U_arb_U_arbif_n158;
   wire U_arb_U_arbif_n157;
   wire U_arb_U_arbif_n156;
   wire U_arb_U_arbif_n155;
   wire U_arb_U_arbif_n154;
   wire U_arb_U_arbif_n153;
   wire U_arb_U_arbif_n152;
   wire U_arb_U_arbif_n151;
   wire U_arb_U_arbif_n150;
   wire U_arb_U_arbif_n149;
   wire U_arb_U_arbif_n148;
   wire U_arb_U_arbif_n147;
   wire U_arb_U_arbif_n146;
   wire U_arb_U_arbif_n145;
   wire U_arb_U_arbif_n144;
   wire U_arb_U_arbif_n143;
   wire U_arb_U_arbif_n139;
   wire U_arb_U_arbif_n138;
   wire U_arb_U_arbif_n137;
   wire U_arb_U_arbif_n136;
   wire U_arb_U_arbif_n135;
   wire U_arb_U_arbif_n134;
   wire U_arb_U_arbif_n133;
   wire U_arb_U_arbif_n132;
   wire U_arb_U_arbif_n131;
   wire U_arb_U_arbif_n130;
   wire U_arb_U_arbif_n129;
   wire U_arb_U_arbif_n128;
   wire U_arb_U_arbif_n127;
   wire U_arb_U_arbif_n126;
   wire U_arb_U_arbif_n125;
   wire U_arb_U_arbif_n124;
   wire U_arb_U_arbif_n123;
   wire U_arb_U_arbif_n122;
   wire U_arb_U_arbif_n121;
   wire U_arb_U_arbif_n120;
   wire U_arb_U_arbif_int_ebt;
   wire U_arb_U_arbif_r_state_0_;
   wire U_arb_U_arbif_r_state_1_;
   wire U_arb_U_arbif_N72;
   wire U_arb_U_arbif_nxt_state_0_;
   wire U_arb_U_arbif_nxt_state_1_;
   wire U_arb_U_arbif_r_hmaster_d_0_;
   wire U_arb_U_arbif_r_hsize_d_0_;
   wire U_arb_U_arbif_r_hsize_d_1_;
   wire U_arb_U_arbif_r_hsize_d_2_;
   wire U_arb_U_arbif_r_hwrite_d;
   wire U_arb_U_arbif_r_htrans_d_1_;
   wire U_arb_U_arbif_r_haddr_d_0_;
   wire U_arb_U_arbif_r_haddr_d_2_;
   wire U_arb_U_arbif_r_haddr_d_3_;
   wire U_arb_U_arbif_r_haddr_d_4_;
   wire U_arb_U_arbif_r_haddr_d_5_;
   wire U_arb_U_arbif_r_haddr_d_6_;
   wire U_arb_U_arbif_r_haddr_d_7_;
   wire U_arb_U_arbif_r_haddr_d_8_;
   wire U_arb_U_arbif_r_haddr_d_9_;
   wire U_arb_U_arbif_r_hsel_arb_d;
   wire U_arb_U_arbif_ebten;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire [1:0] U_arb_grant_2t;
   wire [7:4] U_arb_bus_priority;
   wire [9:0] U_arb_ebtcount;
   wire [1:0] U_arb_U_gctrl_hgrant_previous;
   wire [1:0] U_arb_U_ebt_next_state;
   wire [3:0] U_arb_U_arbif_ipl1;

   assign hresp_s0[1] = 1'b0 ;
   assign hrdata_s0[31] = 1'b0 ;
   assign hrdata_s0[30] = 1'b0 ;
   assign hrdata_s0[27] = 1'b0 ;
   assign hrdata_s0[26] = 1'b0 ;
   assign hrdata_s0[24] = 1'b0 ;
   assign hrdata_s0[23] = 1'b0 ;
   assign hrdata_s0[22] = 1'b0 ;
   assign hrdata_s0[19] = 1'b0 ;
   assign hrdata_s0[18] = 1'b0 ;
   assign hrdata_s0[17] = 1'b0 ;
   assign hrdata_s0[16] = 1'b0 ;
   assign hrdata_s0[15] = 1'b0 ;
   assign hrdata_s0[14] = 1'b0 ;
   assign hrdata_s0[10] = 1'b0 ;
   assign hmaster_data[3] = 1'b0 ;
   assign hmaster_data[2] = 1'b0 ;
   assign hmaster_data[1] = 1'b0 ;

   INV_X4 U4 (.ZN(hready), 
	.A(n10));
   MUX2_X2 U_mux_U88 (.Z(U_mux_n10), 
	.S(n10), 
	.B(U_mux_hsel_prev_0_), 
	.A(hsel_s0));
   MUX2_X2 U_mux_U87 (.Z(U_mux_n9), 
	.S(U_mux_n58), 
	.B(n4), 
	.A(hmaster_data[0]));
   MUX2_X2 U_mux_U86 (.Z(U_mux_n8), 
	.S(n10), 
	.B(U_mux_hsel_prev_1_), 
	.A(hsel_s1));
   MUX2_X2 U_mux_U85 (.Z(U_mux_n7), 
	.S(n10), 
	.B(U_mux_n12), 
	.A(hsel_s2));
   NAND3_X2 U_mux_U84 (.ZN(U_mux_n58), 
	.A3(U_mux_n21), 
	.A2(U_mux_n22), 
	.A1(U_mux_n23));
   NAND2_X2 U_mux_U83 (.ZN(U_mux_n23), 
	.A2(U_mux_n12), 
	.A1(hready_resp_s2));
   INV_X4 U_mux_U81 (.ZN(U_mux_n12), 
	.A(U_mux_n4));
   NAND2_X2 U_mux_U80 (.ZN(U_mux_n15), 
	.A2(hresp_s0[0]), 
	.A1(U_mux_n53));
   NAND3_X2 U_mux_U79 (.ZN(hresp[0]), 
	.A3(U_mux_n15), 
	.A2(U_mux_n16), 
	.A1(U_mux_n17));
   INV_X4 U_mux_U78 (.ZN(hresp[1]), 
	.A(U_mux_n18));
   NAND2_X2 U_mux_U77 (.ZN(U_mux_n22), 
	.A2(U_mux_n56), 
	.A1(hready_resp_s1));
   NOR2_X2 U_mux_U76 (.ZN(U_mux_n19), 
	.A2(U_dfltslv_current_state), 
	.A1(U_mux_hsel_prev_0_));
   INV_X4 U_mux_U74 (.ZN(hrdata[0]), 
	.A(U_mux_n24));
   INV_X4 U_mux_U73 (.ZN(hrdata[29]), 
	.A(U_mux_n54));
   INV_X4 U_mux_U72 (.ZN(hrdata[5]), 
	.A(U_mux_n29));
   INV_X4 U_mux_U71 (.ZN(hrdata[8]), 
	.A(U_mux_n32));
   INV_X4 U_mux_U70 (.ZN(hrdata[2]), 
	.A(U_mux_n26));
   INV_X4 U_mux_U69 (.ZN(hrdata[3]), 
	.A(U_mux_n27));
   INV_X4 U_mux_U68 (.ZN(hrdata[1]), 
	.A(U_mux_n25));
   INV_X4 U_mux_U67 (.ZN(hrdata[12]), 
	.A(U_mux_n36));
   INV_X4 U_mux_U66 (.ZN(hrdata[6]), 
	.A(U_mux_n30));
   INV_X4 U_mux_U65 (.ZN(hrdata[7]), 
	.A(U_mux_n31));
   INV_X4 U_mux_U64 (.ZN(hrdata[28]), 
	.A(U_mux_n52));
   INV_X4 U_mux_U63 (.ZN(hrdata[9]), 
	.A(U_mux_n33));
   INV_X4 U_mux_U62 (.ZN(hrdata[21]), 
	.A(U_mux_n45));
   INV_X4 U_mux_U61 (.ZN(hrdata[11]), 
	.A(U_mux_n35));
   INV_X4 U_mux_U60 (.ZN(hrdata[4]), 
	.A(U_mux_n28));
   INV_X4 U_mux_U59 (.ZN(hrdata[25]), 
	.A(U_mux_n49));
   INV_X4 U_mux_U58 (.ZN(hrdata[13]), 
	.A(U_mux_n37));
   INV_X4 U_mux_U57 (.ZN(hrdata[20]), 
	.A(U_mux_n44));
   INV_X4 U_mux_U56 (.ZN(hrdata[10]), 
	.A(U_mux_n34));
   INV_X4 U_mux_U55 (.ZN(hrdata[17]), 
	.A(U_mux_n41));
   INV_X4 U_mux_U54 (.ZN(hrdata[16]), 
	.A(U_mux_n40));
   INV_X4 U_mux_U53 (.ZN(hrdata[15]), 
	.A(U_mux_n39));
   INV_X4 U_mux_U52 (.ZN(hrdata[14]), 
	.A(U_mux_n38));
   INV_X4 U_mux_U51 (.ZN(hrdata[18]), 
	.A(U_mux_n42));
   INV_X4 U_mux_U50 (.ZN(hrdata[19]), 
	.A(U_mux_n43));
   INV_X4 U_mux_U49 (.ZN(hrdata[31]), 
	.A(U_mux_n57));
   INV_X4 U_mux_U48 (.ZN(hrdata[22]), 
	.A(U_mux_n46));
   INV_X4 U_mux_U47 (.ZN(hrdata[23]), 
	.A(U_mux_n47));
   INV_X4 U_mux_U46 (.ZN(hrdata[30]), 
	.A(U_mux_n55));
   INV_X4 U_mux_U45 (.ZN(hrdata[26]), 
	.A(U_mux_n50));
   INV_X4 U_mux_U44 (.ZN(hrdata[24]), 
	.A(U_mux_n48));
   INV_X4 U_mux_U43 (.ZN(hrdata[27]), 
	.A(U_mux_n51));
   AOI222_X1 U_mux_U42 (.ZN(U_mux_n25), 
	.C2(hrdata_s0[1]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[1]), 
	.A2(hrdata_s2[1]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U41 (.ZN(U_mux_n36), 
	.C2(hrdata_s0[12]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[12]), 
	.A2(hrdata_s2[12]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U40 (.ZN(U_mux_n24), 
	.C2(hrdata_s0[0]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[0]), 
	.A2(hrdata_s2[0]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U39 (.ZN(U_mux_n54), 
	.C2(hrdata_s0[29]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[29]), 
	.A2(hrdata_s2[29]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U38 (.ZN(U_mux_n29), 
	.C2(hrdata_s0[5]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[5]), 
	.A2(hrdata_s2[5]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U37 (.ZN(U_mux_n32), 
	.C2(hrdata_s0[8]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[8]), 
	.A2(hrdata_s2[8]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U36 (.ZN(U_mux_n26), 
	.C2(hrdata_s0[2]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[2]), 
	.A2(hrdata_s2[2]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U35 (.ZN(U_mux_n27), 
	.C2(hrdata_s0[3]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[3]), 
	.A2(hrdata_s2[3]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U34 (.ZN(U_mux_n30), 
	.C2(hrdata_s0[6]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[6]), 
	.A2(hrdata_s2[6]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U33 (.ZN(U_mux_n31), 
	.C2(hrdata_s0[7]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[7]), 
	.A2(hrdata_s2[7]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U32 (.ZN(U_mux_n52), 
	.C2(hrdata_s0[28]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[28]), 
	.A2(hrdata_s2[28]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U31 (.ZN(U_mux_n33), 
	.C2(hrdata_s0[9]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[9]), 
	.A2(hrdata_s2[9]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U30 (.ZN(U_mux_n45), 
	.C2(hrdata_s0[21]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[21]), 
	.A2(hrdata_s2[21]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U29 (.ZN(U_mux_n35), 
	.C2(hrdata_s0[11]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[11]), 
	.A2(hrdata_s2[11]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U28 (.ZN(U_mux_n28), 
	.C2(hrdata_s0[4]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[4]), 
	.A2(hrdata_s2[4]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U27 (.ZN(U_mux_n49), 
	.C2(hrdata_s0[25]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[25]), 
	.A2(hrdata_s2[25]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U26 (.ZN(U_mux_n37), 
	.C2(hrdata_s0[13]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[13]), 
	.A2(hrdata_s2[13]), 
	.A1(U_mux_n12));
   AOI222_X1 U_mux_U25 (.ZN(U_mux_n44), 
	.C2(hrdata_s0[20]), 
	.C1(U_mux_n53), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[20]), 
	.A2(hrdata_s2[20]), 
	.A1(U_mux_n12));
   NOR2_X4 U_mux_U23 (.ZN(U_mux_n56), 
	.A2(U_mux_n3), 
	.A1(U_mux_hsel_prev_2_));
   AOI22_X1 U_mux_U22 (.ZN(U_mux_n57), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[31]), 
	.A2(hrdata_s2[31]), 
	.A1(U_mux_n12));
   AOI22_X1 U_mux_U21 (.ZN(U_mux_n43), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[19]), 
	.A2(hrdata_s2[19]), 
	.A1(U_mux_n12));
   AOI22_X1 U_mux_U20 (.ZN(U_mux_n42), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[18]), 
	.A2(hrdata_s2[18]), 
	.A1(U_mux_n12));
   AOI22_X1 U_mux_U19 (.ZN(U_mux_n40), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[16]), 
	.A2(hrdata_s2[16]), 
	.A1(U_mux_n12));
   AOI22_X1 U_mux_U18 (.ZN(U_mux_n41), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[17]), 
	.A2(hrdata_s2[17]), 
	.A1(U_mux_n12));
   AOI22_X1 U_mux_U17 (.ZN(U_mux_n34), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[10]), 
	.A2(hrdata_s2[10]), 
	.A1(U_mux_n12));
   NAND2_X2 U_mux_U16 (.ZN(U_mux_n14), 
	.A2(U_mux_n4), 
	.A1(U_mux_n3));
   NAND3_X1 U_mux_U15 (.ZN(U_mux_n16), 
	.A3(U_mux_n2), 
	.A2(hresp_none_0_), 
	.A1(U_mux_n20));
   AOI22_X2 U_mux_U14 (.ZN(U_mux_n38), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[14]), 
	.A2(hrdata_s2[14]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U13 (.ZN(U_mux_n17), 
	.B2(U_mux_n56), 
	.B1(hresp_s1[0]), 
	.A2(hresp_s2[0]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U12 (.ZN(U_mux_n46), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[22]), 
	.A2(hrdata_s2[22]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U11 (.ZN(U_mux_n18), 
	.B2(U_mux_n56), 
	.B1(hresp_s1[1]), 
	.A2(hresp_s2[1]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U10 (.ZN(U_mux_n48), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[24]), 
	.A2(hrdata_s2[24]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U9 (.ZN(U_mux_n47), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[23]), 
	.A2(hrdata_s2[23]), 
	.A1(U_mux_n12));
   INV_X2 U_mux_U8 (.ZN(U_mux_n20), 
	.A(U_mux_n14));
   AOI22_X2 U_mux_U7 (.ZN(U_mux_n21), 
	.B2(U_mux_n19), 
	.B1(U_mux_n20), 
	.A2(hready_resp_s0), 
	.A1(U_mux_n53));
   AOI22_X2 U_mux_U6 (.ZN(U_mux_n39), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[15]), 
	.A2(hrdata_s2[15]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U5 (.ZN(U_mux_n50), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[26]), 
	.A2(hrdata_s2[26]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U4 (.ZN(U_mux_n55), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[30]), 
	.A2(hrdata_s2[30]), 
	.A1(U_mux_n12));
   AOI22_X2 U_mux_U3 (.ZN(U_mux_n51), 
	.B2(U_mux_n56), 
	.B1(hrdata_s1[27]), 
	.A2(hrdata_s2[27]), 
	.A1(U_mux_n12));
   DFFR_X2 U_mux_r_ihmaster_data_reg_0_ (.RN(hresetn), 
	.Q(hmaster_data[0]), 
	.D(U_mux_n9), 
	.CK(hclk));
   DFFR_X2 U_mux_hsel_prev_reg_1_ (.RN(hresetn), 
	.QN(U_mux_n3), 
	.Q(U_mux_hsel_prev_1_), 
	.D(U_mux_n8), 
	.CK(hclk));
   DFFR_X2 U_mux_hsel_prev_reg_2_ (.RN(hresetn), 
	.QN(U_mux_n4), 
	.Q(U_mux_hsel_prev_2_), 
	.D(U_mux_n7), 
	.CK(hclk));
   DFFR_X2 U_mux_hsel_prev_reg_0_ (.RN(hresetn), 
	.QN(U_mux_n2), 
	.Q(U_mux_hsel_prev_0_), 
	.D(U_mux_n10), 
	.CK(hclk));
   AND2_X4 U_dcdr_U21 (.ZN(hsel_s1), 
	.A2(haddr[12]), 
	.A1(U_dcdr_n16));
   NOR2_X2 U_dcdr_U20 (.ZN(U_dcdr_n13), 
	.A2(haddr[18]), 
	.A1(haddr[17]));
   NOR2_X2 U_dcdr_U19 (.ZN(U_dcdr_n12), 
	.A2(haddr[19]), 
	.A1(haddr[16]));
   NOR4_X2 U_dcdr_U16 (.ZN(U_dcdr_n6), 
	.A4(haddr[29]), 
	.A3(haddr[31]), 
	.A2(haddr[30]), 
	.A1(haddr[28]));
   NOR4_X2 U_dcdr_U15 (.ZN(U_dcdr_n5), 
	.A4(haddr[27]), 
	.A3(haddr[24]), 
	.A2(haddr[26]), 
	.A1(haddr[25]));
   NAND2_X2 U_dcdr_U14 (.ZN(U_dcdr_n15), 
	.A2(U_dcdr_n5), 
	.A1(U_dcdr_n6));
   NOR4_X2 U_dcdr_U10 (.ZN(hsel_s2), 
	.A4(U_dcdr_n14), 
	.A3(U_dcdr_n15), 
	.A2(haddr[20]), 
	.A1(haddr[22]));
   NOR2_X2 U_dcdr_U6 (.ZN(hsel_s0), 
	.A2(U_dcdr_n10), 
	.A1(haddr[12]));
   NAND4_X1 U_dcdr_U4 (.ZN(U_dcdr_n14), 
	.A4(U_dcdr_n11), 
	.A3(U_dcdr_n12), 
	.A2(U_dcdr_n13), 
	.A1(haddr[23]));
   INV_X2 U_dcdr_U3 (.ZN(U_dcdr_n10), 
	.A(U_dcdr_n16));
   NOR2_X2 U_arb_U5 (.ZN(U_arb_grant_2t[1]), 
	.A2(U_arb_ibus_hbusreq_1_), 
	.A1(U_arb_mask_1_));
   NOR2_X2 U_arb_U3 (.ZN(U_arb_parked_2t), 
	.A2(U_arb_grant_2t[0]), 
	.A1(U_arb_grant_2t[1]));
   NAND2_X2 U_dfltslv_U6 (.ZN(U_dfltslv_n1), 
	.A2(U_dfltslv_n3), 
	.A1(U_dfltslv_n5));
   OR2_X2 U_dfltslv_U3 (.ZN(U_dfltslv_N4), 
	.A2(U_dfltslv_n5), 
	.A1(U_dfltslv_current_state));
   DFFR_X1 U_dfltslv_hresp_none_reg_0_ (.RN(hresetn), 
	.Q(hresp_none_0_), 
	.D(U_dfltslv_N4), 
	.CK(hclk));
   DFFS_X2 U_dfltslv_current_state_reg (.SN(hresetn), 
	.QN(U_dfltslv_current_state), 
	.Q(U_dfltslv_n3), 
	.D(U_dfltslv_n1), 
	.CK(hclk));
   AND2_X4 U_mux_U_dm_U33 (.ZN(hwdata[0]), 
	.A2(hwdata_m1[0]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U32 (.ZN(hwdata[1]), 
	.A2(hwdata_m1[1]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U31 (.ZN(hwdata[2]), 
	.A2(hwdata_m1[2]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U30 (.ZN(hwdata[3]), 
	.A2(hwdata_m1[3]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U29 (.ZN(hwdata[6]), 
	.A2(hwdata_m1[6]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U28 (.ZN(hwdata[5]), 
	.A2(hwdata_m1[5]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U27 (.ZN(hwdata[4]), 
	.A2(hwdata_m1[4]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U26 (.ZN(hwdata[7]), 
	.A2(hwdata_m1[7]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U25 (.ZN(hwdata[8]), 
	.A2(hwdata_m1[8]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U24 (.ZN(hwdata[9]), 
	.A2(hwdata_m1[9]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U23 (.ZN(hwdata[28]), 
	.A2(hwdata_m1[28]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U22 (.ZN(hwdata[23]), 
	.A2(hwdata_m1[23]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U21 (.ZN(hwdata[22]), 
	.A2(hwdata_m1[22]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U20 (.ZN(hwdata[31]), 
	.A2(hwdata_m1[31]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U19 (.ZN(hwdata[20]), 
	.A2(hwdata_m1[20]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U18 (.ZN(hwdata[19]), 
	.A2(hwdata_m1[19]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U17 (.ZN(hwdata[30]), 
	.A2(hwdata_m1[30]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U16 (.ZN(hwdata[29]), 
	.A2(hwdata_m1[29]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U15 (.ZN(hwdata[27]), 
	.A2(hwdata_m1[27]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U14 (.ZN(hwdata[26]), 
	.A2(hwdata_m1[26]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U13 (.ZN(hwdata[25]), 
	.A2(hwdata_m1[25]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U12 (.ZN(hwdata[24]), 
	.A2(hwdata_m1[24]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U11 (.ZN(hwdata[11]), 
	.A2(hwdata_m1[11]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U10 (.ZN(hwdata[17]), 
	.A2(hwdata_m1[17]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U9 (.ZN(hwdata[21]), 
	.A2(hwdata_m1[21]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U8 (.ZN(hwdata[15]), 
	.A2(hwdata_m1[15]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U7 (.ZN(hwdata[13]), 
	.A2(hwdata_m1[13]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U6 (.ZN(hwdata[18]), 
	.A2(hwdata_m1[18]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U5 (.ZN(hwdata[14]), 
	.A2(hwdata_m1[14]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U4 (.ZN(hwdata[16]), 
	.A2(hwdata_m1[16]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U3 (.ZN(hwdata[10]), 
	.A2(hwdata_m1[10]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_dm_U2 (.ZN(hwdata[12]), 
	.A2(hwdata_m1[12]), 
	.A1(hmaster_data[0]));
   AND2_X4 U_mux_U_hw_U2 (.ZN(hwrite), 
	.A2(hwrite_m1), 
	.A1(n4));
   AND2_X4 U_mux_U_p_U6 (.ZN(hprot[2]), 
	.A2(hprot_m1[2]), 
	.A1(n4));
   AND2_X4 U_mux_U_p_U5 (.ZN(hprot[3]), 
	.A2(hprot_m1[3]), 
	.A1(n4));
   OR2_X4 U_mux_U_p_U4 (.ZN(hprot[1]), 
	.A2(U_arb_U_gctrl_n25), 
	.A1(hprot_m1[1]));
   OR2_X4 U_mux_U_p_U3 (.ZN(hprot[0]), 
	.A2(U_arb_U_gctrl_n25), 
	.A1(hprot_m1[0]));
   AND2_X4 U_mux_U_s_U4 (.ZN(hsize[2]), 
	.A2(hsize_m1[2]), 
	.A1(n4));
   AND2_X4 U_mux_U_s_U3 (.ZN(hsize[1]), 
	.A2(hsize_m1[1]), 
	.A1(n4));
   AND2_X4 U_mux_U_s_U2 (.ZN(hsize[0]), 
	.A2(hsize_m1[0]), 
	.A1(n4));
   AND2_X4 U_mux_U_b_U4 (.ZN(hburst[1]), 
	.A2(hburst_m1[1]), 
	.A1(n4));
   AND2_X4 U_mux_U_b_U3 (.ZN(hburst[2]), 
	.A2(hburst_m1[2]), 
	.A1(n4));
   AND2_X4 U_mux_U_b_U2 (.ZN(hburst[0]), 
	.A2(hburst_m1[0]), 
	.A1(n4));
   AND2_X4 U_mux_U_t_U3 (.ZN(htrans[1]), 
	.A2(n4), 
	.A1(htrans_m1[1]));
   AND2_X4 U_mux_U_t_U2 (.ZN(htrans[0]), 
	.A2(n4), 
	.A1(htrans_m1[0]));
   AND2_X4 U_mux_U_a_U33 (.ZN(haddr[27]), 
	.A2(haddr_m1[27]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U32 (.ZN(haddr[29]), 
	.A2(haddr_m1[29]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U31 (.ZN(haddr[24]), 
	.A2(haddr_m1[24]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U30 (.ZN(haddr[22]), 
	.A2(haddr_m1[22]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U29 (.ZN(haddr[3]), 
	.A2(haddr_m1[3]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U28 (.ZN(haddr[5]), 
	.A2(haddr_m1[5]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U27 (.ZN(haddr[7]), 
	.A2(haddr_m1[7]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U26 (.ZN(haddr[4]), 
	.A2(haddr_m1[4]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U25 (.ZN(haddr[6]), 
	.A2(haddr_m1[6]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U24 (.ZN(haddr[2]), 
	.A2(haddr_m1[2]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U23 (.ZN(haddr[9]), 
	.A2(haddr_m1[9]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U22 (.ZN(haddr[8]), 
	.A2(haddr_m1[8]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U21 (.ZN(haddr[12]), 
	.A2(haddr_m1[12]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U20 (.ZN(haddr[17]), 
	.A2(haddr_m1[17]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U19 (.ZN(haddr[18]), 
	.A2(haddr_m1[18]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U18 (.ZN(haddr[16]), 
	.A2(haddr_m1[16]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U17 (.ZN(haddr[19]), 
	.A2(haddr_m1[19]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U16 (.ZN(haddr[15]), 
	.A2(haddr_m1[15]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U15 (.ZN(haddr[13]), 
	.A2(haddr_m1[13]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U14 (.ZN(haddr[14]), 
	.A2(haddr_m1[14]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U13 (.ZN(haddr[28]), 
	.A2(haddr_m1[28]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U12 (.ZN(haddr[30]), 
	.A2(haddr_m1[30]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U11 (.ZN(haddr[31]), 
	.A2(haddr_m1[31]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U10 (.ZN(haddr[25]), 
	.A2(haddr_m1[25]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U9 (.ZN(haddr[26]), 
	.A2(haddr_m1[26]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U8 (.ZN(haddr[20]), 
	.A2(haddr_m1[20]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U7 (.ZN(haddr[21]), 
	.A2(haddr_m1[21]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U6 (.ZN(haddr[23]), 
	.A2(haddr_m1[23]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U5 (.ZN(haddr[1]), 
	.A2(haddr_m1[1]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U4 (.ZN(haddr[0]), 
	.A2(haddr_m1[0]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U3 (.ZN(haddr[10]), 
	.A2(haddr_m1[10]), 
	.A1(n4));
   AND2_X4 U_mux_U_a_U2 (.ZN(haddr[11]), 
	.A2(haddr_m1[11]), 
	.A1(n4));
   AOI21_X1 U_arb_U_gctrl_U172 (.ZN(U_arb_ibus_hbusreq_1_), 
	.B2(U_arb_U_gctrl_n171), 
	.B1(n4), 
	.A(hbusreq_m1));
   MUX2_X2 U_arb_U_gctrl_U171 (.Z(U_arb_U_gctrl_n94), 
	.S(U_arb_U_gctrl_n149), 
	.B(hgrant_m1), 
	.A(U_arb_U_gctrl_n150));
   MUX2_X2 U_arb_U_gctrl_U170 (.Z(U_arb_U_gctrl_n93), 
	.S(n10), 
	.B(n4), 
	.A(U_arb_U_gctrl_n144));
   MUX2_X2 U_arb_U_gctrl_U169 (.Z(U_arb_U_gctrl_n91), 
	.S(U_arb_U_gctrl_n143), 
	.B(U_arb_U_gctrl_r_hmaster_d_0_), 
	.A(n4));
   MUX2_X2 U_arb_U_gctrl_U168 (.Z(U_arb_U_gctrl_n90), 
	.S(U_arb_U_gctrl_n149), 
	.B(U_arb_U_gctrl_n181), 
	.A(U_arb_U_gctrl_n141));
   MUX2_X2 U_arb_U_gctrl_U167 (.Z(U_arb_U_gctrl_n137), 
	.S(U_arb_U_gctrl_n118), 
	.B(U_arb_U_gctrl_n119), 
	.A(U_arb_U_gctrl_n122));
   XNOR2_X2 U_arb_U_gctrl_U165 (.ZN(U_arb_U_gctrl_n41), 
	.B(U_arb_U_gctrl_r_hmaster_d_0_), 
	.A(U_arb_U_gctrl_n144));
   AND4_X4 U_arb_U_gctrl_U164 (.ZN(U_arb_U_gctrl_n159), 
	.A4(U_arb_U_gctrl_bbc_2_), 
	.A3(U_arb_U_gctrl_n176), 
	.A2(htrans[0]), 
	.A1(U_arb_U_gctrl_n163));
   OR2_X4 U_arb_U_gctrl_U162 (.ZN(U_arb_U_gctrl_n75), 
	.A2(U_arb_U_gctrl_n78), 
	.A1(U_arb_U_gctrl_n80));
   OR4_X4 U_arb_U_gctrl_U161 (.ZN(U_arb_U_gctrl_n120), 
	.A4(U_arb_U_gctrl_bc_0_), 
	.A3(U_arb_U_gctrl_bc_3_), 
	.A2(n10), 
	.A1(U_arb_grant_changed));
   OR2_X4 U_arb_U_gctrl_U160 (.ZN(U_arb_U_gctrl_n124), 
	.A2(U_arb_U_gctrl_bc_0_), 
	.A1(U_arb_U_gctrl_n121));
   MUX2_X2 U_arb_U_gctrl_U159 (.Z(U_arb_U_gctrl_n92), 
	.S(n10), 
	.B(U_arb_U_gctrl_wasinn), 
	.A(U_arb_U_gctrl_n179));
   INV_X4 U_arb_U_gctrl_U158 (.ZN(U_arb_U_gctrl_n34), 
	.A(hresp[0]));
   NAND2_X2 U_arb_U_gctrl_U157 (.ZN(U_arb_U_gctrl_n107), 
	.A2(hresp[1]), 
	.A1(U_arb_U_gctrl_n34));
   NAND2_X2 U_arb_U_gctrl_U156 (.ZN(U_arb_U_gctrl_n151), 
	.A2(U_arb_U_gctrl_n17), 
	.A1(U_arb_U_gctrl_n10));
   NOR2_X2 U_arb_U_gctrl_U155 (.ZN(U_arb_U_gctrl_n142), 
	.A2(U_arb_U_gctrl_n12), 
	.A1(U_arb_U_gctrl_n151));
   NOR2_X2 U_arb_U_gctrl_U154 (.ZN(U_arb_U_gctrl_n64), 
	.A2(U_arb_U_gctrl_n38), 
	.A1(U_arb_U_gctrl_n107));
   INV_X4 U_arb_U_gctrl_U153 (.ZN(U_arb_U_gctrl_n122), 
	.A(htrans[1]));
   INV_X4 U_arb_U_gctrl_U152 (.ZN(U_arb_U_gctrl_n26), 
	.A(U_arb_U_gctrl_n54));
   NAND2_X2 U_arb_U_gctrl_U151 (.ZN(U_arb_U_gctrl_n27), 
	.A2(U_arb_U_gctrl_n26), 
	.A1(U_arb_U_gctrl_n64));
   NAND3_X2 U_arb_U_gctrl_U149 (.ZN(U_arb_U_gctrl_n57), 
	.A3(U_arb_U_gctrl_lock_sm_0_), 
	.A2(U_arb_U_gctrl_n12), 
	.A1(U_arb_U_gctrl_n10));
   NAND2_X2 U_arb_U_gctrl_U147 (.ZN(U_arb_U_gctrl_n46), 
	.A2(U_arb_U_gctrl_n28), 
	.A1(U_arb_U_gctrl_n27));
   NAND2_X2 U_arb_U_gctrl_U146 (.ZN(U_arb_U_gctrl_n47), 
	.A2(U_arb_U_gctrl_n142), 
	.A1(U_arb_U_gctrl_n54));
   NAND2_X2 U_arb_U_gctrl_U145 (.ZN(U_arb_U_gctrl_n112), 
	.A2(hresp[1]), 
	.A1(hresp[0]));
   NAND2_X2 U_arb_U_gctrl_U144 (.ZN(U_arb_U_gctrl_n31), 
	.A2(U_arb_def_mst_0_), 
	.A1(U_arb_U_gctrl_n16));
   NAND2_X2 U_arb_U_gctrl_U143 (.ZN(U_arb_U_gctrl_n144), 
	.A2(U_arb_U_gctrl_n31), 
	.A1(U_arb_U_gctrl_n14));
   NAND2_X2 U_arb_U_gctrl_U142 (.ZN(U_arb_U_gctrl_n32), 
	.A2(U_arb_U_gctrl_lock_sm_0_), 
	.A1(U_arb_U_gctrl_lock_sm_1_));
   NOR2_X2 U_arb_U_gctrl_U141 (.ZN(U_arb_U_gctrl_n131), 
	.A2(U_arb_U_gctrl_lock_sm_2_), 
	.A1(U_arb_U_gctrl_n32));
   OAI21_X2 U_arb_U_gctrl_U140 (.ZN(U_arb_U_gctrl_n55), 
	.B2(U_arb_U_gctrl_n112), 
	.B1(U_arb_U_gctrl_n47), 
	.A(U_arb_U_gctrl_n63));
   NAND3_X2 U_arb_U_gctrl_U139 (.ZN(U_arb_U_gctrl_n58), 
	.A3(U_arb_U_gctrl_n144), 
	.A2(hlock_m1), 
	.A1(U_mux_n58));
   AOI21_X2 U_arb_U_gctrl_U138 (.ZN(U_arb_U_gctrl_n66), 
	.B2(U_arb_U_gctrl_n45), 
	.B1(U_arb_U_gctrl_n54), 
	.A(U_arb_U_gctrl_n58));
   NOR3_X2 U_arb_U_gctrl_U137 (.ZN(U_arb_U_gctrl_n166), 
	.A3(U_arb_U_gctrl_n66), 
	.A2(U_arb_U_gctrl_n55), 
	.A1(U_arb_U_gctrl_n46));
   NAND2_X2 U_arb_U_gctrl_U136 (.ZN(U_arb_U_gctrl_n56), 
	.A2(U_arb_U_gctrl_n107), 
	.A1(U_arb_U_gctrl_n48));
   NAND2_X2 U_arb_U_gctrl_U133 (.ZN(U_arb_U_gctrl_n35), 
	.A2(U_arb_U_gctrl_n131), 
	.A1(U_arb_U_gctrl_n41));
   NAND2_X2 U_arb_U_gctrl_U132 (.ZN(U_arb_U_gctrl_n37), 
	.A2(U_arb_U_gctrl_n36), 
	.A1(U_arb_U_gctrl_n58));
   NOR2_X2 U_arb_U_gctrl_U131 (.ZN(U_arb_U_gctrl_n51), 
	.A2(U_arb_U_gctrl_nxt_lock_sm_2_), 
	.A1(U_arb_U_gctrl_n59));
   NAND2_X2 U_arb_U_gctrl_U130 (.ZN(U_arb_U_gctrl_n118), 
	.A2(U_arb_U_gctrl_n51), 
	.A1(U_arb_U_gctrl_n166));
   INV_X4 U_arb_U_gctrl_U129 (.ZN(U_arb_ltip), 
	.A(U_arb_U_gctrl_n118));
   AOI211_X2 U_arb_U_gctrl_U128 (.ZN(U_arb_U_gctrl_n169), 
	.C2(U_arb_U_gctrl_n168), 
	.C1(U_arb_U_gctrl_bbc_1_), 
	.B(U_arb_U_gctrl_bbc_2_), 
	.A(U_arb_U_gctrl_bbc_3_));
   INV_X4 U_arb_U_gctrl_U127 (.ZN(U_arb_U_gctrl_n157), 
	.A(hburst[2]));
   NAND2_X2 U_arb_U_gctrl_U126 (.ZN(U_arb_U_gctrl_n162), 
	.A2(U_arb_U_gctrl_n157), 
	.A1(U_arb_U_gctrl_n30));
   OAI21_X2 U_arb_U_gctrl_U125 (.ZN(U_arb_U_gctrl_n177), 
	.B2(U_arb_U_gctrl_bbc_1_), 
	.B1(U_arb_U_gctrl_bbc_0_), 
	.A(htrans[0]));
   OAI22_X2 U_arb_U_gctrl_U124 (.ZN(U_arb_U_gctrl_n171), 
	.B2(U_arb_U_gctrl_n170), 
	.B1(U_arb_U_gctrl_n70), 
	.A2(U_arb_U_gctrl_n153), 
	.A1(U_arb_U_gctrl_n169));
   OAI22_X2 U_arb_U_gctrl_U123 (.ZN(U_arb_U_gctrl_n111), 
	.B2(U_arb_U_gctrl_n109), 
	.B1(U_arb_U_gctrl_n22), 
	.A2(U_arb_U_gctrl_n110), 
	.A1(U_arb_mask_1_));
   NAND2_X2 U_arb_U_gctrl_U122 (.ZN(U_arb_U_gctrl_n147), 
	.A2(U_arb_U_gctrl_n111), 
	.A1(U_arb_parked_2t));
   NOR2_X2 U_arb_U_gctrl_U121 (.ZN(U_arb_U_gctrl_n114), 
	.A2(U_arb_grant_2t[0]), 
	.A1(U_arb_parked_2t));
   INV_X4 U_arb_U_gctrl_U120 (.ZN(U_arb_U_gctrl_n69), 
	.A(U_arb_U_gctrl_n59));
   INV_X4 U_arb_U_gctrl_U119 (.ZN(U_arb_U_gctrl_n68), 
	.A(U_arb_U_gctrl_nxt_lock_sm_2_));
   NAND4_X2 U_arb_U_gctrl_U118 (.ZN(U_arb_U_gctrl_n65), 
	.A4(U_arb_U_gctrl_n61), 
	.A3(U_arb_int_set_ebt), 
	.A2(U_arb_U_gctrl_n62), 
	.A1(U_arb_U_gctrl_n63));
   NOR3_X2 U_arb_U_gctrl_U117 (.ZN(U_arb_U_gctrl_n67), 
	.A3(U_arb_U_gctrl_n64), 
	.A2(U_arb_U_gctrl_n65), 
	.A1(U_arb_U_gctrl_n66));
   OAI21_X2 U_arb_U_gctrl_U116 (.ZN(U_arb_U_gctrl_n141), 
	.B2(U_arb_U_gctrl_n114), 
	.B1(U_arb_U_gctrl_n115), 
	.A(U_arb_U_gctrl_n113));
   NOR2_X2 U_arb_U_gctrl_U115 (.ZN(U_arb_U_gctrl_n117), 
	.A2(U_arb_csilt), 
	.A1(U_arb_U_gctrl_n112));
   NAND2_X2 U_arb_U_gctrl_U114 (.ZN(U_arb_U_gctrl_n119), 
	.A2(U_arb_U_gctrl_n116), 
	.A1(U_arb_U_gctrl_n117));
   INV_X4 U_arb_U_gctrl_U113 (.ZN(U_arb_U_gctrl_n81), 
	.A(U_arb_U_gctrl_n132));
   NAND2_X2 U_arb_U_gctrl_U112 (.ZN(U_arb_U_gctrl_n80), 
	.A2(U_arb_U_gctrl_n162), 
	.A1(U_arb_U_gctrl_n73));
   NAND2_X2 U_arb_U_gctrl_U111 (.ZN(U_arb_U_gctrl_n79), 
	.A2(U_arb_U_gctrl_n11), 
	.A1(U_arb_U_gctrl_n20));
   NOR2_X2 U_arb_U_gctrl_U110 (.ZN(U_arb_U_gctrl_n76), 
	.A2(U_arb_U_gctrl_bc_2_), 
	.A1(U_arb_U_gctrl_n79));
   NAND2_X2 U_arb_U_gctrl_U109 (.ZN(U_arb_U_gctrl_n74), 
	.A2(U_arb_U_gctrl_n21), 
	.A1(U_arb_U_gctrl_n76));
   NAND2_X2 U_arb_U_gctrl_U108 (.ZN(U_arb_U_gctrl_n125), 
	.A2(U_arb_U_gctrl_bc_1_), 
	.A1(U_arb_U_gctrl_n100));
   INV_X4 U_arb_U_gctrl_U107 (.ZN(U_arb_U_gctrl_n121), 
	.A(U_arb_U_gctrl_n100));
   NOR4_X2 U_arb_U_gctrl_U106 (.ZN(U_arb_U_gctrl_n123), 
	.A4(U_arb_U_gctrl_n122), 
	.A3(hresp[1]), 
	.A2(U_arb_U_gctrl_n153), 
	.A1(hresp[0]));
   INV_X4 U_arb_U_gctrl_U105 (.ZN(U_arb_U_gctrl_n82), 
	.A(U_arb_U_gctrl_n76));
   NAND3_X2 U_arb_U_gctrl_U104 (.ZN(U_arb_U_gctrl_n129), 
	.A3(U_arb_U_gctrl_n82), 
	.A2(U_arb_U_gctrl_bc_3_), 
	.A1(U_arb_U_gctrl_n100));
   NAND3_X2 U_arb_U_gctrl_U103 (.ZN(U_arb_U_gctrl_n127), 
	.A3(U_arb_U_gctrl_n73), 
	.A2(U_arb_U_gctrl_n71), 
	.A1(U_arb_U_gctrl_n132));
   NAND3_X2 U_arb_U_gctrl_U102 (.ZN(U_arb_U_gctrl_n136), 
	.A3(U_arb_U_gctrl_n127), 
	.A2(U_arb_U_gctrl_n128), 
	.A1(U_arb_U_gctrl_n129));
   NAND2_X2 U_arb_U_gctrl_U101 (.ZN(U_arb_U_gctrl_n134), 
	.A2(U_arb_U_gctrl_n130), 
	.A1(U_arb_ltip));
   OAI211_X2 U_arb_U_gctrl_U100 (.ZN(U_arb_U_gctrl_n139), 
	.C2(U_arb_U_gctrl_n134), 
	.C1(U_arb_U_gctrl_n135), 
	.B(U_arb_U_gctrl_n132), 
	.A(U_arb_U_gctrl_n133));
   NOR3_X2 U_arb_U_gctrl_U99 (.ZN(U_arb_U_gctrl_n138), 
	.A3(U_arb_U_gctrl_n135), 
	.A2(U_arb_U_gctrl_n136), 
	.A1(U_arb_U_gctrl_n137));
   NAND2_X2 U_arb_U_gctrl_U98 (.ZN(U_arb_U_gctrl_n148), 
	.A2(U_arb_grant_2t[1]), 
	.A1(U_arb_U_gctrl_n145));
   AOI21_X2 U_arb_U_gctrl_U97 (.ZN(U_arb_U_gctrl_n150), 
	.B2(U_arb_U_gctrl_n147), 
	.B1(U_arb_U_gctrl_n148), 
	.A(U_arb_U_gctrl_n146));
   INV_X4 U_arb_U_gctrl_U96 (.ZN(U_arb_U_gctrl_n154), 
	.A(U_arb_U_gctrl_n163));
   INV_X4 U_arb_U_gctrl_U95 (.ZN(U_arb_U_gctrl_n72), 
	.A(U_arb_U_gctrl_n127));
   NAND2_X2 U_arb_U_gctrl_U94 (.ZN(U_arb_U_gctrl_n102), 
	.A2(hready), 
	.A1(U_arb_U_gctrl_n72));
   INV_X4 U_arb_U_gctrl_U93 (.ZN(U_arb_U_gctrl_n105), 
	.A(U_arb_U_gctrl_n102));
   NOR3_X2 U_arb_U_gctrl_U92 (.ZN(U_arb_U_gctrl_n104), 
	.A3(U_arb_U_gctrl_n154), 
	.A2(U_arb_U_gctrl_bc_0_), 
	.A1(U_arb_U_gctrl_n121));
   AOI211_X2 U_arb_U_gctrl_U91 (.ZN(U_arb_U_gctrl_n106), 
	.C2(U_arb_U_gctrl_n154), 
	.C1(U_arb_U_gctrl_bc_0_), 
	.B(U_arb_U_gctrl_n104), 
	.A(U_arb_U_gctrl_n105));
   INV_X4 U_arb_U_gctrl_U90 (.ZN(U_arb_U_gctrl_n89), 
	.A(U_arb_U_gctrl_n106));
   NAND2_X2 U_arb_U_gctrl_U89 (.ZN(U_arb_new_tfr), 
	.A2(U_arb_U_gctrl_n18), 
	.A1(htrans[0]));
   AOI22_X2 U_arb_U_gctrl_U88 (.ZN(U_arb_U_gctrl_n103), 
	.B2(U_arb_U_gctrl_bc_0_), 
	.B1(U_arb_U_gctrl_n101), 
	.A2(U_arb_U_gctrl_n20), 
	.A1(U_arb_U_gctrl_n104));
   OAI211_X2 U_arb_U_gctrl_U87 (.ZN(U_arb_U_gctrl_n88), 
	.C2(U_arb_U_gctrl_n20), 
	.C1(U_arb_U_gctrl_n163), 
	.B(U_arb_U_gctrl_n102), 
	.A(U_arb_U_gctrl_n103));
   NOR3_X2 U_arb_U_gctrl_U86 (.ZN(U_arb_U_gctrl_n83), 
	.A3(U_arb_U_gctrl_n82), 
	.A2(U_arb_U_gctrl_n154), 
	.A1(U_arb_U_gctrl_n121));
   OAI21_X2 U_arb_U_gctrl_U85 (.ZN(U_arb_U_gctrl_n87), 
	.B2(U_arb_U_gctrl_n157), 
	.B1(U_arb_U_gctrl_n102), 
	.A(U_arb_U_gctrl_n84));
   NAND3_X2 U_arb_U_gctrl_U84 (.ZN(U_arb_U_gctrl_n77), 
	.A3(hburst[2]), 
	.A2(hburst[1]), 
	.A1(U_arb_U_gctrl_n105));
   OAI211_X2 U_arb_U_gctrl_U83 (.ZN(U_arb_U_gctrl_n86), 
	.C2(U_arb_U_gctrl_n21), 
	.C1(U_arb_U_gctrl_n163), 
	.B(U_arb_U_gctrl_n129), 
	.A(U_arb_U_gctrl_n77));
   NOR2_X2 U_arb_U_gctrl_U82 (.ZN(U_arb_U_gctrl_n165), 
	.A2(U_arb_U_gctrl_nxt_lock_sm_1_), 
	.A1(U_arb_U_gctrl_n166));
   OAI22_X2 U_arb_U_gctrl_U81 (.ZN(U_arb_U_gctrl_n95), 
	.B2(hready), 
	.B1(U_arb_U_gctrl_n15), 
	.A2(U_arb_U_gctrl_n151), 
	.A1(U_arb_U_gctrl_n152));
   AOI21_X2 U_arb_U_gctrl_U80 (.ZN(U_arb_U_gctrl_n143), 
	.B2(U_arb_U_gctrl_wasinn), 
	.B1(hready), 
	.A(U_arb_U_gctrl_n142));
   NOR2_X2 U_arb_U_gctrl_U79 (.ZN(U_arb_U_gctrl_n176), 
	.A2(U_arb_U_gctrl_bbc_1_), 
	.A1(U_arb_U_gctrl_bbc_0_));
   AOI211_X2 U_arb_U_gctrl_U78 (.ZN(U_arb_U_gctrl_n97), 
	.C2(U_arb_U_gctrl_n161), 
	.C1(U_arb_U_gctrl_n163), 
	.B(U_arb_U_gctrl_n159), 
	.A(U_arb_U_gctrl_n160));
   NAND2_X2 U_arb_U_gctrl_U77 (.ZN(U_arb_U_gctrl_n164), 
	.A2(U_arb_U_gctrl_n162), 
	.A1(U_arb_U_gctrl_n163));
   NAND2_X2 U_arb_U_gctrl_U76 (.ZN(U_arb_U_gctrl_n173), 
	.A2(U_arb_U_gctrl_n13), 
	.A1(U_arb_U_gctrl_n176));
   AOI21_X2 U_arb_U_gctrl_U75 (.ZN(U_arb_U_gctrl_n156), 
	.B2(U_arb_U_gctrl_n173), 
	.B1(U_arb_U_gctrl_n155), 
	.A(U_arb_U_gctrl_n154));
   OAI221_X2 U_arb_U_gctrl_U74 (.ZN(U_arb_U_gctrl_n175), 
	.C2(hburst[1]), 
	.C1(htrans[0]), 
	.B2(hburst[2]), 
	.B1(htrans[0]), 
	.A(U_arb_U_gctrl_n174));
   OAI22_X2 U_arb_U_gctrl_U73 (.ZN(U_arb_U_gctrl_n96), 
	.B2(U_arb_U_gctrl_n164), 
	.B1(U_arb_U_gctrl_n175), 
	.A2(U_arb_U_gctrl_n24), 
	.A1(U_arb_U_gctrl_n156));
   NOR2_X2 U_arb_U_gctrl_U72 (.ZN(U_arb_U_gctrl_n178), 
	.A2(U_arb_U_gctrl_n19), 
	.A1(U_arb_U_gctrl_n167));
   OAI22_X2 U_arb_U_gctrl_U71 (.ZN(U_arb_U_gctrl_n99), 
	.B2(U_arb_U_gctrl_n19), 
	.B1(U_arb_U_gctrl_n163), 
	.A2(U_arb_U_gctrl_n178), 
	.A1(U_arb_U_gctrl_n164));
   NOR3_X2 U_arb_U_gctrl_U69 (.ZN(U_arb_U_gctrl_n149), 
	.A3(U_arb_U_gctrl_n138), 
	.A2(U_arb_U_gctrl_n139), 
	.A1(U_arb_U_gctrl_n140));
   NAND3_X2 U_arb_U_gctrl_U67 (.ZN(U_arb_U_gctrl_n132), 
	.A3(U_arb_U_gctrl_n67), 
	.A2(U_arb_U_gctrl_n68), 
	.A1(U_arb_U_gctrl_n69));
   NOR2_X2 U_arb_U_gctrl_U66 (.ZN(U_arb_U_gctrl_n100), 
	.A2(U_arb_U_gctrl_n75), 
	.A1(U_arb_U_gctrl_n81));
   NOR2_X2 U_arb_U_gctrl_U65 (.ZN(U_arb_U_gctrl_n33), 
	.A2(htrans[0]), 
	.A1(n10));
   OAI22_X1 U_arb_U_gctrl_U64 (.ZN(U_arb_U_gctrl_n36), 
	.B2(U_arb_U_gctrl_n10), 
	.B1(U_arb_U_gctrl_n43), 
	.A2(U_arb_U_gctrl_n35), 
	.A1(n10));
   NOR2_X1 U_arb_U_gctrl_U63 (.ZN(U_arb_grant_changed), 
	.A2(U_arb_U_gctrl_n53), 
	.A1(n10));
   OAI21_X1 U_arb_U_gctrl_U62 (.ZN(U_arb_U_gctrl_n63), 
	.B2(U_arb_U_gctrl_n42), 
	.B1(n10), 
	.A(U_arb_U_gctrl_n131));
   NAND2_X1 U_arb_U_gctrl_U61 (.ZN(U_arb_U_gctrl_n73), 
	.A2(hresp[1]), 
	.A1(n10));
   NAND2_X1 U_arb_U_gctrl_U60 (.ZN(U_arb_U_gctrl_n109), 
	.A2(n10), 
	.A1(U_arb_U_gctrl_n108));
   NOR4_X1 U_arb_U_gctrl_U59 (.ZN(U_arb_U_gctrl_n140), 
	.A4(U_arb_U_gctrl_n120), 
	.A3(U_arb_U_gctrl_n125), 
	.A2(U_arb_U_gctrl_n126), 
	.A1(U_arb_U_gctrl_n137));
   AOI211_X1 U_arb_U_gctrl_U58 (.ZN(U_arb_U_gctrl_n84), 
	.C2(U_arb_U_gctrl_n154), 
	.C1(U_arb_U_gctrl_bc_2_), 
	.B(U_arb_U_gctrl_n83), 
	.A(U_arb_U_gctrl_n126));
   NAND2_X1 U_arb_U_gctrl_U56 (.ZN(U_arb_U_gctrl_n28), 
	.A2(U_arb_U_gctrl_n54), 
	.A1(U_arb_U_gctrl_n60));
   NAND2_X1 U_arb_U_gctrl_U55 (.ZN(U_arb_U_gctrl_n43), 
	.A2(U_arb_U_gctrl_n17), 
	.A1(U_arb_U_gctrl_n12));
   XNOR2_X1 U_arb_U_gctrl_U54 (.ZN(U_arb_U_gctrl_n52), 
	.B(U_arb_U_gctrl_hgrant_previous[1]), 
	.A(U_arb_U_gctrl_n14));
   NAND2_X1 U_arb_U_gctrl_U53 (.ZN(U_arb_U_gctrl_n44), 
	.A2(U_arb_U_gctrl_n10), 
	.A1(U_arb_U_gctrl_n43));
   OAI21_X1 U_arb_U_gctrl_U52 (.ZN(U_arb_U_gctrl_n53), 
	.B2(U_arb_U_gctrl_hgrant_previous[0]), 
	.B1(U_arb_U_gctrl_n52), 
	.A(U_arb_U_gctrl_n16));
   INV_X1 U_arb_U_gctrl_U50 (.ZN(U_arb_U_gctrl_n133), 
	.A(U_arb_U_gctrl_n131));
   INV_X1 U_arb_U_gctrl_U49 (.ZN(U_arb_U_gctrl_n116), 
	.A(U_arb_U_gctrl_n179));
   NOR2_X1 U_arb_U_gctrl_U48 (.ZN(U_arb_U_gctrl_n45), 
	.A2(U_arb_U_gctrl_n131), 
	.A1(U_arb_U_gctrl_n44));
   INV_X2 U_arb_U_gctrl_U47 (.ZN(U_arb_U_gctrl_n30), 
	.A(hburst[1]));
   OAI21_X1 U_arb_U_gctrl_U46 (.ZN(U_arb_U_gctrl_n174), 
	.B2(U_arb_U_gctrl_n173), 
	.B1(U_arb_U_gctrl_bbc_3_), 
	.A(htrans[0]));
   NAND2_X1 U_arb_U_gctrl_U45 (.ZN(U_arb_U_gctrl_n168), 
	.A2(U_arb_U_gctrl_n19), 
	.A1(htrans[1]));
   INV_X2 U_arb_U_gctrl_U44 (.ZN(U_arb_U_gctrl_n42), 
	.A(U_arb_U_gctrl_n41));
   INV_X1 U_arb_U_gctrl_U43 (.ZN(U_arb_U_gctrl_n167), 
	.A(htrans[0]));
   NAND2_X1 U_arb_U_gctrl_U42 (.ZN(U_arb_U_gctrl_n158), 
	.A2(U_arb_U_gctrl_n167), 
	.A1(U_arb_U_gctrl_n157));
   NAND2_X1 U_arb_U_gctrl_U41 (.ZN(U_arb_U_gctrl_n170), 
	.A2(U_arb_U_gctrl_n177), 
	.A1(htrans[1]));
   NAND2_X1 U_arb_U_gctrl_U40 (.ZN(U_arb_U_gctrl_n161), 
	.A2(U_arb_U_gctrl_n158), 
	.A1(U_arb_U_gctrl_n162));
   INV_X2 U_arb_U_gctrl_U39 (.ZN(U_arb_U_gctrl_n70), 
	.A(U_arb_U_gctrl_n162));
   INV_X2 U_arb_U_gctrl_U38 (.ZN(U_arb_U_gctrl_n62), 
	.A(U_arb_grant_changed));
   INV_X2 U_arb_U_gctrl_U37 (.ZN(U_arb_U_gctrl_n61), 
	.A(U_arb_U_gctrl_n60));
   OAI21_X1 U_arb_U_gctrl_U35 (.ZN(U_arb_U_gctrl_n85), 
	.B2(hready), 
	.B1(U_arb_U_gctrl_n18), 
	.A(U_arb_U_gctrl_n58));
   INV_X1 U_arb_U_gctrl_U34 (.ZN(U_arb_U_gctrl_n108), 
	.A(U_arb_U_gctrl_n107));
   INV_X2 U_arb_U_gctrl_U33 (.ZN(U_arb_U_gctrl_n48), 
	.A(U_arb_U_gctrl_n47));
   NAND2_X1 U_arb_U_gctrl_U32 (.ZN(U_arb_U_gctrl_n110), 
	.A2(U_arb_def_mst_0_), 
	.A1(U_arb_U_gctrl_n109));
   INV_X2 U_arb_U_gctrl_U31 (.ZN(U_arb_U_gctrl_n152), 
	.A(U_arb_U_gctrl_n165));
   INV_X2 U_arb_U_gctrl_U30 (.ZN(U_arb_U_gctrl_n128), 
	.A(U_arb_U_gctrl_n126));
   INV_X2 U_arb_U_gctrl_U29 (.ZN(U_arb_U_gctrl_n113), 
	.A(U_arb_U_gctrl_n146));
   INV_X2 U_arb_U_gctrl_U28 (.ZN(U_arb_U_gctrl_n101), 
	.A(U_arb_U_gctrl_n125));
   INV_X2 U_arb_U_gctrl_U27 (.ZN(U_arb_U_gctrl_n130), 
	.A(U_arb_U_gctrl_n136));
   INV_X1 U_arb_U_gctrl_U26 (.ZN(U_arb_U_gctrl_n145), 
	.A(U_arb_parked_2t));
   INV_X2 U_arb_U_gctrl_U25 (.ZN(U_arb_U_gctrl_n115), 
	.A(U_arb_U_gctrl_n147));
   NOR2_X1 U_arb_U_gctrl_U24 (.ZN(U_arb_U_gctrl_n179), 
	.A2(U_arb_U_gctrl_lock_sm_1_), 
	.A1(U_arb_U_gctrl_n151));
   INV_X2 U_arb_U_gctrl_U23 (.ZN(U_arb_U_gctrl_n38), 
	.A(U_arb_U_gctrl_n142));
   NAND2_X1 U_arb_U_gctrl_U22 (.ZN(U_arb_U_gctrl_n78), 
	.A2(U_arb_U_gctrl_n74), 
	.A1(htrans[0]));
   NAND2_X1 U_arb_U_gctrl_U21 (.ZN(U_arb_U_gctrl_n153), 
	.A2(htrans[0]), 
	.A1(U_arb_U_gctrl_n162));
   NOR3_X1 U_arb_U_gctrl_U20 (.ZN(U_arb_U_gctrl_n71), 
	.A3(U_arb_U_gctrl_n122), 
	.A2(htrans[0]), 
	.A1(U_arb_U_gctrl_n70));
   INV_X1 U_arb_U_gctrl_U19 (.ZN(U_arb_U_gctrl_n155), 
	.A(U_arb_U_gctrl_n153));
   AOI21_X1 U_arb_U_gctrl_U18 (.ZN(U_arb_U_gctrl_n160), 
	.B2(U_arb_U_gctrl_n177), 
	.B1(U_arb_U_gctrl_n163), 
	.A(U_arb_U_gctrl_bbc_2_));
   INV_X1 U_arb_U_gctrl_U17 (.ZN(U_arb_est), 
	.A(U_arb_U_gctrl_n35));
   OAI22_X1 U_arb_U_gctrl_U16 (.ZN(U_arb_U_gctrl_n98), 
	.B2(U_arb_U_gctrl_n9), 
	.B1(U_arb_U_gctrl_n164), 
	.A2(U_arb_U_gctrl_n23), 
	.A1(U_arb_U_gctrl_n8));
   INV_X1 U_arb_U_gctrl_U15 (.ZN(U_arb_U_gctrl_n9), 
	.A(U_arb_U_gctrl_n177));
   AOI21_X1 U_arb_U_gctrl_U14 (.ZN(U_arb_U_gctrl_n8), 
	.B2(U_arb_U_gctrl_n162), 
	.B1(U_arb_U_gctrl_bbc_0_), 
	.A(U_arb_U_gctrl_n154));
   OAI211_X1 U_arb_U_gctrl_U12 (.ZN(U_arb_U_gctrl_nxt_lock_sm_1_), 
	.C2(U_arb_U_gctrl_n5), 
	.C1(U_arb_U_gctrl_n57), 
	.B(U_arb_U_gctrl_n6), 
	.A(U_arb_U_gctrl_n56));
   INV_X1 U_arb_U_gctrl_U11 (.ZN(U_arb_U_gctrl_n6), 
	.A(U_arb_U_gctrl_n55));
   AOI22_X1 U_arb_U_gctrl_U10 (.ZN(U_arb_U_gctrl_n5), 
	.B2(U_arb_U_gctrl_n26), 
	.B1(U_arb_U_gctrl_n58), 
	.A2(U_arb_U_gctrl_n117), 
	.A1(U_arb_U_gctrl_n54));
   NOR4_X2 U_arb_U_gctrl_U8 (.ZN(U_arb_U_gctrl_n126), 
	.A4(U_arb_U_gctrl_n3), 
	.A3(U_arb_U_gctrl_n80), 
	.A2(U_arb_U_gctrl_n78), 
	.A1(U_arb_U_gctrl_n81));
   NAND2_X1 U_arb_U_gctrl_U7 (.ZN(U_arb_U_gctrl_n3), 
	.A2(U_arb_U_gctrl_bc_2_), 
	.A1(U_arb_U_gctrl_n79));
   OAI21_X1 U_arb_U_gctrl_U6 (.ZN(U_arb_U_gctrl_n146), 
	.B2(U_arb_U_gctrl_n2), 
	.B1(U_arb_U_gctrl_n112), 
	.A(U_arb_U_gctrl_n132));
   NAND2_X1 U_arb_U_gctrl_U5 (.ZN(U_arb_U_gctrl_n2), 
	.A2(n10), 
	.A1(U_arb_U_gctrl_n118));
   NAND3_X2 U_arb_U_gctrl_U4 (.ZN(U_arb_U_gctrl_n135), 
	.A3(U_arb_U_gctrl_n1), 
	.A2(U_arb_U_gctrl_n124), 
	.A1(U_arb_U_gctrl_n125));
   NOR2_X1 U_arb_U_gctrl_U3 (.ZN(U_arb_U_gctrl_n1), 
	.A2(U_arb_U_gctrl_n123), 
	.A1(U_arb_grant_changed));
   DFFR_X2 U_arb_U_gctrl_ihlock_reg (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n18), 
	.D(U_arb_U_gctrl_n85), 
	.CK(hclk));
   DFFR_X2 U_arb_U_gctrl_r_hmaster_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n25), 
	.Q(n4), 
	.D(U_arb_U_gctrl_n93), 
	.CK(hclk));
   DFFS_X2 U_arb_U_gctrl_lock_sm_reg_0_ (.SN(hresetn), 
	.QN(U_arb_U_gctrl_lock_sm_0_), 
	.Q(U_arb_U_gctrl_n17), 
	.D(U_arb_U_gctrl_n166), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_ihmastlock_reg (.RN(hresetn), 
	.Q(hmastlock), 
	.D(U_arb_U_gctrl_n165), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bc_reg_3_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n21), 
	.Q(U_arb_U_gctrl_bc_3_), 
	.D(U_arb_U_gctrl_n86), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bc_reg_2_ (.RN(hresetn), 
	.Q(U_arb_U_gctrl_bc_2_), 
	.D(U_arb_U_gctrl_n87), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bc_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n20), 
	.Q(U_arb_U_gctrl_bc_1_), 
	.D(U_arb_U_gctrl_n88), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bc_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n11), 
	.Q(U_arb_U_gctrl_bc_0_), 
	.D(U_arb_U_gctrl_n89), 
	.CK(hclk));
   DFFS_X2 U_arb_U_gctrl_hgrant_previous_reg_0_ (.SN(hresetn), 
	.Q(U_arb_U_gctrl_hgrant_previous[0]), 
	.D(U_arb_U_gctrl_n181), 
	.CK(hclk));
   DFFS_X2 U_arb_U_gctrl_bus_hgrant_reg_0_ (.SN(hresetn), 
	.QN(U_arb_U_gctrl_n16), 
	.Q(U_arb_U_gctrl_n181), 
	.D(U_arb_U_gctrl_n90), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_r_hmaster_d_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n22), 
	.Q(U_arb_U_gctrl_r_hmaster_d_0_), 
	.D(U_arb_U_gctrl_n91), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_wasinn_reg (.RN(hresetn), 
	.Q(U_arb_U_gctrl_wasinn), 
	.D(U_arb_U_gctrl_n92), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_lock_sm_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n12), 
	.Q(U_arb_U_gctrl_lock_sm_1_), 
	.D(U_arb_U_gctrl_nxt_lock_sm_1_), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_lock_sm_reg_2_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n10), 
	.Q(U_arb_U_gctrl_lock_sm_2_), 
	.D(U_arb_U_gctrl_nxt_lock_sm_2_), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_hgrant_previous_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_hgrant_previous[1]), 
	.D(U_arb_U_gctrl_n14), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bus_hgrant_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n14), 
	.Q(hgrant_m1), 
	.D(U_arb_U_gctrl_n94), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_csilt_reg (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n15), 
	.Q(U_arb_csilt), 
	.D(U_arb_U_gctrl_n95), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bbc_reg_3_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n24), 
	.Q(U_arb_U_gctrl_bbc_3_), 
	.D(U_arb_U_gctrl_n96), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bbc_reg_2_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n13), 
	.Q(U_arb_U_gctrl_bbc_2_), 
	.D(U_arb_U_gctrl_n97), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bbc_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n23), 
	.Q(U_arb_U_gctrl_bbc_1_), 
	.D(U_arb_U_gctrl_n98), 
	.CK(hclk));
   DFFR_X1 U_arb_U_gctrl_bbc_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_gctrl_n19), 
	.Q(U_arb_U_gctrl_bbc_0_), 
	.D(U_arb_U_gctrl_n99), 
	.CK(hclk));
   OAI21_X2 U_arb_U_mask_U19 (.ZN(U_arb_U_mask_n7), 
	.B2(U_arb_U_mask_n12), 
	.B1(U_arb_U_gctrl_n73), 
	.A(U_arb_U_mask_n8));
   NOR4_X2 U_arb_U_mask_U18 (.ZN(U_arb_U_mask_n16), 
	.A4(U_arb_U_mask_r_mask_locked_1_), 
	.A3(U_arb_maskmaster_1_), 
	.A2(U_arb_U_mask_n13), 
	.A1(U_arb_U_mask_n7));
   OAI211_X2 U_arb_U_mask_U17 (.ZN(U_arb_mask_1_), 
	.C2(U_arb_U_gctrl_n73), 
	.C1(U_arb_U_mask_n17), 
	.B(U_arb_U_mask_n15), 
	.A(U_arb_U_mask_n16));
   AOI22_X1 U_arb_U_mask_U14 (.ZN(U_arb_U_mask_n6), 
	.B2(hready), 
	.B1(U_arb_ltip), 
	.A2(U_arb_U_mask_n9), 
	.A1(n10));
   NAND2_X1 U_arb_U_mask_U13 (.ZN(U_arb_U_mask_n12), 
	.A2(hmaster_data[0]), 
	.A1(hresp[0]));
   INV_X1 U_arb_U_mask_U12 (.ZN(U_arb_U_mask_n14), 
	.A(U_arb_U_gctrl_n73));
   NAND3_X1 U_arb_U_mask_U11 (.ZN(U_arb_U_mask_n15), 
	.A3(hmaster_data[0]), 
	.A2(U_arb_U_mask_n14), 
	.A1(U_arb_ltip));
   OAI22_X1 U_arb_U_mask_U9 (.ZN(U_arb_U_mask_n5), 
	.B2(U_arb_U_mask_n4), 
	.B1(U_arb_U_gctrl_n73), 
	.A2(U_arb_U_mask_n10), 
	.A1(U_arb_est));
   NAND2_X1 U_arb_U_mask_U8 (.ZN(U_arb_U_mask_n4), 
	.A2(U_arb_U_mask_n3), 
	.A1(hresp[0]));
   NOR3_X1 U_arb_U_mask_U7 (.ZN(U_arb_U_mask_n3), 
	.A3(U_arb_csilt), 
	.A2(hmaster_data[0]), 
	.A1(U_arb_U_mask_n9));
   AND3_X1 U_arb_U_mask_U6 (.ZN(U_arb_U_mask_n13), 
	.A3(U_arb_U_mask_n2), 
	.A2(U_arb_bus_priority[6]), 
	.A1(U_arb_bus_priority[7]));
   NOR4_X1 U_arb_U_mask_U5 (.ZN(U_arb_U_mask_n2), 
	.A4(U_arb_U_mask_n1), 
	.A3(hmaster_data[0]), 
	.A2(U_arb_U_gctrl_n73), 
	.A1(hresp[0]));
   NAND2_X1 U_arb_U_mask_U4 (.ZN(U_arb_U_mask_n1), 
	.A2(U_arb_bus_priority[4]), 
	.A1(U_arb_bus_priority[5]));
   OR3_X1 U_arb_U_mask_U3 (.ZN(U_arb_U_mask_n17), 
	.A3(hmaster_data[0]), 
	.A2(hresp[0]), 
	.A1(U_arb_ltip));
   DFFR_X2 U_arb_U_mask_extend_ltip_reg (.RN(hresetn), 
	.QN(U_arb_U_mask_n9), 
	.D(U_arb_U_mask_n6), 
	.CK(hclk));
   DFFR_X2 U_arb_U_mask_r_rec_hsplit_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_mask_n8), 
	.D(U_arb_U_mask_n7), 
	.CK(hclk));
   DFFR_X1 U_arb_U_mask_r_mask_locked_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_mask_n10), 
	.Q(U_arb_U_mask_r_mask_locked_1_), 
	.D(U_arb_U_mask_n5), 
	.CK(hclk));
   OAI21_X2 U_arb_U_ebt_U60 (.ZN(U_arb_int_set_ebt), 
	.B2(U_arb_ebten), 
	.B1(U_arb_U_ebt_n18), 
	.A(U_arb_U_ebt_n4));
   AOI21_X2 U_arb_U_ebt_U59 (.ZN(U_arb_U_ebt_n19), 
	.B2(U_arb_U_ebt_int_current_state_0_), 
	.B1(U_arb_U_ebt_int_current_state_1_), 
	.A(U_arb_U_ebt_int_reg_set_ebt));
   AOI22_X2 U_arb_U_ebt_U58 (.ZN(U_arb_U_ebt_n12), 
	.B2(U_arb_U_ebt_n11), 
	.B1(U_arb_ltip), 
	.A2(ahbarbint), 
	.A1(U_arb_clr_arbint));
   NOR2_X2 U_arb_U_ebt_U57 (.ZN(U_arb_U_ebt_n23), 
	.A2(U_arb_ebten), 
	.A1(U_arb_U_ebt_n12));
   NOR2_X2 U_arb_U_ebt_U56 (.ZN(U_arb_U_ebt_n22), 
	.A2(U_arb_U_ebt_int_count_8_), 
	.A1(U_arb_U_ebt_int_count_9_));
   NOR2_X2 U_arb_U_ebt_U55 (.ZN(U_arb_U_ebt_n20), 
	.A2(U_arb_U_ebt_int_count_2_), 
	.A1(U_arb_U_ebt_int_count_3_));
   NOR2_X2 U_arb_U_ebt_U54 (.ZN(U_arb_U_ebt_n56), 
	.A2(U_arb_U_ebt_int_count_1_), 
	.A1(U_arb_U_ebt_int_count_0_));
   NAND2_X2 U_arb_U_ebt_U53 (.ZN(U_arb_U_ebt_n37), 
	.A2(U_arb_U_ebt_n56), 
	.A1(U_arb_U_ebt_n20));
   NOR2_X2 U_arb_U_ebt_U52 (.ZN(U_arb_U_ebt_n40), 
	.A2(U_arb_U_ebt_n37), 
	.A1(U_arb_U_ebt_int_count_4_));
   NOR4_X2 U_arb_U_ebt_U51 (.ZN(U_arb_U_ebt_n21), 
	.A4(U_arb_U_ebt_n39), 
	.A3(U_arb_U_ebt_int_count_5_), 
	.A2(U_arb_U_ebt_int_count_6_), 
	.A1(U_arb_U_ebt_int_count_7_));
   AOI21_X2 U_arb_U_ebt_U50 (.ZN(U_arb_U_ebt_n55), 
	.B2(U_arb_U_ebt_int_current_state_1_), 
	.B1(U_arb_U_ebt_int_current_state_0_), 
	.A(U_arb_new_tfr));
   INV_X4 U_arb_U_ebt_U49 (.ZN(U_arb_U_ebt_n59), 
	.A(U_arb_U_ebt_n55));
   AOI21_X2 U_arb_U_ebt_U48 (.ZN(U_arb_U_ebt_n51), 
	.B2(U_arb_U_ebt_n21), 
	.B1(U_arb_U_ebt_n22), 
	.A(U_arb_U_ebt_n59));
   INV_X4 U_arb_U_ebt_U47 (.ZN(U_arb_U_ebt_n61), 
	.A(U_arb_U_ebt_n51));
   AOI21_X2 U_arb_U_ebt_U46 (.ZN(U_arb_U_ebt_n35), 
	.B2(U_arb_U_ebt_n6), 
	.B1(U_arb_U_ebt_n56), 
	.A(U_arb_U_ebt_n61));
   AOI22_X2 U_arb_U_ebt_U45 (.ZN(U_arb_U_ebt_n36), 
	.B2(U_arb_U_ebt_n59), 
	.B1(U_arb_ebtcount[3]), 
	.A2(U_arb_U_ebt_n35), 
	.A1(U_arb_U_ebt_int_count_3_));
   OAI21_X2 U_arb_U_ebt_U44 (.ZN(U_arb_U_ebt_n26), 
	.B2(U_arb_U_ebt_n61), 
	.B1(U_arb_U_ebt_n37), 
	.A(U_arb_U_ebt_n36));
   NAND2_X2 U_arb_U_ebt_U43 (.ZN(U_arb_U_ebt_n43), 
	.A2(U_arb_U_ebt_n8), 
	.A1(U_arb_U_ebt_n40));
   NOR2_X2 U_arb_U_ebt_U42 (.ZN(U_arb_U_ebt_n46), 
	.A2(U_arb_U_ebt_n43), 
	.A1(U_arb_U_ebt_int_count_6_));
   NAND2_X2 U_arb_U_ebt_U41 (.ZN(U_arb_U_ebt_n52), 
	.A2(U_arb_U_ebt_n7), 
	.A1(U_arb_U_ebt_n46));
   OAI21_X2 U_arb_U_ebt_U40 (.ZN(U_arb_U_ebt_n29), 
	.B2(U_arb_U_ebt_n61), 
	.B1(U_arb_U_ebt_n45), 
	.A(U_arb_U_ebt_n44));
   OAI222_X2 U_arb_U_ebt_U39 (.ZN(U_arb_U_ebt_n38), 
	.C2(U_arb_U_ebt_n55), 
	.C1(U_arb_ebtcount[4]), 
	.B2(U_arb_U_ebt_n37), 
	.B1(U_arb_U_ebt_n59), 
	.A2(U_arb_U_ebt_int_count_4_), 
	.A1(U_arb_U_ebt_n59));
   OAI21_X2 U_arb_U_ebt_U38 (.ZN(U_arb_U_ebt_n27), 
	.B2(U_arb_U_ebt_n61), 
	.B1(U_arb_U_ebt_n39), 
	.A(U_arb_U_ebt_n38));
   AOI21_X2 U_arb_U_ebt_U37 (.ZN(U_arb_U_ebt_n58), 
	.B2(U_arb_U_ebt_int_count_0_), 
	.B1(U_arb_U_ebt_int_count_1_), 
	.A(U_arb_U_ebt_n56));
   OAI21_X2 U_arb_U_ebt_U36 (.ZN(U_arb_U_ebt_n33), 
	.B2(U_arb_U_ebt_n61), 
	.B1(U_arb_U_ebt_n58), 
	.A(U_arb_U_ebt_n57));
   OAI21_X2 U_arb_U_ebt_U35 (.ZN(U_arb_U_ebt_n34), 
	.B2(U_arb_U_ebt_n61), 
	.B1(U_arb_U_ebt_int_count_0_), 
	.A(U_arb_U_ebt_n60));
   OAI21_X2 U_arb_U_ebt_U34 (.ZN(U_arb_U_ebt_n31), 
	.B2(U_arb_U_ebt_n61), 
	.B1(U_arb_U_ebt_n50), 
	.A(U_arb_U_ebt_n49));
   AOI22_X2 U_arb_U_ebt_U33 (.ZN(U_arb_U_ebt_n48), 
	.B2(U_arb_U_ebt_n59), 
	.B1(U_arb_ebtcount[7]), 
	.A2(U_arb_U_ebt_n47), 
	.A1(U_arb_U_ebt_n51));
   INV_X4 U_arb_U_ebt_U32 (.ZN(U_arb_U_ebt_n30), 
	.A(U_arb_U_ebt_n48));
   AOI22_X2 U_arb_U_ebt_U31 (.ZN(U_arb_U_ebt_n42), 
	.B2(U_arb_U_ebt_n59), 
	.B1(U_arb_ebtcount[5]), 
	.A2(U_arb_U_ebt_n41), 
	.A1(U_arb_U_ebt_n51));
   INV_X4 U_arb_U_ebt_U30 (.ZN(U_arb_U_ebt_n28), 
	.A(U_arb_U_ebt_n42));
   AOI221_X2 U_arb_U_ebt_U29 (.ZN(U_arb_U_ebt_next_state[0]), 
	.C2(U_arb_U_ebt_n13), 
	.C1(U_arb_U_ebt_int_current_state_1_), 
	.B2(U_arb_U_ebt_n14), 
	.B1(U_arb_U_ebt_n5), 
	.A(U_arb_ebten));
   NOR4_X2 U_arb_U_ebt_U28 (.ZN(U_arb_U_ebt_n16), 
	.A4(U_arb_U_ebt_n9), 
	.A3(U_arb_U_ebt_int_count_5_), 
	.A2(U_arb_U_ebt_int_count_7_), 
	.A1(U_arb_U_ebt_int_count_4_));
   NOR4_X2 U_arb_U_ebt_U27 (.ZN(U_arb_U_ebt_n15), 
	.A4(U_arb_U_ebt_n5), 
	.A3(U_arb_new_tfr), 
	.A2(U_arb_U_ebt_int_count_6_), 
	.A1(U_arb_U_ebt_int_count_1_));
   NAND4_X2 U_arb_U_ebt_U26 (.ZN(U_arb_U_ebt_n17), 
	.A4(U_arb_U_ebt_n15), 
	.A3(U_arb_U_ebt_n16), 
	.A2(U_arb_U_ebt_n22), 
	.A1(U_arb_U_ebt_n20));
   NOR3_X2 U_arb_U_ebt_U25 (.ZN(U_arb_U_ebt_next_state[1]), 
	.A3(U_arb_U_ebt_n17), 
	.A2(U_arb_ebten), 
	.A1(U_arb_U_ebt_int_current_state_1_));
   NOR3_X2 U_arb_U_ebt_U24 (.ZN(U_arb_U_ebt_n24), 
	.A3(U_arb_ebten), 
	.A2(hready), 
	.A1(U_arb_U_ebt_n19));
   NOR3_X1 U_arb_U_ebt_U23 (.ZN(U_arb_U_ebt_n11), 
	.A3(U_arb_U_ebt_n19), 
	.A2(n10), 
	.A1(U_arb_grant_changed));
   NAND2_X1 U_arb_U_ebt_U21 (.ZN(U_arb_U_ebt_n18), 
	.A2(U_arb_U_ebt_int_current_state_1_), 
	.A1(U_arb_U_ebt_int_current_state_0_));
   INV_X2 U_arb_U_ebt_U19 (.ZN(U_arb_U_ebt_n39), 
	.A(U_arb_U_ebt_n40));
   INV_X1 U_arb_U_ebt_U18 (.ZN(U_arb_U_ebt_n13), 
	.A(U_arb_new_tfr));
   OAI21_X1 U_arb_U_ebt_U17 (.ZN(U_arb_U_ebt_n41), 
	.B2(U_arb_U_ebt_n8), 
	.B1(U_arb_U_ebt_n40), 
	.A(U_arb_U_ebt_n43));
   AOI21_X1 U_arb_U_ebt_U16 (.ZN(U_arb_U_ebt_n45), 
	.B2(U_arb_U_ebt_n43), 
	.B1(U_arb_U_ebt_int_count_6_), 
	.A(U_arb_U_ebt_n46));
   OR2_X2 U_arb_U_ebt_U15 (.ZN(U_arb_U_ebt_n14), 
	.A2(U_arb_U_ebt_n13), 
	.A1(U_arb_U_ebt_int_current_state_1_));
   NAND2_X1 U_arb_U_ebt_U14 (.ZN(U_arb_U_ebt_n44), 
	.A2(U_arb_U_ebt_n59), 
	.A1(U_arb_ebtcount[6]));
   NAND2_X1 U_arb_U_ebt_U13 (.ZN(U_arb_U_ebt_n49), 
	.A2(U_arb_U_ebt_n59), 
	.A1(U_arb_ebtcount[8]));
   NAND2_X1 U_arb_U_ebt_U12 (.ZN(U_arb_U_ebt_n57), 
	.A2(U_arb_U_ebt_n59), 
	.A1(U_arb_ebtcount[1]));
   XOR2_X1 U_arb_U_ebt_U11 (.Z(U_arb_U_ebt_n50), 
	.B(U_arb_U_ebt_int_count_8_), 
	.A(U_arb_U_ebt_n52));
   NAND2_X1 U_arb_U_ebt_U10 (.ZN(U_arb_U_ebt_n60), 
	.A2(U_arb_U_ebt_n59), 
	.A1(U_arb_ebtcount[0]));
   OAI21_X1 U_arb_U_ebt_U9 (.ZN(U_arb_U_ebt_n47), 
	.B2(U_arb_U_ebt_n7), 
	.B1(U_arb_U_ebt_n46), 
	.A(U_arb_U_ebt_n52));
   OAI211_X1 U_arb_U_ebt_U8 (.ZN(U_arb_U_ebt_n53), 
	.C2(U_arb_U_ebt_n52), 
	.C1(U_arb_U_ebt_int_count_8_), 
	.B(U_arb_U_ebt_n51), 
	.A(U_arb_U_ebt_int_count_9_));
   OAI21_X1 U_arb_U_ebt_U7 (.ZN(U_arb_U_ebt_n32), 
	.B2(n23), 
	.B1(U_arb_U_ebt_n55), 
	.A(U_arb_U_ebt_n53));
   INV_X1 U_arb_U_ebt_U6 (.ZN(U_arb_U_ebt_n25), 
	.A(U_arb_U_ebt_n3));
   AOI211_X1 U_arb_U_ebt_U5 (.ZN(U_arb_U_ebt_n3), 
	.C2(U_arb_ebtcount[2]), 
	.C1(U_arb_U_ebt_n59), 
	.B(U_arb_U_ebt_n2), 
	.A(U_arb_U_ebt_n1));
   NOR4_X1 U_arb_U_ebt_U4 (.ZN(U_arb_U_ebt_n2), 
	.A4(U_arb_U_ebt_int_count_2_), 
	.A3(U_arb_U_ebt_n61), 
	.A2(U_arb_U_ebt_int_count_1_), 
	.A1(U_arb_U_ebt_int_count_0_));
   NOR3_X1 U_arb_U_ebt_U3 (.ZN(U_arb_U_ebt_n1), 
	.A3(U_arb_U_ebt_n6), 
	.A2(U_arb_U_ebt_n61), 
	.A1(U_arb_U_ebt_n56));
   DFFR_X1 U_arb_U_ebt_int_ahbarbint_reg (.RN(hresetn), 
	.Q(ahbarbint), 
	.D(U_arb_U_ebt_n23), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_reg_set_ebt_reg (.RN(hresetn), 
	.QN(U_arb_U_ebt_n4), 
	.Q(U_arb_U_ebt_int_reg_set_ebt), 
	.D(U_arb_U_ebt_n24), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_2_ (.RN(hresetn), 
	.QN(U_arb_U_ebt_n6), 
	.Q(U_arb_U_ebt_int_count_2_), 
	.D(U_arb_U_ebt_n25), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_3_ (.RN(hresetn), 
	.Q(U_arb_U_ebt_int_count_3_), 
	.D(U_arb_U_ebt_n26), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_4_ (.RN(hresetn), 
	.Q(U_arb_U_ebt_int_count_4_), 
	.D(U_arb_U_ebt_n27), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_5_ (.RN(hresetn), 
	.QN(U_arb_U_ebt_n8), 
	.Q(U_arb_U_ebt_int_count_5_), 
	.D(U_arb_U_ebt_n28), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_6_ (.RN(hresetn), 
	.Q(U_arb_U_ebt_int_count_6_), 
	.D(U_arb_U_ebt_n29), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_7_ (.RN(hresetn), 
	.QN(U_arb_U_ebt_n7), 
	.Q(U_arb_U_ebt_int_count_7_), 
	.D(U_arb_U_ebt_n30), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_8_ (.RN(hresetn), 
	.Q(U_arb_U_ebt_int_count_8_), 
	.D(U_arb_U_ebt_n31), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_9_ (.RN(hresetn), 
	.Q(U_arb_U_ebt_int_count_9_), 
	.D(U_arb_U_ebt_n32), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_current_state_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_ebt_n5), 
	.Q(U_arb_U_ebt_int_current_state_0_), 
	.D(U_arb_U_ebt_next_state[0]), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_current_state_reg_1_ (.RN(hresetn), 
	.Q(U_arb_U_ebt_int_current_state_1_), 
	.D(U_arb_U_ebt_next_state[1]), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_1_ (.RN(hresetn), 
	.Q(U_arb_U_ebt_int_count_1_), 
	.D(U_arb_U_ebt_n33), 
	.CK(hclk));
   DFFR_X1 U_arb_U_ebt_int_count_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_ebt_n9), 
	.Q(U_arb_U_ebt_int_count_0_), 
	.D(U_arb_U_ebt_n34), 
	.CK(hclk));
   INV_X4 U_arb_U_arbif_U174 (.ZN(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n102));
   MUX2_X2 U_arb_U_arbif_U173 (.Z(U_arb_U_arbif_n143), 
	.S(U_arb_U_arbif_n112), 
	.B(hwdata[0]), 
	.A(U_arb_U_arbif_ebten));
   MUX2_X2 U_arb_U_arbif_U172 (.Z(U_arb_U_arbif_n150), 
	.S(U_arb_U_arbif_n118), 
	.B(hwdata[6]), 
	.A(U_arb_ebtcount[6]));
   MUX2_X2 U_arb_U_arbif_U171 (.Z(U_arb_U_arbif_n149), 
	.S(U_arb_U_arbif_n118), 
	.B(hwdata[5]), 
	.A(U_arb_ebtcount[5]));
   MUX2_X2 U_arb_U_arbif_U170 (.Z(U_arb_U_arbif_n148), 
	.S(U_arb_U_arbif_n118), 
	.B(hwdata[4]), 
	.A(U_arb_ebtcount[4]));
   MUX2_X2 U_arb_U_arbif_U169 (.Z(U_arb_U_arbif_n151), 
	.S(U_arb_U_arbif_n118), 
	.B(hwdata[7]), 
	.A(U_arb_ebtcount[7]));
   MUX2_X2 U_arb_U_arbif_U168 (.Z(U_arb_U_arbif_n152), 
	.S(U_arb_U_arbif_n142), 
	.B(hwdata[8]), 
	.A(U_arb_ebtcount[8]));
   MUX2_X2 U_arb_U_arbif_U167 (.Z(U_arb_U_arbif_n153), 
	.S(U_arb_U_arbif_n142), 
	.B(hwdata[9]), 
	.A(U_arb_ebtcount[9]));
   MUX2_X2 U_arb_U_arbif_U166 (.Z(U_arb_U_arbif_n169), 
	.S(n10), 
	.B(U_arb_U_arbif_r_hmaster_d_0_), 
	.A(n4));
   MUX2_X2 U_arb_U_arbif_U165 (.Z(U_arb_U_arbif_n168), 
	.S(n10), 
	.B(U_arb_U_arbif_r_haddr_d_9_), 
	.A(haddr[9]));
   MUX2_X2 U_arb_U_arbif_U164 (.Z(U_arb_U_arbif_n167), 
	.S(n10), 
	.B(U_arb_U_arbif_r_haddr_d_8_), 
	.A(haddr[8]));
   MUX2_X2 U_arb_U_arbif_U163 (.Z(U_arb_U_arbif_n173), 
	.S(n10), 
	.B(U_arb_U_arbif_r_hsize_d_0_), 
	.A(hsize[0]));
   MUX2_X2 U_arb_U_arbif_U162 (.Z(U_arb_U_arbif_n174), 
	.S(n10), 
	.B(U_arb_U_arbif_r_hsize_d_1_), 
	.A(hsize[1]));
   NOR4_X2 U_arb_U_arbif_U161 (.ZN(U_arb_maskmaster_1_), 
	.A4(U_arb_U_arbif_ipl1[0]), 
	.A3(U_arb_U_arbif_ipl1[3]), 
	.A2(U_arb_U_arbif_ipl1[2]), 
	.A1(U_arb_U_arbif_ipl1[1]));
   AOI22_X2 U_arb_U_arbif_U160 (.ZN(U_arb_U_arbif_n84), 
	.B2(U_arb_U_arbif_n34), 
	.B1(U_arb_U_arbif_r_haddr_d_3_), 
	.A2(haddr[3]), 
	.A1(hready_resp_s0));
   INV_X4 U_arb_U_arbif_U159 (.ZN(U_arb_U_arbif_n194), 
	.A(haddr[5]));
   AOI22_X2 U_arb_U_arbif_U158 (.ZN(U_arb_U_arbif_n63), 
	.B2(U_arb_U_arbif_n34), 
	.B1(U_arb_U_arbif_n6), 
	.A2(U_arb_U_arbif_n194), 
	.A1(hready_resp_s0));
   NOR2_X2 U_arb_U_arbif_U157 (.ZN(U_arb_U_arbif_n107), 
	.A2(U_arb_U_arbif_r_haddr_d_8_), 
	.A1(U_arb_U_arbif_r_haddr_d_9_));
   INV_X4 U_arb_U_arbif_U156 (.ZN(U_arb_U_arbif_n195), 
	.A(haddr[6]));
   NOR4_X2 U_arb_U_arbif_U155 (.ZN(U_arb_U_arbif_n76), 
	.A4(U_arb_U_arbif_n195), 
	.A3(haddr[4]), 
	.A2(haddr[7]), 
	.A1(haddr[5]));
   INV_X4 U_arb_U_arbif_U154 (.ZN(U_arb_U_arbif_n193), 
	.A(haddr[4]));
   INV_X4 U_arb_U_arbif_U153 (.ZN(U_arb_U_arbif_n196), 
	.A(haddr[7]));
   NOR4_X2 U_arb_U_arbif_U152 (.ZN(U_arb_U_arbif_n38), 
	.A4(haddr[6]), 
	.A3(haddr[2]), 
	.A2(haddr[5]), 
	.A1(haddr[3]));
   OAI221_X2 U_arb_U_arbif_U151 (.ZN(U_arb_U_arbif_n39), 
	.C2(haddr[4]), 
	.C1(U_arb_U_arbif_n196), 
	.B2(U_arb_U_arbif_n193), 
	.B1(haddr[7]), 
	.A(U_arb_U_arbif_n38));
   NAND2_X2 U_arb_U_arbif_U150 (.ZN(U_arb_U_arbif_n40), 
	.A2(haddr[2]), 
	.A1(haddr[3]));
   NAND2_X2 U_arb_U_arbif_U149 (.ZN(U_arb_U_arbif_n42), 
	.A2(U_arb_U_arbif_n40), 
	.A1(U_arb_U_arbif_n39));
   NOR4_X2 U_arb_U_arbif_U148 (.ZN(U_arb_U_arbif_n41), 
	.A4(U_arb_U_arbif_n193), 
	.A3(U_arb_U_arbif_n194), 
	.A2(haddr[7]), 
	.A1(haddr[6]));
   OAI22_X2 U_arb_U_arbif_U147 (.ZN(U_arb_U_arbif_n44), 
	.B2(U_arb_U_arbif_n40), 
	.B1(U_arb_U_arbif_n41), 
	.A2(U_arb_U_arbif_n42), 
	.A1(U_arb_U_arbif_n76));
   INV_X4 U_arb_U_arbif_U146 (.ZN(U_arb_U_arbif_n197), 
	.A(hsize[2]));
   NAND2_X2 U_arb_U_arbif_U145 (.ZN(U_arb_U_arbif_n43), 
	.A2(hsize[0]), 
	.A1(hsize[1]));
   NAND2_X2 U_arb_U_arbif_U144 (.ZN(U_arb_U_arbif_n80), 
	.A2(U_arb_U_arbif_n43), 
	.A1(U_arb_U_arbif_n197));
   NOR4_X2 U_arb_U_arbif_U143 (.ZN(U_arb_U_arbif_n56), 
	.A4(U_arb_U_arbif_n80), 
	.A3(haddr[8]), 
	.A2(haddr[9]), 
	.A1(U_arb_U_arbif_n44));
   NAND2_X2 U_arb_U_arbif_U142 (.ZN(U_arb_U_arbif_n55), 
	.A2(U_arb_U_arbif_r_state_0_), 
	.A1(U_arb_U_arbif_r_state_1_));
   OAI21_X2 U_arb_U_arbif_U141 (.ZN(U_arb_U_arbif_N72), 
	.B2(U_arb_U_arbif_n59), 
	.B1(U_arb_U_arbif_n56), 
	.A(U_arb_U_arbif_n55));
   INV_X4 U_arb_U_arbif_U140 (.ZN(U_arb_U_arbif_n198), 
	.A(hwrite));
   INV_X4 U_arb_U_arbif_U139 (.ZN(U_arb_U_arbif_n74), 
	.A(haddr[2]));
   OAI22_X2 U_arb_U_arbif_U138 (.ZN(U_arb_U_arbif_n46), 
	.B2(haddr[1]), 
	.B1(U_arb_U_arbif_n8), 
	.A2(U_arb_U_arbif_r_haddr_d_2_), 
	.A1(U_arb_U_arbif_n74));
   AOI221_X2 U_arb_U_arbif_U137 (.ZN(U_arb_U_arbif_n54), 
	.C2(U_arb_U_arbif_n8), 
	.C1(haddr[1]), 
	.B2(U_arb_U_arbif_r_haddr_d_2_), 
	.B1(U_arb_U_arbif_n74), 
	.A(U_arb_U_arbif_n46));
   AOI22_X2 U_arb_U_arbif_U136 (.ZN(U_arb_U_arbif_n47), 
	.B2(U_arb_U_arbif_n196), 
	.B1(U_arb_U_arbif_r_haddr_d_7_), 
	.A2(U_arb_U_arbif_r_haddr_d_5_), 
	.A1(U_arb_U_arbif_n194));
   OAI221_X2 U_arb_U_arbif_U135 (.ZN(U_arb_U_arbif_n52), 
	.C2(U_arb_U_arbif_r_haddr_d_7_), 
	.C1(U_arb_U_arbif_n196), 
	.B2(U_arb_U_arbif_r_haddr_d_5_), 
	.B1(U_arb_U_arbif_n194), 
	.A(U_arb_U_arbif_n47));
   AOI22_X2 U_arb_U_arbif_U134 (.ZN(U_arb_U_arbif_n48), 
	.B2(U_arb_U_arbif_n14), 
	.B1(haddr[0]), 
	.A2(U_arb_U_arbif_r_haddr_d_4_), 
	.A1(U_arb_U_arbif_n193));
   OAI221_X2 U_arb_U_arbif_U133 (.ZN(U_arb_U_arbif_n51), 
	.C2(haddr[0]), 
	.C1(U_arb_U_arbif_n14), 
	.B2(U_arb_U_arbif_r_haddr_d_4_), 
	.B1(U_arb_U_arbif_n193), 
	.A(U_arb_U_arbif_n48));
   AOI22_X2 U_arb_U_arbif_U132 (.ZN(U_arb_U_arbif_n49), 
	.B2(U_arb_U_arbif_n195), 
	.B1(U_arb_U_arbif_r_haddr_d_6_), 
	.A2(U_arb_U_arbif_r_haddr_d_3_), 
	.A1(U_arb_U_arbif_n192));
   OAI221_X2 U_arb_U_arbif_U131 (.ZN(U_arb_U_arbif_n50), 
	.C2(U_arb_U_arbif_r_haddr_d_6_), 
	.C1(U_arb_U_arbif_n195), 
	.B2(U_arb_U_arbif_r_haddr_d_3_), 
	.B1(U_arb_U_arbif_n192), 
	.A(U_arb_U_arbif_n49));
   NOR3_X2 U_arb_U_arbif_U130 (.ZN(U_arb_U_arbif_n53), 
	.A3(U_arb_U_arbif_n50), 
	.A2(U_arb_U_arbif_n51), 
	.A1(U_arb_U_arbif_n52));
   NAND4_X2 U_arb_U_arbif_U129 (.ZN(U_arb_U_arbif_n57), 
	.A4(U_arb_U_arbif_n53), 
	.A3(U_arb_U_arbif_n54), 
	.A2(U_arb_U_arbif_n107), 
	.A1(U_arb_U_arbif_r_state_1_));
   NAND2_X2 U_arb_U_arbif_U128 (.ZN(U_arb_U_arbif_n58), 
	.A2(U_arb_U_arbif_n57), 
	.A1(U_arb_U_arbif_n198));
   NOR2_X2 U_arb_U_arbif_U127 (.ZN(U_arb_U_arbif_n91), 
	.A2(U_arb_U_arbif_n66), 
	.A1(U_arb_U_arbif_n63));
   AOI22_X2 U_arb_U_arbif_U126 (.ZN(U_arb_U_arbif_n87), 
	.B2(U_arb_U_arbif_n34), 
	.B1(U_arb_U_arbif_r_haddr_d_6_), 
	.A2(haddr[6]), 
	.A1(hready_resp_s0));
   AOI22_X2 U_arb_U_arbif_U125 (.ZN(U_arb_U_arbif_n69), 
	.B2(U_arb_U_arbif_n34), 
	.B1(U_arb_U_arbif_n11), 
	.A2(U_arb_U_arbif_n193), 
	.A1(hready_resp_s0));
   AOI22_X2 U_arb_U_arbif_U124 (.ZN(U_arb_U_arbif_n68), 
	.B2(U_arb_U_arbif_n34), 
	.B1(U_arb_U_arbif_n17), 
	.A2(U_arb_U_arbif_n196), 
	.A1(hready_resp_s0));
   NAND2_X2 U_arb_U_arbif_U123 (.ZN(U_arb_U_arbif_n94), 
	.A2(U_arb_U_arbif_n90), 
	.A1(U_arb_U_arbif_n70));
   NAND4_X2 U_arb_U_arbif_U122 (.ZN(U_arb_U_arbif_n65), 
	.A4(U_arb_U_arbif_n81), 
	.A3(U_arb_U_arbif_n69), 
	.A2(U_arb_U_arbif_n64), 
	.A1(U_arb_U_arbif_n87));
   OAI211_X2 U_arb_U_arbif_U121 (.ZN(U_arb_U_arbif_n121), 
	.C2(U_arb_U_arbif_n94), 
	.C1(U_arb_bus_priority[5]), 
	.B(U_arb_U_arbif_n103), 
	.A(U_arb_U_arbif_n71));
   AOI221_X2 U_arb_U_arbif_U120 (.ZN(U_arb_U_arbif_n86), 
	.C2(U_arb_U_arbif_n82), 
	.C1(U_arb_def_mst_0_), 
	.B2(U_arb_U_arbif_n84), 
	.B1(U_arb_U_arbif_ebten), 
	.A(U_arb_U_arbif_n81));
   OAI211_X2 U_arb_U_arbif_U117 (.ZN(U_arb_U_arbif_n123), 
	.C2(U_arb_bus_priority[7]), 
	.C1(U_arb_U_arbif_n94), 
	.B(U_arb_U_arbif_n103), 
	.A(U_arb_U_arbif_n73));
   OAI21_X2 U_arb_U_arbif_U116 (.ZN(U_arb_U_arbif_n122), 
	.B2(U_arb_bus_priority[6]), 
	.B1(U_arb_U_arbif_n94), 
	.A(U_arb_U_arbif_n72));
   NAND2_X2 U_arb_U_arbif_U115 (.ZN(U_arb_U_arbif_n128), 
	.A2(U_arb_U_arbif_n103), 
	.A1(U_arb_U_arbif_n99));
   AOI21_X2 U_arb_U_arbif_U114 (.ZN(U_arb_U_arbif_n78), 
	.B2(U_arb_clr_arbint), 
	.B1(U_arb_U_arbif_int_ebt), 
	.A(U_arb_int_set_ebt));
   AOI211_X2 U_arb_U_arbif_U113 (.ZN(U_arb_U_arbif_n105), 
	.C2(U_arb_U_arbif_n8), 
	.C1(U_arb_U_arbif_r_hsize_d_0_), 
	.B(U_arb_U_arbif_r_hsize_d_2_), 
	.A(U_arb_U_arbif_r_hsize_d_1_));
   INV_X4 U_arb_U_arbif_U112 (.ZN(U_arb_U_arbif_n119), 
	.A(U_arb_U_arbif_n105));
   AOI21_X2 U_arb_U_arbif_U111 (.ZN(U_arb_U_arbif_n116), 
	.B2(U_arb_U_arbif_n8), 
	.B1(U_arb_U_arbif_n14), 
	.A(U_arb_U_arbif_n119));
   NOR3_X2 U_arb_U_arbif_U110 (.ZN(U_arb_U_arbif_n106), 
	.A3(U_arb_U_arbif_n18), 
	.A2(U_arb_U_arbif_n12), 
	.A1(U_arb_U_arbif_n7));
   NAND3_X2 U_arb_U_arbif_U109 (.ZN(U_arb_U_arbif_n113), 
	.A3(hready), 
	.A2(U_arb_U_arbif_n106), 
	.A1(U_arb_U_arbif_n107));
   NOR4_X2 U_arb_U_arbif_U108 (.ZN(U_arb_U_arbif_n161), 
	.A4(U_arb_U_arbif_n113), 
	.A3(U_arb_U_arbif_n108), 
	.A2(U_arb_U_arbif_n116), 
	.A1(U_arb_U_arbif_r_haddr_d_2_));
   NAND2_X2 U_arb_U_arbif_U107 (.ZN(U_arb_U_arbif_n111), 
	.A2(U_arb_U_arbif_n161), 
	.A1(U_arb_U_arbif_r_haddr_d_6_));
   NOR2_X2 U_arb_U_arbif_U106 (.ZN(U_arb_U_arbif_n112), 
	.A2(U_arb_U_arbif_n111), 
	.A1(U_arb_U_arbif_r_haddr_d_3_));
   NOR3_X2 U_arb_U_arbif_U105 (.ZN(U_arb_U_arbif_n170), 
	.A3(hwdata[3]), 
	.A2(hwdata[2]), 
	.A1(hwdata[1]));
   NAND3_X2 U_arb_U_arbif_U104 (.ZN(U_arb_U_arbif_n185), 
	.A3(U_arb_U_arbif_n19), 
	.A2(U_arb_U_arbif_n13), 
	.A1(U_arb_U_arbif_n161));
   AOI21_X2 U_arb_U_arbif_U103 (.ZN(U_arb_U_arbif_n171), 
	.B2(U_arb_U_arbif_r_hmaster_d_0_), 
	.B1(U_arb_U_arbif_n170), 
	.A(U_arb_U_arbif_n185));
   INV_X4 U_arb_U_arbif_U102 (.ZN(U_arb_U_arbif_n172), 
	.A(hwdata[0]));
   OAI22_X2 U_arb_U_arbif_U101 (.ZN(U_arb_U_arbif_n154), 
	.B2(U_arb_U_arbif_n185), 
	.B1(U_arb_U_arbif_n172), 
	.A2(U_arb_bus_priority[4]), 
	.A1(U_arb_U_arbif_n171));
   NOR4_X2 U_arb_U_arbif_U100 (.ZN(U_arb_U_arbif_n114), 
	.A4(U_arb_U_arbif_n11), 
	.A3(U_arb_U_arbif_n6), 
	.A2(U_arb_U_arbif_r_haddr_d_6_), 
	.A1(U_arb_U_arbif_r_haddr_d_7_));
   NAND4_X2 U_arb_U_arbif_U99 (.ZN(U_arb_U_arbif_n140), 
	.A4(U_arb_U_arbif_n114), 
	.A3(U_arb_U_arbif_n115), 
	.A2(U_arb_U_arbif_r_haddr_d_2_), 
	.A1(U_arb_U_arbif_r_haddr_d_3_));
   AOI21_X2 U_arb_U_arbif_U98 (.ZN(U_arb_U_arbif_n179), 
	.B2(U_arb_U_arbif_n181), 
	.B1(U_arb_U_arbif_n178), 
	.A(U_arb_U_arbif_n185));
   INV_X4 U_arb_U_arbif_U97 (.ZN(U_arb_U_arbif_n180), 
	.A(hwdata[1]));
   OAI22_X2 U_arb_U_arbif_U96 (.ZN(U_arb_U_arbif_n155), 
	.B2(U_arb_U_arbif_n185), 
	.B1(U_arb_U_arbif_n180), 
	.A2(U_arb_bus_priority[5]), 
	.A1(U_arb_U_arbif_n179));
   INV_X4 U_arb_U_arbif_U95 (.ZN(U_arb_U_arbif_n183), 
	.A(hwdata[2]));
   AOI21_X2 U_arb_U_arbif_U94 (.ZN(U_arb_U_arbif_n187), 
	.B2(U_arb_U_arbif_n183), 
	.B1(U_arb_U_arbif_n184), 
	.A(U_arb_U_arbif_n185));
   INV_X4 U_arb_U_arbif_U93 (.ZN(U_arb_U_arbif_n186), 
	.A(hwdata[3]));
   OAI22_X2 U_arb_U_arbif_U92 (.ZN(U_arb_U_arbif_n157), 
	.B2(U_arb_U_arbif_n185), 
	.B1(U_arb_U_arbif_n186), 
	.A2(U_arb_bus_priority[7]), 
	.A1(U_arb_U_arbif_n187));
   AOI21_X2 U_arb_U_arbif_U91 (.ZN(U_arb_U_arbif_n182), 
	.B2(U_arb_U_arbif_n186), 
	.B1(U_arb_U_arbif_n184), 
	.A(U_arb_U_arbif_n185));
   OAI22_X2 U_arb_U_arbif_U90 (.ZN(U_arb_U_arbif_n156), 
	.B2(U_arb_U_arbif_n185), 
	.B1(U_arb_U_arbif_n183), 
	.A2(U_arb_bus_priority[6]), 
	.A1(U_arb_U_arbif_n182));
   NAND2_X2 U_arb_U_arbif_U89 (.ZN(U_arb_U_arbif_n45), 
	.A2(U_arb_U_arbif_n55), 
	.A1(U_arb_U_arbif_n75));
   AOI21_X2 U_arb_U_arbif_U88 (.ZN(U_arb_U_arbif_nxt_state_0_), 
	.B2(U_arb_U_arbif_n56), 
	.B1(hwrite), 
	.A(U_arb_U_arbif_n45));
   AOI21_X2 U_arb_U_arbif_U87 (.ZN(U_arb_U_arbif_n141), 
	.B2(U_arb_U_arbif_n8), 
	.B1(U_arb_U_arbif_r_haddr_d_0_), 
	.A(U_arb_U_arbif_n119));
   NOR2_X2 U_arb_U_arbif_U86 (.ZN(U_arb_U_arbif_n142), 
	.A2(U_arb_U_arbif_n140), 
	.A1(U_arb_U_arbif_n141));
   NOR2_X2 U_arb_U_arbif_U85 (.ZN(U_arb_U_arbif_n110), 
	.A2(U_arb_U_arbif_n111), 
	.A1(U_arb_U_arbif_n13));
   NAND3_X2 U_arb_U_arbif_U84 (.ZN(U_arb_U_arbif_n109), 
	.A3(hwdata[0]), 
	.A2(U_arb_U_arbif_n170), 
	.A1(U_arb_U_arbif_n110));
   OAI21_X2 U_arb_U_arbif_U83 (.ZN(U_arb_U_arbif_n139), 
	.B2(U_arb_U_arbif_n28), 
	.B1(U_arb_U_arbif_n110), 
	.A(U_arb_U_arbif_n109));
   AOI22_X2 U_arb_U_arbif_U82 (.ZN(U_arb_U_arbif_n147), 
	.B2(U_arb_U_arbif_n117), 
	.B1(U_arb_U_arbif_n31), 
	.A2(U_arb_U_arbif_n186), 
	.A1(U_arb_U_arbif_n118));
   AOI22_X2 U_arb_U_arbif_U81 (.ZN(U_arb_U_arbif_n145), 
	.B2(U_arb_U_arbif_n117), 
	.B1(U_arb_U_arbif_n29), 
	.A2(U_arb_U_arbif_n180), 
	.A1(U_arb_U_arbif_n118));
   AOI22_X2 U_arb_U_arbif_U80 (.ZN(U_arb_U_arbif_n146), 
	.B2(U_arb_U_arbif_n117), 
	.B1(U_arb_U_arbif_n30), 
	.A2(U_arb_U_arbif_n183), 
	.A1(U_arb_U_arbif_n118));
   AOI22_X2 U_arb_U_arbif_U79 (.ZN(U_arb_U_arbif_n144), 
	.B2(U_arb_U_arbif_n117), 
	.B1(U_arb_U_arbif_n32), 
	.A2(U_arb_U_arbif_n172), 
	.A1(U_arb_U_arbif_n118));
   AOI21_X2 U_arb_U_arbif_U78 (.ZN(U_arb_U_arbif_nxt_state_1_), 
	.B2(U_arb_U_arbif_n198), 
	.B1(U_arb_U_arbif_n56), 
	.A(U_arb_U_arbif_n45));
   OAI22_X2 U_arb_U_arbif_U77 (.ZN(U_arb_U_arbif_n177), 
	.B2(U_arb_U_arbif_n79), 
	.B1(U_arb_U_arbif_n80), 
	.A2(U_arb_U_arbif_n18), 
	.A1(hready));
   OAI22_X2 U_arb_U_arbif_U75 (.ZN(U_arb_U_arbif_n191), 
	.B2(n10), 
	.B1(haddr[2]), 
	.A2(U_arb_U_arbif_r_haddr_d_2_), 
	.A1(hready));
   NAND2_X2 U_arb_U_arbif_U74 (.ZN(U_arb_U_arbif_n188), 
	.A2(hready), 
	.A1(htrans[1]));
   NOR2_X2 U_arb_U_arbif_U72 (.ZN(U_arb_U_arbif_n118), 
	.A2(U_arb_U_arbif_n140), 
	.A1(U_arb_U_arbif_n116));
   NAND2_X1 U_arb_U_arbif_U71 (.ZN(U_arb_U_arbif_n79), 
	.A2(hsel_s0), 
	.A1(hready));
   AOI22_X2 U_arb_U_arbif_U67 (.ZN(U_arb_U_arbif_n83), 
	.B2(U_arb_U_arbif_n34), 
	.B1(U_arb_U_arbif_r_haddr_d_2_), 
	.A2(haddr[2]), 
	.A1(hready_resp_s0));
   AOI22_X1 U_arb_U_arbif_U66 (.ZN(U_arb_U_arbif_n71), 
	.B2(U_arb_U_arbif_n100), 
	.B1(U_arb_ebtcount[1]), 
	.A2(hrdata_s0[1]), 
	.A1(U_arb_U_arbif_n102));
   AOI22_X1 U_arb_U_arbif_U65 (.ZN(U_arb_U_arbif_n73), 
	.B2(U_arb_ebtcount[3]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[3]), 
	.A1(U_arb_U_arbif_n102));
   NOR2_X1 U_arb_U_arbif_U64 (.ZN(U_arb_U_arbif_n102), 
	.A2(U_arb_U_arbif_n62), 
	.A1(U_arb_U_arbif_N72));
   AOI22_X1 U_arb_U_arbif_U62 (.ZN(U_arb_U_arbif_n72), 
	.B2(U_arb_ebtcount[2]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[2]), 
	.A1(U_arb_U_arbif_n102));
   AOI22_X1 U_arb_U_arbif_U61 (.ZN(U_arb_U_arbif_n96), 
	.B2(U_arb_ebtcount[5]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[5]), 
	.A1(U_arb_U_arbif_n102));
   AOI22_X1 U_arb_U_arbif_U60 (.ZN(U_arb_U_arbif_n99), 
	.B2(U_arb_ebtcount[8]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[8]), 
	.A1(U_arb_U_arbif_n102));
   AOI22_X1 U_arb_U_arbif_U59 (.ZN(U_arb_U_arbif_n97), 
	.B2(U_arb_ebtcount[6]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[6]), 
	.A1(U_arb_U_arbif_n102));
   AOI22_X1 U_arb_U_arbif_U58 (.ZN(U_arb_U_arbif_n95), 
	.B2(U_arb_ebtcount[4]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[4]), 
	.A1(U_arb_U_arbif_n102));
   AOI22_X1 U_arb_U_arbif_U57 (.ZN(U_arb_U_arbif_n98), 
	.B2(U_arb_ebtcount[7]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[7]), 
	.A1(U_arb_U_arbif_n102));
   AOI22_X1 U_arb_U_arbif_U56 (.ZN(U_arb_U_arbif_n101), 
	.B2(U_arb_ebtcount[9]), 
	.B1(U_arb_U_arbif_n100), 
	.A2(hrdata_s0[9]), 
	.A1(U_arb_U_arbif_n102));
   INV_X4 U_arb_U_arbif_U55 (.ZN(U_arb_U_arbif_n5), 
	.A(U_arb_U_arbif_n188));
   NAND2_X2 U_arb_U_arbif_U54 (.ZN(U_arb_U_arbif_n59), 
	.A2(hsel_s0), 
	.A1(U_arb_U_arbif_n5));
   NAND3_X1 U_arb_U_arbif_U53 (.ZN(U_arb_U_arbif_n108), 
	.A3(U_arb_U_arbif_n11), 
	.A2(U_arb_U_arbif_n17), 
	.A1(U_arb_U_arbif_n6));
   NAND3_X1 U_arb_U_arbif_U52 (.ZN(U_arb_U_arbif_n60), 
	.A3(U_arb_U_arbif_n34), 
	.A2(U_arb_U_arbif_r_hsel_arb_d), 
	.A1(U_arb_U_arbif_r_htrans_d_1_));
   NOR2_X1 U_arb_U_arbif_U51 (.ZN(U_arb_U_arbif_n178), 
	.A2(hwdata[3]), 
	.A1(hwdata[2]));
   AND2_X2 U_arb_U_arbif_U50 (.ZN(U_arb_U_arbif_n181), 
	.A2(U_arb_U_arbif_r_hmaster_d_0_), 
	.A1(U_arb_U_arbif_n172));
   INV_X2 U_arb_U_arbif_U49 (.ZN(U_arb_U_arbif_n81), 
	.A(U_arb_U_arbif_n83));
   INV_X1 U_arb_U_arbif_U46 (.ZN(U_arb_U_arbif_n82), 
	.A(U_arb_U_arbif_n84));
   AND2_X2 U_arb_U_arbif_U45 (.ZN(U_arb_U_arbif_n184), 
	.A2(U_arb_U_arbif_n180), 
	.A1(U_arb_U_arbif_n181));
   NOR2_X1 U_arb_U_arbif_U44 (.ZN(U_arb_U_arbif_n90), 
	.A2(U_arb_U_arbif_n68), 
	.A1(U_arb_U_arbif_n69));
   INV_X1 U_arb_U_arbif_U43 (.ZN(U_arb_U_arbif_n64), 
	.A(U_arb_U_arbif_n68));
   INV_X2 U_arb_U_arbif_U42 (.ZN(U_arb_U_arbif_n67), 
	.A(U_arb_U_arbif_n63));
   OAI21_X1 U_arb_U_arbif_U41 (.ZN(U_arb_U_arbif_n158), 
	.B2(U_arb_U_arbif_n12), 
	.B1(hready), 
	.A(U_arb_U_arbif_n188));
   AOI22_X1 U_arb_U_arbif_U40 (.ZN(U_arb_U_arbif_n159), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n189), 
	.A2(U_arb_U_arbif_n14), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U39 (.ZN(U_arb_U_arbif_n160), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n190), 
	.A2(U_arb_U_arbif_n8), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U38 (.ZN(U_arb_U_arbif_n176), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n198), 
	.A2(U_arb_U_arbif_n7), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U37 (.ZN(U_arb_U_arbif_n175), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n197), 
	.A2(U_arb_U_arbif_n33), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U36 (.ZN(U_arb_U_arbif_n162), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n192), 
	.A2(U_arb_U_arbif_n13), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U35 (.ZN(U_arb_U_arbif_n163), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n193), 
	.A2(U_arb_U_arbif_n11), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U34 (.ZN(U_arb_U_arbif_n164), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n194), 
	.A2(U_arb_U_arbif_n6), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U33 (.ZN(U_arb_U_arbif_n166), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n196), 
	.A2(U_arb_U_arbif_n17), 
	.A1(n10));
   AOI22_X1 U_arb_U_arbif_U32 (.ZN(U_arb_U_arbif_n165), 
	.B2(hready), 
	.B1(U_arb_U_arbif_n195), 
	.A2(U_arb_U_arbif_n19), 
	.A1(n10));
   INV_X2 U_arb_U_arbif_U31 (.ZN(U_arb_U_arbif_n127), 
	.A(U_arb_U_arbif_n98));
   INV_X2 U_arb_U_arbif_U30 (.ZN(U_arb_U_arbif_n138), 
	.A(U_arb_U_arbif_n78));
   INV_X2 U_arb_U_arbif_U29 (.ZN(U_arb_U_arbif_n124), 
	.A(U_arb_U_arbif_n95));
   INV_X2 U_arb_U_arbif_U28 (.ZN(U_arb_U_arbif_n126), 
	.A(U_arb_U_arbif_n97));
   INV_X2 U_arb_U_arbif_U27 (.ZN(U_arb_U_arbif_n129), 
	.A(U_arb_U_arbif_n101));
   NAND3_X2 U_arb_U_arbif_U26 (.ZN(U_arb_U_arbif_n103), 
	.A3(U_arb_U_arbif_n68), 
	.A2(U_arb_U_arbif_n69), 
	.A1(U_arb_U_arbif_n70));
   INV_X1 U_arb_U_arbif_U25 (.ZN(U_arb_U_arbif_n189), 
	.A(haddr[0]));
   INV_X1 U_arb_U_arbif_U24 (.ZN(U_arb_U_arbif_n190), 
	.A(haddr[1]));
   INV_X2 U_arb_U_arbif_U23 (.ZN(U_arb_U_arbif_n192), 
	.A(haddr[3]));
   INV_X4 U_arb_U_arbif_U22 (.ZN(U_arb_U_arbif_n115), 
	.A(U_arb_U_arbif_n113));
   INV_X2 U_arb_U_arbif_U21 (.ZN(U_arb_U_arbif_n117), 
	.A(U_arb_U_arbif_n118));
   INV_X2 U_arb_U_arbif_U20 (.ZN(U_arb_U_arbif_n75), 
	.A(U_arb_U_arbif_n59));
   INV_X2 U_arb_U_arbif_U19 (.ZN(U_arb_U_arbif_n61), 
	.A(U_arb_U_arbif_N72));
   OAI21_X1 U_arb_U_arbif_U18 (.ZN(U_arb_U_arbif_n135), 
	.B2(U_arb_U_arbif_n25), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   OAI21_X1 U_arb_U_arbif_U17 (.ZN(U_arb_U_arbif_n137), 
	.B2(U_arb_U_arbif_n27), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   OAI21_X1 U_arb_U_arbif_U16 (.ZN(U_arb_U_arbif_n131), 
	.B2(U_arb_U_arbif_n21), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   OAI21_X1 U_arb_U_arbif_U15 (.ZN(U_arb_U_arbif_n132), 
	.B2(U_arb_U_arbif_n22), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   OAI21_X1 U_arb_U_arbif_U14 (.ZN(U_arb_U_arbif_n133), 
	.B2(U_arb_U_arbif_n23), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   NAND2_X1 U_arb_U_arbif_U13 (.ZN(U_arb_U_arbif_n125), 
	.A2(U_arb_U_arbif_n103), 
	.A1(U_arb_U_arbif_n96));
   OAI21_X1 U_arb_U_arbif_U12 (.ZN(U_arb_U_arbif_n130), 
	.B2(U_arb_U_arbif_n20), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   OAI21_X1 U_arb_U_arbif_U11 (.ZN(U_arb_U_arbif_n136), 
	.B2(U_arb_U_arbif_n26), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   OAI21_X1 U_arb_U_arbif_U10 (.ZN(U_arb_U_arbif_n134), 
	.B2(U_arb_U_arbif_n24), 
	.B1(U_arb_U_arbif_n104), 
	.A(U_arb_U_arbif_n103));
   NAND2_X1 U_arb_U_arbif_U9 (.ZN(U_arb_U_arbif_n215), 
	.A2(U_arb_U_arbif_nxt_state_0_), 
	.A1(U_arb_U_arbif_n3));
   NAND2_X1 U_arb_U_arbif_U8 (.ZN(U_arb_U_arbif_n3), 
	.A2(U_arb_U_arbif_n56), 
	.A1(U_arb_U_arbif_n57));
   NAND4_X1 U_arb_U_arbif_U7 (.ZN(U_arb_clr_arbint), 
	.A4(U_arb_U_arbif_n2), 
	.A3(U_arb_U_arbif_n75), 
	.A2(U_arb_U_arbif_n1), 
	.A1(U_arb_U_arbif_n76));
   NOR3_X1 U_arb_U_arbif_U6 (.ZN(U_arb_U_arbif_n2), 
	.A3(haddr[8]), 
	.A2(haddr[9]), 
	.A1(haddr[0]));
   NOR4_X1 U_arb_U_arbif_U5 (.ZN(U_arb_U_arbif_n1), 
	.A4(hwrite), 
	.A3(haddr[1]), 
	.A2(U_arb_U_arbif_n74), 
	.A1(haddr[3]));
   AND4_X1 U_arb_U_arbif_U4 (.ZN(U_arb_U_arbif_n70), 
	.A4(U_arb_U_arbif_n87), 
	.A3(U_arb_U_arbif_n83), 
	.A2(U_arb_U_arbif_n84), 
	.A1(U_arb_U_arbif_n91));
   OAI22_X1 U_arb_U_arbif_U3 (.ZN(U_arb_U_arbif_n62), 
	.B2(U_arb_U_arbif_n60), 
	.B1(U_arb_U_arbif_r_hwrite_d), 
	.A2(U_arb_U_arbif_n58), 
	.A1(U_arb_U_arbif_n59));
   DFFS_X2 U_arb_U_arbif_r_haddr_d_reg_2_ (.SN(hresetn), 
	.QN(U_arb_U_arbif_r_haddr_d_2_), 
	.D(U_arb_U_arbif_n191), 
	.CK(hclk));
   DFFS_X2 U_arb_U_arbif_r_hready_resp_s0_reg (.SN(hresetn), 
	.QN(U_arb_U_arbif_n34), 
	.Q(hready_resp_s0), 
	.D(U_arb_U_arbif_n215), 
	.CK(hclk));
   DFFR_X2 U_arb_U_arbif_r_haddr_d_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n8), 
	.D(U_arb_U_arbif_n160), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_0_ (.RN(hresetn), 
	.Q(hrdata_s0[0]), 
	.D(U_arb_U_arbif_n120), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_1_ (.RN(hresetn), 
	.Q(hrdata_s0[1]), 
	.D(U_arb_U_arbif_n121), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_2_ (.RN(hresetn), 
	.Q(hrdata_s0[2]), 
	.D(U_arb_U_arbif_n122), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_3_ (.RN(hresetn), 
	.Q(hrdata_s0[3]), 
	.D(U_arb_U_arbif_n123), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_4_ (.RN(hresetn), 
	.Q(hrdata_s0[4]), 
	.D(U_arb_U_arbif_n124), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_5_ (.RN(hresetn), 
	.Q(hrdata_s0[5]), 
	.D(U_arb_U_arbif_n125), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_6_ (.RN(hresetn), 
	.Q(hrdata_s0[6]), 
	.D(U_arb_U_arbif_n126), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_7_ (.RN(hresetn), 
	.Q(hrdata_s0[7]), 
	.D(U_arb_U_arbif_n127), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_8_ (.RN(hresetn), 
	.Q(hrdata_s0[8]), 
	.D(U_arb_U_arbif_n128), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_9_ (.RN(hresetn), 
	.Q(hrdata_s0[9]), 
	.D(U_arb_U_arbif_n129), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_11_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n20), 
	.Q(hrdata_s0[11]), 
	.D(U_arb_U_arbif_n130), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_12_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n21), 
	.Q(hrdata_s0[12]), 
	.D(U_arb_U_arbif_n131), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_13_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n22), 
	.Q(hrdata_s0[13]), 
	.D(U_arb_U_arbif_n132), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_20_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n23), 
	.Q(hrdata_s0[20]), 
	.D(U_arb_U_arbif_n133), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_21_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n24), 
	.Q(hrdata_s0[21]), 
	.D(U_arb_U_arbif_n134), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_25_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n25), 
	.Q(hrdata_s0[25]), 
	.D(U_arb_U_arbif_n135), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_28_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n26), 
	.Q(hrdata_s0[28]), 
	.D(U_arb_U_arbif_n136), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_29_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n27), 
	.Q(hrdata_s0[29]), 
	.D(U_arb_U_arbif_n137), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_int_ebt_reg (.RN(hresetn), 
	.Q(U_arb_U_arbif_int_ebt), 
	.D(U_arb_U_arbif_n138), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_idef_mst_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n28), 
	.Q(U_arb_def_mst_0_), 
	.D(U_arb_U_arbif_n139), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebten_reg (.RN(hresetn), 
	.QN(U_arb_ebten), 
	.Q(U_arb_U_arbif_ebten), 
	.D(U_arb_U_arbif_n143), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n32), 
	.Q(U_arb_ebtcount[0]), 
	.D(U_arb_U_arbif_n144), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n29), 
	.Q(U_arb_ebtcount[1]), 
	.D(U_arb_U_arbif_n145), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_2_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n30), 
	.Q(U_arb_ebtcount[2]), 
	.D(U_arb_U_arbif_n146), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_3_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n31), 
	.Q(U_arb_ebtcount[3]), 
	.D(U_arb_U_arbif_n147), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_4_ (.RN(hresetn), 
	.Q(U_arb_ebtcount[4]), 
	.D(U_arb_U_arbif_n148), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_5_ (.RN(hresetn), 
	.Q(U_arb_ebtcount[5]), 
	.D(U_arb_U_arbif_n149), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_6_ (.RN(hresetn), 
	.Q(U_arb_ebtcount[6]), 
	.D(U_arb_U_arbif_n150), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_7_ (.RN(hresetn), 
	.Q(U_arb_ebtcount[7]), 
	.D(U_arb_U_arbif_n151), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_8_ (.RN(hresetn), 
	.Q(U_arb_ebtcount[8]), 
	.D(U_arb_U_arbif_n152), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_iebtcount_reg_9_ (.RN(hresetn), 
	.QN(n23), 
	.Q(U_arb_ebtcount[9]), 
	.D(U_arb_U_arbif_n153), 
	.CK(hclk));
   DFFS_X2 U_arb_U_arbif_ipl1_reg_0_ (.SN(hresetn), 
	.QN(U_arb_bus_priority[4]), 
	.Q(U_arb_U_arbif_ipl1[0]), 
	.D(U_arb_U_arbif_n154), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ipl1_reg_1_ (.RN(hresetn), 
	.QN(U_arb_bus_priority[5]), 
	.Q(U_arb_U_arbif_ipl1[1]), 
	.D(U_arb_U_arbif_n155), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ipl1_reg_2_ (.RN(hresetn), 
	.QN(U_arb_bus_priority[6]), 
	.Q(U_arb_U_arbif_ipl1[2]), 
	.D(U_arb_U_arbif_n156), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_ipl1_reg_3_ (.RN(hresetn), 
	.QN(U_arb_bus_priority[7]), 
	.Q(U_arb_U_arbif_ipl1[3]), 
	.D(U_arb_U_arbif_n157), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_hresp_s0_reg_0_ (.RN(hresetn), 
	.Q(hresp_s0[0]), 
	.D(U_arb_U_arbif_N72), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_state_reg_1_ (.RN(hresetn), 
	.Q(U_arb_U_arbif_r_state_1_), 
	.D(U_arb_U_arbif_nxt_state_1_), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_state_reg_0_ (.RN(hresetn), 
	.Q(U_arb_U_arbif_r_state_0_), 
	.D(U_arb_U_arbif_nxt_state_0_), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_htrans_d_reg_1_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n12), 
	.Q(U_arb_U_arbif_r_htrans_d_1_), 
	.D(U_arb_U_arbif_n158), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_0_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n14), 
	.Q(U_arb_U_arbif_r_haddr_d_0_), 
	.D(U_arb_U_arbif_n159), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_3_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n13), 
	.Q(U_arb_U_arbif_r_haddr_d_3_), 
	.D(U_arb_U_arbif_n162), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_4_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n11), 
	.Q(U_arb_U_arbif_r_haddr_d_4_), 
	.D(U_arb_U_arbif_n163), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_5_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n6), 
	.Q(U_arb_U_arbif_r_haddr_d_5_), 
	.D(U_arb_U_arbif_n164), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_6_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n19), 
	.Q(U_arb_U_arbif_r_haddr_d_6_), 
	.D(U_arb_U_arbif_n165), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_7_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n17), 
	.Q(U_arb_U_arbif_r_haddr_d_7_), 
	.D(U_arb_U_arbif_n166), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_8_ (.RN(hresetn), 
	.Q(U_arb_U_arbif_r_haddr_d_8_), 
	.D(U_arb_U_arbif_n167), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_9_ (.RN(hresetn), 
	.Q(U_arb_U_arbif_r_haddr_d_9_), 
	.D(U_arb_U_arbif_n168), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_hmaster_d_reg_0_ (.RN(hresetn), 
	.Q(U_arb_U_arbif_r_hmaster_d_0_), 
	.D(U_arb_U_arbif_n169), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_hsize_d_reg_0_ (.RN(hresetn), 
	.Q(U_arb_U_arbif_r_hsize_d_0_), 
	.D(U_arb_U_arbif_n173), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_hsize_d_reg_1_ (.RN(hresetn), 
	.Q(U_arb_U_arbif_r_hsize_d_1_), 
	.D(U_arb_U_arbif_n174), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_hsize_d_reg_2_ (.RN(hresetn), 
	.QN(U_arb_U_arbif_n33), 
	.Q(U_arb_U_arbif_r_hsize_d_2_), 
	.D(U_arb_U_arbif_n175), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_hwrite_d_reg (.RN(hresetn), 
	.QN(U_arb_U_arbif_n7), 
	.Q(U_arb_U_arbif_r_hwrite_d), 
	.D(U_arb_U_arbif_n176), 
	.CK(hclk));
   DFFR_X1 U_arb_U_arbif_r_hsel_arb_d_reg (.RN(hresetn), 
	.QN(U_arb_U_arbif_n18), 
	.Q(U_arb_U_arbif_r_hsel_arb_d), 
	.D(U_arb_U_arbif_n177), 
	.CK(hclk));
   OR2_X1 U3 (.ZN(U_dcdr_n11), 
	.A2(haddr[21]), 
	.A1(haddr[22]));
   OAI21_X2 U7 (.ZN(U_arb_U_gctrl_n59), 
	.B2(U_arb_U_gctrl_n54), 
	.B1(U_arb_U_gctrl_n57), 
	.A(U_arb_U_gctrl_n56));
   NAND3_X1 U8 (.ZN(n12), 
	.A3(U_arb_U_mask_n14), 
	.A2(U_arb_U_mask_n12), 
	.A1(U_arb_U_mask_n17));
   AND3_X1 U9 (.ZN(U_arb_grant_2t[0]), 
	.A3(n12), 
	.A2(U_arb_U_gctrl_n171), 
	.A1(U_arb_U_gctrl_n25));
   NOR3_X1 U10 (.ZN(n13), 
	.A3(haddr[13]), 
	.A2(haddr[15]), 
	.A1(haddr[14]));
   INV_X1 U11 (.ZN(n14), 
	.A(haddr[20]));
   NOR4_X2 U12 (.ZN(n15), 
	.A4(n14), 
	.A3(U_dcdr_n15), 
	.A2(haddr[23]), 
	.A1(U_dcdr_n11));
   AND4_X1 U13 (.ZN(U_dcdr_n16), 
	.A4(n15), 
	.A3(U_dcdr_n12), 
	.A2(n13), 
	.A1(U_dcdr_n13));
   OAI21_X1 U14 (.ZN(n16), 
	.B2(U_arb_U_gctrl_r_hmaster_d_0_), 
	.B1(U_arb_U_gctrl_n25), 
	.A(hresp[1]));
   AOI211_X1 U15 (.ZN(n17), 
	.C2(U_arb_U_gctrl_r_hmaster_d_0_), 
	.C1(U_arb_U_gctrl_n25), 
	.B(n16), 
	.A(U_arb_U_gctrl_n15));
   NOR2_X1 U16 (.ZN(U_arb_U_gctrl_n60), 
	.A2(U_arb_U_gctrl_n57), 
	.A1(n17));
   NOR4_X1 U18 (.ZN(U_dfltslv_n5), 
	.A4(U_arb_U_gctrl_n122), 
	.A3(hsel_s2), 
	.A2(U_dcdr_n16), 
	.A1(n10));
   AOI22_X1 U19 (.ZN(n19), 
	.B2(U_arb_U_arbif_n102), 
	.B1(hrdata_s0[0]), 
	.A2(U_arb_U_arbif_n100), 
	.A1(U_arb_ebtcount[0]));
   AOI21_X1 U20 (.ZN(n20), 
	.B2(U_arb_U_arbif_n84), 
	.B1(U_arb_U_arbif_int_ebt), 
	.A(U_arb_U_arbif_n83));
   NOR3_X1 U21 (.ZN(n21), 
	.A3(n20), 
	.A2(U_arb_U_arbif_n86), 
	.A1(U_arb_U_arbif_n87));
   NAND3_X1 U22 (.ZN(n22), 
	.A3(n21), 
	.A2(U_arb_U_arbif_n91), 
	.A1(U_arb_U_arbif_n90));
   OAI211_X1 U23 (.ZN(U_arb_U_arbif_n120), 
	.C2(U_arb_U_arbif_n94), 
	.C1(U_arb_bus_priority[4]), 
	.B(n22), 
	.A(n19));
   OAI211_X2 U24 (.ZN(U_arb_U_arbif_n66), 
	.C2(U_arb_U_arbif_n107), 
	.C1(hready_resp_s0), 
	.B(U_arb_U_arbif_n62), 
	.A(U_arb_U_arbif_n61));
   NOR2_X2 U25 (.ZN(U_mux_n53), 
	.A2(U_mux_n2), 
	.A1(U_mux_n14));
   NOR4_X2 U26 (.ZN(U_arb_U_arbif_n100), 
	.A4(U_arb_U_arbif_n65), 
	.A3(U_arb_U_arbif_n66), 
	.A2(U_arb_U_arbif_n67), 
	.A1(U_arb_U_arbif_n84));
   OAI21_X2 U27 (.ZN(U_arb_U_gctrl_nxt_lock_sm_2_), 
	.B2(U_arb_U_gctrl_n107), 
	.B1(U_arb_U_gctrl_n47), 
	.A(U_arb_U_gctrl_n37));
   INV_X4 U28 (.ZN(n10), 
	.A(U_mux_n58));
   NOR2_X2 U29 (.ZN(U_arb_U_gctrl_n54), 
	.A2(U_arb_U_gctrl_n33), 
	.A1(U_arb_U_gctrl_n163));
   NOR2_X2 U30 (.ZN(U_arb_U_gctrl_n163), 
	.A2(U_arb_U_gctrl_n122), 
	.A1(n10));
endmodule

