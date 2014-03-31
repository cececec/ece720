
module i_ahb_DW_ahb ( hclk, hresetn, haddr_m1, hburst_m1, hbusreq_m1, hlock_m1, 
        hprot_m1, hsize_m1, htrans_m1, hwdata_m1, hwrite_m1, hgrant_m1, 
        hsel_s0, hready_resp_s0, hresp_s0, hrdata_s0, hsel_s1, hready_resp_s1, 
        hresp_s1, hrdata_s1, hsel_s2, hready_resp_s2, hresp_s2, hrdata_s2, 
        haddr, hburst, hprot, hsize, htrans, hwdata, hwrite, hready, hresp, 
        hrdata, ahbarbint, hmaster, hmaster_data, hmastlock );
  input [31:0] haddr_m1;
  input [2:0] hburst_m1;
  input [3:0] hprot_m1;
  input [2:0] hsize_m1;
  input [1:0] htrans_m1;
  input [31:0] hwdata_m1;
  output [1:0] hresp_s0;
  output [31:0] hrdata_s0;
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
  input hclk, hresetn, hbusreq_m1, hlock_m1, hwrite_m1, hready_resp_s1,
         hready_resp_s2;
  output hgrant_m1, hsel_s0, hready_resp_s0, hsel_s1, hsel_s2, hwrite, hready,
         ahbarbint, hmastlock;
  wire   n10, n4, hresp_none_0_, U_mux_n58, U_mux_n57, U_mux_n56, U_mux_n55,
         U_mux_n54, U_mux_n53, U_mux_n52, U_mux_n51, U_mux_n50, U_mux_n49,
         U_mux_n48, U_mux_n47, U_mux_n46, U_mux_n45, U_mux_n44, U_mux_n43,
         U_mux_n42, U_mux_n41, U_mux_n40, U_mux_n39, U_mux_n38, U_mux_n37,
         U_mux_n36, U_mux_n35, U_mux_n34, U_mux_n33, U_mux_n32, U_mux_n31,
         U_mux_n30, U_mux_n29, U_mux_n28, U_mux_n27, U_mux_n26, U_mux_n25,
         U_mux_n24, U_mux_n23, U_mux_n22, U_mux_n21, U_mux_n20, U_mux_n19,
         U_mux_n18, U_mux_n17, U_mux_n16, U_mux_n15, U_mux_n14, U_mux_n12,
         U_mux_n4, U_mux_n3, U_mux_n2, U_mux_n10, U_mux_n9, U_mux_n8, U_mux_n7,
         U_mux_hsel_prev_0_, U_mux_hsel_prev_1_, U_mux_hsel_prev_2_,
         U_dcdr_n16, U_dcdr_n15, U_dcdr_n14, U_dcdr_n13, U_dcdr_n12,
         U_dcdr_n11, U_dcdr_n10, U_dcdr_n6, U_dcdr_n5, U_arb_ibus_hbusreq_1_,
         U_arb_parked_2t, U_arb_mask_1_, U_arb_est, U_arb_csilt,
         U_arb_int_set_ebt, U_arb_ltip, U_arb_grant_changed, U_arb_new_tfr,
         U_arb_maskmaster_1_, U_arb_def_mst_0_, U_arb_ebten, U_arb_clr_arbint,
         U_dfltslv_n5, U_dfltslv_n3, U_dfltslv_n1, U_dfltslv_N4,
         U_dfltslv_current_state, U_arb_U_gctrl_n179, U_arb_U_gctrl_n178,
         U_arb_U_gctrl_n177, U_arb_U_gctrl_n176, U_arb_U_gctrl_n175,
         U_arb_U_gctrl_n174, U_arb_U_gctrl_n173, U_arb_U_gctrl_n171,
         U_arb_U_gctrl_n170, U_arb_U_gctrl_n169, U_arb_U_gctrl_n168,
         U_arb_U_gctrl_n167, U_arb_U_gctrl_n166, U_arb_U_gctrl_n165,
         U_arb_U_gctrl_n164, U_arb_U_gctrl_n163, U_arb_U_gctrl_n162,
         U_arb_U_gctrl_n161, U_arb_U_gctrl_n160, U_arb_U_gctrl_n159,
         U_arb_U_gctrl_n158, U_arb_U_gctrl_n157, U_arb_U_gctrl_n156,
         U_arb_U_gctrl_n155, U_arb_U_gctrl_n154, U_arb_U_gctrl_n153,
         U_arb_U_gctrl_n152, U_arb_U_gctrl_n151, U_arb_U_gctrl_n150,
         U_arb_U_gctrl_n149, U_arb_U_gctrl_n148, U_arb_U_gctrl_n147,
         U_arb_U_gctrl_n146, U_arb_U_gctrl_n145, U_arb_U_gctrl_n144,
         U_arb_U_gctrl_n143, U_arb_U_gctrl_n142, U_arb_U_gctrl_n141,
         U_arb_U_gctrl_n140, U_arb_U_gctrl_n139, U_arb_U_gctrl_n138,
         U_arb_U_gctrl_n137, U_arb_U_gctrl_n136, U_arb_U_gctrl_n135,
         U_arb_U_gctrl_n134, U_arb_U_gctrl_n133, U_arb_U_gctrl_n132,
         U_arb_U_gctrl_n131, U_arb_U_gctrl_n130, U_arb_U_gctrl_n129,
         U_arb_U_gctrl_n128, U_arb_U_gctrl_n127, U_arb_U_gctrl_n126,
         U_arb_U_gctrl_n125, U_arb_U_gctrl_n124, U_arb_U_gctrl_n123,
         U_arb_U_gctrl_n122, U_arb_U_gctrl_n121, U_arb_U_gctrl_n120,
         U_arb_U_gctrl_n119, U_arb_U_gctrl_n118, U_arb_U_gctrl_n117,
         U_arb_U_gctrl_n116, U_arb_U_gctrl_n115, U_arb_U_gctrl_n114,
         U_arb_U_gctrl_n113, U_arb_U_gctrl_n112, U_arb_U_gctrl_n111,
         U_arb_U_gctrl_n110, U_arb_U_gctrl_n109, U_arb_U_gctrl_n108,
         U_arb_U_gctrl_n107, U_arb_U_gctrl_n106, U_arb_U_gctrl_n105,
         U_arb_U_gctrl_n104, U_arb_U_gctrl_n103, U_arb_U_gctrl_n102,
         U_arb_U_gctrl_n101, U_arb_U_gctrl_n100, U_arb_U_gctrl_n84,
         U_arb_U_gctrl_n83, U_arb_U_gctrl_n82, U_arb_U_gctrl_n81,
         U_arb_U_gctrl_n80, U_arb_U_gctrl_n79, U_arb_U_gctrl_n78,
         U_arb_U_gctrl_n77, U_arb_U_gctrl_n76, U_arb_U_gctrl_n75,
         U_arb_U_gctrl_n74, U_arb_U_gctrl_n73, U_arb_U_gctrl_n72,
         U_arb_U_gctrl_n71, U_arb_U_gctrl_n70, U_arb_U_gctrl_n69,
         U_arb_U_gctrl_n68, U_arb_U_gctrl_n67, U_arb_U_gctrl_n66,
         U_arb_U_gctrl_n65, U_arb_U_gctrl_n64, U_arb_U_gctrl_n63,
         U_arb_U_gctrl_n62, U_arb_U_gctrl_n61, U_arb_U_gctrl_n60,
         U_arb_U_gctrl_n59, U_arb_U_gctrl_n58, U_arb_U_gctrl_n57,
         U_arb_U_gctrl_n56, U_arb_U_gctrl_n55, U_arb_U_gctrl_n54,
         U_arb_U_gctrl_n53, U_arb_U_gctrl_n52, U_arb_U_gctrl_n51,
         U_arb_U_gctrl_n48, U_arb_U_gctrl_n47, U_arb_U_gctrl_n46,
         U_arb_U_gctrl_n45, U_arb_U_gctrl_n44, U_arb_U_gctrl_n43,
         U_arb_U_gctrl_n42, U_arb_U_gctrl_n41, U_arb_U_gctrl_n38,
         U_arb_U_gctrl_n37, U_arb_U_gctrl_n36, U_arb_U_gctrl_n35,
         U_arb_U_gctrl_n34, U_arb_U_gctrl_n33, U_arb_U_gctrl_n32,
         U_arb_U_gctrl_n31, U_arb_U_gctrl_n30, U_arb_U_gctrl_n28,
         U_arb_U_gctrl_n27, U_arb_U_gctrl_n26, U_arb_U_gctrl_n25,
         U_arb_U_gctrl_n24, U_arb_U_gctrl_n23, U_arb_U_gctrl_n22,
         U_arb_U_gctrl_n21, U_arb_U_gctrl_n20, U_arb_U_gctrl_n19,
         U_arb_U_gctrl_n18, U_arb_U_gctrl_n17, U_arb_U_gctrl_n16,
         U_arb_U_gctrl_n15, U_arb_U_gctrl_n14, U_arb_U_gctrl_n13,
         U_arb_U_gctrl_n12, U_arb_U_gctrl_n11, U_arb_U_gctrl_n10,
         U_arb_U_gctrl_n9, U_arb_U_gctrl_n8, U_arb_U_gctrl_n6,
         U_arb_U_gctrl_n5, U_arb_U_gctrl_n3, U_arb_U_gctrl_n2,
         U_arb_U_gctrl_n1, U_arb_U_gctrl_n99, U_arb_U_gctrl_n98,
         U_arb_U_gctrl_n97, U_arb_U_gctrl_n96, U_arb_U_gctrl_n95,
         U_arb_U_gctrl_n94, U_arb_U_gctrl_n93, U_arb_U_gctrl_n92,
         U_arb_U_gctrl_n91, U_arb_U_gctrl_n90, U_arb_U_gctrl_n89,
         U_arb_U_gctrl_n88, U_arb_U_gctrl_n87, U_arb_U_gctrl_n86,
         U_arb_U_gctrl_n85, U_arb_U_gctrl_r_hmaster_d_0_, U_arb_U_gctrl_wasinn,
         U_arb_U_gctrl_nxt_lock_sm_1_, U_arb_U_gctrl_nxt_lock_sm_2_,
         U_arb_U_gctrl_lock_sm_0_, U_arb_U_gctrl_lock_sm_1_,
         U_arb_U_gctrl_lock_sm_2_, U_arb_U_gctrl_bbc_0_, U_arb_U_gctrl_bbc_1_,
         U_arb_U_gctrl_bbc_2_, U_arb_U_gctrl_bbc_3_, U_arb_U_gctrl_bc_0_,
         U_arb_U_gctrl_bc_1_, U_arb_U_gctrl_bc_2_, U_arb_U_gctrl_bc_3_,
         U_arb_U_gctrl_n181, U_arb_U_mask_n17, U_arb_U_mask_n16,
         U_arb_U_mask_n15, U_arb_U_mask_n14, U_arb_U_mask_n13,
         U_arb_U_mask_n12, U_arb_U_mask_n10, U_arb_U_mask_n9, U_arb_U_mask_n8,
         U_arb_U_mask_n4, U_arb_U_mask_n3, U_arb_U_mask_n2, U_arb_U_mask_n1,
         U_arb_U_mask_n7, U_arb_U_mask_n6, U_arb_U_mask_n5,
         U_arb_U_mask_r_mask_locked_1_, U_arb_U_ebt_n61, U_arb_U_ebt_n60,
         U_arb_U_ebt_n59, U_arb_U_ebt_n58, U_arb_U_ebt_n57, U_arb_U_ebt_n56,
         U_arb_U_ebt_n55, U_arb_U_ebt_n53, U_arb_U_ebt_n52, U_arb_U_ebt_n51,
         U_arb_U_ebt_n50, U_arb_U_ebt_n49, U_arb_U_ebt_n48, U_arb_U_ebt_n47,
         U_arb_U_ebt_n46, U_arb_U_ebt_n45, U_arb_U_ebt_n44, U_arb_U_ebt_n43,
         U_arb_U_ebt_n42, U_arb_U_ebt_n41, U_arb_U_ebt_n40, U_arb_U_ebt_n39,
         U_arb_U_ebt_n38, U_arb_U_ebt_n37, U_arb_U_ebt_n36, U_arb_U_ebt_n35,
         U_arb_U_ebt_n22, U_arb_U_ebt_n21, U_arb_U_ebt_n20, U_arb_U_ebt_n19,
         U_arb_U_ebt_n18, U_arb_U_ebt_n17, U_arb_U_ebt_n16, U_arb_U_ebt_n15,
         U_arb_U_ebt_n14, U_arb_U_ebt_n13, U_arb_U_ebt_n12, U_arb_U_ebt_n11,
         U_arb_U_ebt_n9, U_arb_U_ebt_n8, U_arb_U_ebt_n7, U_arb_U_ebt_n6,
         U_arb_U_ebt_n5, U_arb_U_ebt_n4, U_arb_U_ebt_n3, U_arb_U_ebt_n2,
         U_arb_U_ebt_n1, U_arb_U_ebt_n34, U_arb_U_ebt_n33, U_arb_U_ebt_n32,
         U_arb_U_ebt_n31, U_arb_U_ebt_n30, U_arb_U_ebt_n29, U_arb_U_ebt_n28,
         U_arb_U_ebt_n27, U_arb_U_ebt_n26, U_arb_U_ebt_n25, U_arb_U_ebt_n24,
         U_arb_U_ebt_n23, U_arb_U_ebt_int_reg_set_ebt,
         U_arb_U_ebt_int_count_0_, U_arb_U_ebt_int_count_1_,
         U_arb_U_ebt_int_count_2_, U_arb_U_ebt_int_count_3_,
         U_arb_U_ebt_int_count_4_, U_arb_U_ebt_int_count_5_,
         U_arb_U_ebt_int_count_6_, U_arb_U_ebt_int_count_7_,
         U_arb_U_ebt_int_count_8_, U_arb_U_ebt_int_count_9_,
         U_arb_U_ebt_int_current_state_0_, U_arb_U_ebt_int_current_state_1_,
         U_arb_U_arbif_n198, U_arb_U_arbif_n197, U_arb_U_arbif_n196,
         U_arb_U_arbif_n195, U_arb_U_arbif_n194, U_arb_U_arbif_n193,
         U_arb_U_arbif_n192, U_arb_U_arbif_n191, U_arb_U_arbif_n190,
         U_arb_U_arbif_n189, U_arb_U_arbif_n188, U_arb_U_arbif_n187,
         U_arb_U_arbif_n186, U_arb_U_arbif_n185, U_arb_U_arbif_n184,
         U_arb_U_arbif_n183, U_arb_U_arbif_n182, U_arb_U_arbif_n181,
         U_arb_U_arbif_n180, U_arb_U_arbif_n179, U_arb_U_arbif_n178,
         U_arb_U_arbif_n172, U_arb_U_arbif_n171, U_arb_U_arbif_n170,
         U_arb_U_arbif_n161, U_arb_U_arbif_n142, U_arb_U_arbif_n141,
         U_arb_U_arbif_n140, U_arb_U_arbif_n119, U_arb_U_arbif_n118,
         U_arb_U_arbif_n117, U_arb_U_arbif_n116, U_arb_U_arbif_n115,
         U_arb_U_arbif_n114, U_arb_U_arbif_n113, U_arb_U_arbif_n112,
         U_arb_U_arbif_n111, U_arb_U_arbif_n110, U_arb_U_arbif_n109,
         U_arb_U_arbif_n108, U_arb_U_arbif_n107, U_arb_U_arbif_n106,
         U_arb_U_arbif_n105, U_arb_U_arbif_n104, U_arb_U_arbif_n103,
         U_arb_U_arbif_n102, U_arb_U_arbif_n101, U_arb_U_arbif_n100,
         U_arb_U_arbif_n99, U_arb_U_arbif_n98, U_arb_U_arbif_n97,
         U_arb_U_arbif_n96, U_arb_U_arbif_n95, U_arb_U_arbif_n94,
         U_arb_U_arbif_n91, U_arb_U_arbif_n90, U_arb_U_arbif_n87,
         U_arb_U_arbif_n86, U_arb_U_arbif_n84, U_arb_U_arbif_n83,
         U_arb_U_arbif_n82, U_arb_U_arbif_n81, U_arb_U_arbif_n80,
         U_arb_U_arbif_n79, U_arb_U_arbif_n78, U_arb_U_arbif_n76,
         U_arb_U_arbif_n75, U_arb_U_arbif_n74, U_arb_U_arbif_n73,
         U_arb_U_arbif_n72, U_arb_U_arbif_n71, U_arb_U_arbif_n70,
         U_arb_U_arbif_n69, U_arb_U_arbif_n68, U_arb_U_arbif_n67,
         U_arb_U_arbif_n66, U_arb_U_arbif_n65, U_arb_U_arbif_n64,
         U_arb_U_arbif_n63, U_arb_U_arbif_n62, U_arb_U_arbif_n61,
         U_arb_U_arbif_n60, U_arb_U_arbif_n59, U_arb_U_arbif_n58,
         U_arb_U_arbif_n57, U_arb_U_arbif_n56, U_arb_U_arbif_n55,
         U_arb_U_arbif_n54, U_arb_U_arbif_n53, U_arb_U_arbif_n52,
         U_arb_U_arbif_n51, U_arb_U_arbif_n50, U_arb_U_arbif_n49,
         U_arb_U_arbif_n48, U_arb_U_arbif_n47, U_arb_U_arbif_n46,
         U_arb_U_arbif_n45, U_arb_U_arbif_n44, U_arb_U_arbif_n43,
         U_arb_U_arbif_n42, U_arb_U_arbif_n41, U_arb_U_arbif_n40,
         U_arb_U_arbif_n39, U_arb_U_arbif_n38, U_arb_U_arbif_n34,
         U_arb_U_arbif_n33, U_arb_U_arbif_n32, U_arb_U_arbif_n31,
         U_arb_U_arbif_n30, U_arb_U_arbif_n29, U_arb_U_arbif_n28,
         U_arb_U_arbif_n27, U_arb_U_arbif_n26, U_arb_U_arbif_n25,
         U_arb_U_arbif_n24, U_arb_U_arbif_n23, U_arb_U_arbif_n22,
         U_arb_U_arbif_n21, U_arb_U_arbif_n20, U_arb_U_arbif_n19,
         U_arb_U_arbif_n18, U_arb_U_arbif_n17, U_arb_U_arbif_n14,
         U_arb_U_arbif_n13, U_arb_U_arbif_n12, U_arb_U_arbif_n11,
         U_arb_U_arbif_n8, U_arb_U_arbif_n7, U_arb_U_arbif_n6,
         U_arb_U_arbif_n5, U_arb_U_arbif_n3, U_arb_U_arbif_n2,
         U_arb_U_arbif_n1, U_arb_U_arbif_n215, U_arb_U_arbif_n177,
         U_arb_U_arbif_n176, U_arb_U_arbif_n175, U_arb_U_arbif_n174,
         U_arb_U_arbif_n173, U_arb_U_arbif_n169, U_arb_U_arbif_n168,
         U_arb_U_arbif_n167, U_arb_U_arbif_n166, U_arb_U_arbif_n165,
         U_arb_U_arbif_n164, U_arb_U_arbif_n163, U_arb_U_arbif_n162,
         U_arb_U_arbif_n160, U_arb_U_arbif_n159, U_arb_U_arbif_n158,
         U_arb_U_arbif_n157, U_arb_U_arbif_n156, U_arb_U_arbif_n155,
         U_arb_U_arbif_n154, U_arb_U_arbif_n153, U_arb_U_arbif_n152,
         U_arb_U_arbif_n151, U_arb_U_arbif_n150, U_arb_U_arbif_n149,
         U_arb_U_arbif_n148, U_arb_U_arbif_n147, U_arb_U_arbif_n146,
         U_arb_U_arbif_n145, U_arb_U_arbif_n144, U_arb_U_arbif_n143,
         U_arb_U_arbif_n139, U_arb_U_arbif_n138, U_arb_U_arbif_n137,
         U_arb_U_arbif_n136, U_arb_U_arbif_n135, U_arb_U_arbif_n134,
         U_arb_U_arbif_n133, U_arb_U_arbif_n132, U_arb_U_arbif_n131,
         U_arb_U_arbif_n130, U_arb_U_arbif_n129, U_arb_U_arbif_n128,
         U_arb_U_arbif_n127, U_arb_U_arbif_n126, U_arb_U_arbif_n125,
         U_arb_U_arbif_n124, U_arb_U_arbif_n123, U_arb_U_arbif_n122,
         U_arb_U_arbif_n121, U_arb_U_arbif_n120, U_arb_U_arbif_int_ebt,
         U_arb_U_arbif_r_state_0_, U_arb_U_arbif_r_state_1_, U_arb_U_arbif_N72,
         U_arb_U_arbif_nxt_state_0_, U_arb_U_arbif_nxt_state_1_,
         U_arb_U_arbif_r_hmaster_d_0_, U_arb_U_arbif_r_hsize_d_0_,
         U_arb_U_arbif_r_hsize_d_1_, U_arb_U_arbif_r_hsize_d_2_,
         U_arb_U_arbif_r_hwrite_d, U_arb_U_arbif_r_htrans_d_1_,
         U_arb_U_arbif_r_haddr_d_0_, U_arb_U_arbif_r_haddr_d_2_,
         U_arb_U_arbif_r_haddr_d_3_, U_arb_U_arbif_r_haddr_d_4_,
         U_arb_U_arbif_r_haddr_d_5_, U_arb_U_arbif_r_haddr_d_6_,
         U_arb_U_arbif_r_haddr_d_7_, U_arb_U_arbif_r_haddr_d_8_,
         U_arb_U_arbif_r_haddr_d_9_, U_arb_U_arbif_r_hsel_arb_d,
         U_arb_U_arbif_ebten, n12, n13, n14, n15, n16, n17, n19, n20, n21, n22,
         n23;
  wire   [1:0] U_arb_grant_2t;
  wire   [7:4] U_arb_bus_priority;
  wire   [9:0] U_arb_ebtcount;
  wire   [1:0] U_arb_U_gctrl_hgrant_previous;
  wire   [1:0] U_arb_U_ebt_next_state;
  wire   [3:0] U_arb_U_arbif_ipl1;
  assign hresp_s0[1] = 1'b0;
  assign hrdata_s0[31] = 1'b0;
  assign hrdata_s0[30] = 1'b0;
  assign hrdata_s0[27] = 1'b0;
  assign hrdata_s0[26] = 1'b0;
  assign hrdata_s0[24] = 1'b0;
  assign hrdata_s0[23] = 1'b0;
  assign hrdata_s0[22] = 1'b0;
  assign hrdata_s0[19] = 1'b0;
  assign hrdata_s0[18] = 1'b0;
  assign hrdata_s0[17] = 1'b0;
  assign hrdata_s0[16] = 1'b0;
  assign hrdata_s0[15] = 1'b0;
  assign hrdata_s0[14] = 1'b0;
  assign hrdata_s0[10] = 1'b0;
  assign hmaster_data[3] = 1'b0;
  assign hmaster_data[2] = 1'b0;
  assign hmaster_data[1] = 1'b0;

  INV_X4 U4 ( .A(n10), .ZN(hready) );
  MUX2_X2 U_mux_U88 ( .A(hsel_s0), .B(U_mux_hsel_prev_0_), .S(n10), .Z(
        U_mux_n10) );
  MUX2_X2 U_mux_U87 ( .A(hmaster_data[0]), .B(n4), .S(U_mux_n58), .Z(U_mux_n9)
         );
  MUX2_X2 U_mux_U86 ( .A(hsel_s1), .B(U_mux_hsel_prev_1_), .S(n10), .Z(
        U_mux_n8) );
  MUX2_X2 U_mux_U85 ( .A(hsel_s2), .B(U_mux_n12), .S(n10), .Z(U_mux_n7) );
  NAND3_X2 U_mux_U84 ( .A1(U_mux_n23), .A2(U_mux_n22), .A3(U_mux_n21), .ZN(
        U_mux_n58) );
  NAND2_X2 U_mux_U83 ( .A1(hready_resp_s2), .A2(U_mux_n12), .ZN(U_mux_n23) );
  INV_X4 U_mux_U81 ( .A(U_mux_n4), .ZN(U_mux_n12) );
  NAND2_X2 U_mux_U80 ( .A1(U_mux_n53), .A2(hresp_s0[0]), .ZN(U_mux_n15) );
  NAND3_X2 U_mux_U79 ( .A1(U_mux_n17), .A2(U_mux_n16), .A3(U_mux_n15), .ZN(
        hresp[0]) );
  INV_X4 U_mux_U78 ( .A(U_mux_n18), .ZN(hresp[1]) );
  NAND2_X2 U_mux_U77 ( .A1(hready_resp_s1), .A2(U_mux_n56), .ZN(U_mux_n22) );
  NOR2_X2 U_mux_U76 ( .A1(U_mux_hsel_prev_0_), .A2(U_dfltslv_current_state), 
        .ZN(U_mux_n19) );
  INV_X4 U_mux_U74 ( .A(U_mux_n24), .ZN(hrdata[0]) );
  INV_X4 U_mux_U73 ( .A(U_mux_n54), .ZN(hrdata[29]) );
  INV_X4 U_mux_U72 ( .A(U_mux_n29), .ZN(hrdata[5]) );
  INV_X4 U_mux_U71 ( .A(U_mux_n32), .ZN(hrdata[8]) );
  INV_X4 U_mux_U70 ( .A(U_mux_n26), .ZN(hrdata[2]) );
  INV_X4 U_mux_U69 ( .A(U_mux_n27), .ZN(hrdata[3]) );
  INV_X4 U_mux_U68 ( .A(U_mux_n25), .ZN(hrdata[1]) );
  INV_X4 U_mux_U67 ( .A(U_mux_n36), .ZN(hrdata[12]) );
  INV_X4 U_mux_U66 ( .A(U_mux_n30), .ZN(hrdata[6]) );
  INV_X4 U_mux_U65 ( .A(U_mux_n31), .ZN(hrdata[7]) );
  INV_X4 U_mux_U64 ( .A(U_mux_n52), .ZN(hrdata[28]) );
  INV_X4 U_mux_U63 ( .A(U_mux_n33), .ZN(hrdata[9]) );
  INV_X4 U_mux_U62 ( .A(U_mux_n45), .ZN(hrdata[21]) );
  INV_X4 U_mux_U61 ( .A(U_mux_n35), .ZN(hrdata[11]) );
  INV_X4 U_mux_U60 ( .A(U_mux_n28), .ZN(hrdata[4]) );
  INV_X4 U_mux_U59 ( .A(U_mux_n49), .ZN(hrdata[25]) );
  INV_X4 U_mux_U58 ( .A(U_mux_n37), .ZN(hrdata[13]) );
  INV_X4 U_mux_U57 ( .A(U_mux_n44), .ZN(hrdata[20]) );
  INV_X4 U_mux_U56 ( .A(U_mux_n34), .ZN(hrdata[10]) );
  INV_X4 U_mux_U55 ( .A(U_mux_n41), .ZN(hrdata[17]) );
  INV_X4 U_mux_U54 ( .A(U_mux_n40), .ZN(hrdata[16]) );
  INV_X4 U_mux_U53 ( .A(U_mux_n39), .ZN(hrdata[15]) );
  INV_X4 U_mux_U52 ( .A(U_mux_n38), .ZN(hrdata[14]) );
  INV_X4 U_mux_U51 ( .A(U_mux_n42), .ZN(hrdata[18]) );
  INV_X4 U_mux_U50 ( .A(U_mux_n43), .ZN(hrdata[19]) );
  INV_X4 U_mux_U49 ( .A(U_mux_n57), .ZN(hrdata[31]) );
  INV_X4 U_mux_U48 ( .A(U_mux_n46), .ZN(hrdata[22]) );
  INV_X4 U_mux_U47 ( .A(U_mux_n47), .ZN(hrdata[23]) );
  INV_X4 U_mux_U46 ( .A(U_mux_n55), .ZN(hrdata[30]) );
  INV_X4 U_mux_U45 ( .A(U_mux_n50), .ZN(hrdata[26]) );
  INV_X4 U_mux_U44 ( .A(U_mux_n48), .ZN(hrdata[24]) );
  INV_X4 U_mux_U43 ( .A(U_mux_n51), .ZN(hrdata[27]) );
  AOI222_X1 U_mux_U42 ( .A1(U_mux_n12), .A2(hrdata_s2[1]), .B1(hrdata_s1[1]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[1]), .ZN(U_mux_n25) );
  AOI222_X1 U_mux_U41 ( .A1(U_mux_n12), .A2(hrdata_s2[12]), .B1(hrdata_s1[12]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[12]), .ZN(U_mux_n36) );
  AOI222_X1 U_mux_U40 ( .A1(U_mux_n12), .A2(hrdata_s2[0]), .B1(hrdata_s1[0]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[0]), .ZN(U_mux_n24) );
  AOI222_X1 U_mux_U39 ( .A1(U_mux_n12), .A2(hrdata_s2[29]), .B1(hrdata_s1[29]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[29]), .ZN(U_mux_n54) );
  AOI222_X1 U_mux_U38 ( .A1(U_mux_n12), .A2(hrdata_s2[5]), .B1(hrdata_s1[5]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[5]), .ZN(U_mux_n29) );
  AOI222_X1 U_mux_U37 ( .A1(U_mux_n12), .A2(hrdata_s2[8]), .B1(hrdata_s1[8]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[8]), .ZN(U_mux_n32) );
  AOI222_X1 U_mux_U36 ( .A1(U_mux_n12), .A2(hrdata_s2[2]), .B1(hrdata_s1[2]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[2]), .ZN(U_mux_n26) );
  AOI222_X1 U_mux_U35 ( .A1(U_mux_n12), .A2(hrdata_s2[3]), .B1(hrdata_s1[3]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[3]), .ZN(U_mux_n27) );
  AOI222_X1 U_mux_U34 ( .A1(U_mux_n12), .A2(hrdata_s2[6]), .B1(hrdata_s1[6]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[6]), .ZN(U_mux_n30) );
  AOI222_X1 U_mux_U33 ( .A1(U_mux_n12), .A2(hrdata_s2[7]), .B1(hrdata_s1[7]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[7]), .ZN(U_mux_n31) );
  AOI222_X1 U_mux_U32 ( .A1(U_mux_n12), .A2(hrdata_s2[28]), .B1(hrdata_s1[28]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[28]), .ZN(U_mux_n52) );
  AOI222_X1 U_mux_U31 ( .A1(U_mux_n12), .A2(hrdata_s2[9]), .B1(hrdata_s1[9]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[9]), .ZN(U_mux_n33) );
  AOI222_X1 U_mux_U30 ( .A1(U_mux_n12), .A2(hrdata_s2[21]), .B1(hrdata_s1[21]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[21]), .ZN(U_mux_n45) );
  AOI222_X1 U_mux_U29 ( .A1(U_mux_n12), .A2(hrdata_s2[11]), .B1(hrdata_s1[11]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[11]), .ZN(U_mux_n35) );
  AOI222_X1 U_mux_U28 ( .A1(U_mux_n12), .A2(hrdata_s2[4]), .B1(hrdata_s1[4]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[4]), .ZN(U_mux_n28) );
  AOI222_X1 U_mux_U27 ( .A1(U_mux_n12), .A2(hrdata_s2[25]), .B1(hrdata_s1[25]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[25]), .ZN(U_mux_n49) );
  AOI222_X1 U_mux_U26 ( .A1(U_mux_n12), .A2(hrdata_s2[13]), .B1(hrdata_s1[13]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[13]), .ZN(U_mux_n37) );
  AOI222_X1 U_mux_U25 ( .A1(U_mux_n12), .A2(hrdata_s2[20]), .B1(hrdata_s1[20]), 
        .B2(U_mux_n56), .C1(U_mux_n53), .C2(hrdata_s0[20]), .ZN(U_mux_n44) );
  NOR2_X4 U_mux_U23 ( .A1(U_mux_hsel_prev_2_), .A2(U_mux_n3), .ZN(U_mux_n56)
         );
  AOI22_X1 U_mux_U22 ( .A1(U_mux_n12), .A2(hrdata_s2[31]), .B1(hrdata_s1[31]), 
        .B2(U_mux_n56), .ZN(U_mux_n57) );
  AOI22_X1 U_mux_U21 ( .A1(U_mux_n12), .A2(hrdata_s2[19]), .B1(hrdata_s1[19]), 
        .B2(U_mux_n56), .ZN(U_mux_n43) );
  AOI22_X1 U_mux_U20 ( .A1(U_mux_n12), .A2(hrdata_s2[18]), .B1(hrdata_s1[18]), 
        .B2(U_mux_n56), .ZN(U_mux_n42) );
  AOI22_X1 U_mux_U19 ( .A1(U_mux_n12), .A2(hrdata_s2[16]), .B1(hrdata_s1[16]), 
        .B2(U_mux_n56), .ZN(U_mux_n40) );
  AOI22_X1 U_mux_U18 ( .A1(U_mux_n12), .A2(hrdata_s2[17]), .B1(hrdata_s1[17]), 
        .B2(U_mux_n56), .ZN(U_mux_n41) );
  AOI22_X1 U_mux_U17 ( .A1(U_mux_n12), .A2(hrdata_s2[10]), .B1(hrdata_s1[10]), 
        .B2(U_mux_n56), .ZN(U_mux_n34) );
  NAND2_X2 U_mux_U16 ( .A1(U_mux_n3), .A2(U_mux_n4), .ZN(U_mux_n14) );
  NAND3_X1 U_mux_U15 ( .A1(U_mux_n20), .A2(hresp_none_0_), .A3(U_mux_n2), .ZN(
        U_mux_n16) );
  AOI22_X2 U_mux_U14 ( .A1(U_mux_n12), .A2(hrdata_s2[14]), .B1(hrdata_s1[14]), 
        .B2(U_mux_n56), .ZN(U_mux_n38) );
  AOI22_X2 U_mux_U13 ( .A1(U_mux_n12), .A2(hresp_s2[0]), .B1(hresp_s1[0]), 
        .B2(U_mux_n56), .ZN(U_mux_n17) );
  AOI22_X2 U_mux_U12 ( .A1(U_mux_n12), .A2(hrdata_s2[22]), .B1(hrdata_s1[22]), 
        .B2(U_mux_n56), .ZN(U_mux_n46) );
  AOI22_X2 U_mux_U11 ( .A1(U_mux_n12), .A2(hresp_s2[1]), .B1(hresp_s1[1]), 
        .B2(U_mux_n56), .ZN(U_mux_n18) );
  AOI22_X2 U_mux_U10 ( .A1(U_mux_n12), .A2(hrdata_s2[24]), .B1(hrdata_s1[24]), 
        .B2(U_mux_n56), .ZN(U_mux_n48) );
  AOI22_X2 U_mux_U9 ( .A1(U_mux_n12), .A2(hrdata_s2[23]), .B1(hrdata_s1[23]), 
        .B2(U_mux_n56), .ZN(U_mux_n47) );
  INV_X2 U_mux_U8 ( .A(U_mux_n14), .ZN(U_mux_n20) );
  AOI22_X2 U_mux_U7 ( .A1(U_mux_n53), .A2(hready_resp_s0), .B1(U_mux_n20), 
        .B2(U_mux_n19), .ZN(U_mux_n21) );
  AOI22_X2 U_mux_U6 ( .A1(U_mux_n12), .A2(hrdata_s2[15]), .B1(hrdata_s1[15]), 
        .B2(U_mux_n56), .ZN(U_mux_n39) );
  AOI22_X2 U_mux_U5 ( .A1(U_mux_n12), .A2(hrdata_s2[26]), .B1(hrdata_s1[26]), 
        .B2(U_mux_n56), .ZN(U_mux_n50) );
  AOI22_X2 U_mux_U4 ( .A1(U_mux_n12), .A2(hrdata_s2[30]), .B1(hrdata_s1[30]), 
        .B2(U_mux_n56), .ZN(U_mux_n55) );
  AOI22_X2 U_mux_U3 ( .A1(U_mux_n12), .A2(hrdata_s2[27]), .B1(hrdata_s1[27]), 
        .B2(U_mux_n56), .ZN(U_mux_n51) );
  DFFR_X2 U_mux_r_ihmaster_data_reg_0_ ( .D(U_mux_n9), .CK(hclk), .RN(hresetn), 
        .Q(hmaster_data[0]) );
  DFFR_X2 U_mux_hsel_prev_reg_1_ ( .D(U_mux_n8), .CK(hclk), .RN(hresetn), .Q(
        U_mux_hsel_prev_1_), .QN(U_mux_n3) );
  DFFR_X2 U_mux_hsel_prev_reg_2_ ( .D(U_mux_n7), .CK(hclk), .RN(hresetn), .Q(
        U_mux_hsel_prev_2_), .QN(U_mux_n4) );
  DFFR_X2 U_mux_hsel_prev_reg_0_ ( .D(U_mux_n10), .CK(hclk), .RN(hresetn), .Q(
        U_mux_hsel_prev_0_), .QN(U_mux_n2) );
  AND2_X4 U_dcdr_U21 ( .A1(U_dcdr_n16), .A2(haddr[12]), .ZN(hsel_s1) );
  NOR2_X2 U_dcdr_U20 ( .A1(haddr[17]), .A2(haddr[18]), .ZN(U_dcdr_n13) );
  NOR2_X2 U_dcdr_U19 ( .A1(haddr[16]), .A2(haddr[19]), .ZN(U_dcdr_n12) );
  NOR4_X2 U_dcdr_U16 ( .A1(haddr[28]), .A2(haddr[30]), .A3(haddr[31]), .A4(
        haddr[29]), .ZN(U_dcdr_n6) );
  NOR4_X2 U_dcdr_U15 ( .A1(haddr[25]), .A2(haddr[26]), .A3(haddr[24]), .A4(
        haddr[27]), .ZN(U_dcdr_n5) );
  NAND2_X2 U_dcdr_U14 ( .A1(U_dcdr_n6), .A2(U_dcdr_n5), .ZN(U_dcdr_n15) );
  NOR4_X2 U_dcdr_U10 ( .A1(haddr[22]), .A2(haddr[20]), .A3(U_dcdr_n15), .A4(
        U_dcdr_n14), .ZN(hsel_s2) );
  NOR2_X2 U_dcdr_U6 ( .A1(haddr[12]), .A2(U_dcdr_n10), .ZN(hsel_s0) );
  NAND4_X1 U_dcdr_U4 ( .A1(haddr[23]), .A2(U_dcdr_n13), .A3(U_dcdr_n12), .A4(
        U_dcdr_n11), .ZN(U_dcdr_n14) );
  INV_X2 U_dcdr_U3 ( .A(U_dcdr_n16), .ZN(U_dcdr_n10) );
  NOR2_X2 U_arb_U5 ( .A1(U_arb_mask_1_), .A2(U_arb_ibus_hbusreq_1_), .ZN(
        U_arb_grant_2t[1]) );
  NOR2_X2 U_arb_U3 ( .A1(U_arb_grant_2t[1]), .A2(U_arb_grant_2t[0]), .ZN(
        U_arb_parked_2t) );
  NAND2_X2 U_dfltslv_U6 ( .A1(U_dfltslv_n5), .A2(U_dfltslv_n3), .ZN(
        U_dfltslv_n1) );
  OR2_X2 U_dfltslv_U3 ( .A1(U_dfltslv_current_state), .A2(U_dfltslv_n5), .ZN(
        U_dfltslv_N4) );
  DFFR_X1 U_dfltslv_hresp_none_reg_0_ ( .D(U_dfltslv_N4), .CK(hclk), .RN(
        hresetn), .Q(hresp_none_0_) );
  DFFS_X2 U_dfltslv_current_state_reg ( .D(U_dfltslv_n1), .CK(hclk), .SN(
        hresetn), .Q(U_dfltslv_n3), .QN(U_dfltslv_current_state) );
  AND2_X4 U_mux_U_dm_U33 ( .A1(hmaster_data[0]), .A2(hwdata_m1[0]), .ZN(
        hwdata[0]) );
  AND2_X4 U_mux_U_dm_U32 ( .A1(hmaster_data[0]), .A2(hwdata_m1[1]), .ZN(
        hwdata[1]) );
  AND2_X4 U_mux_U_dm_U31 ( .A1(hmaster_data[0]), .A2(hwdata_m1[2]), .ZN(
        hwdata[2]) );
  AND2_X4 U_mux_U_dm_U30 ( .A1(hmaster_data[0]), .A2(hwdata_m1[3]), .ZN(
        hwdata[3]) );
  AND2_X4 U_mux_U_dm_U29 ( .A1(hmaster_data[0]), .A2(hwdata_m1[6]), .ZN(
        hwdata[6]) );
  AND2_X4 U_mux_U_dm_U28 ( .A1(hmaster_data[0]), .A2(hwdata_m1[5]), .ZN(
        hwdata[5]) );
  AND2_X4 U_mux_U_dm_U27 ( .A1(hmaster_data[0]), .A2(hwdata_m1[4]), .ZN(
        hwdata[4]) );
  AND2_X4 U_mux_U_dm_U26 ( .A1(hmaster_data[0]), .A2(hwdata_m1[7]), .ZN(
        hwdata[7]) );
  AND2_X4 U_mux_U_dm_U25 ( .A1(hmaster_data[0]), .A2(hwdata_m1[8]), .ZN(
        hwdata[8]) );
  AND2_X4 U_mux_U_dm_U24 ( .A1(hmaster_data[0]), .A2(hwdata_m1[9]), .ZN(
        hwdata[9]) );
  AND2_X4 U_mux_U_dm_U23 ( .A1(hmaster_data[0]), .A2(hwdata_m1[28]), .ZN(
        hwdata[28]) );
  AND2_X4 U_mux_U_dm_U22 ( .A1(hmaster_data[0]), .A2(hwdata_m1[23]), .ZN(
        hwdata[23]) );
  AND2_X4 U_mux_U_dm_U21 ( .A1(hmaster_data[0]), .A2(hwdata_m1[22]), .ZN(
        hwdata[22]) );
  AND2_X4 U_mux_U_dm_U20 ( .A1(hmaster_data[0]), .A2(hwdata_m1[31]), .ZN(
        hwdata[31]) );
  AND2_X4 U_mux_U_dm_U19 ( .A1(hmaster_data[0]), .A2(hwdata_m1[20]), .ZN(
        hwdata[20]) );
  AND2_X4 U_mux_U_dm_U18 ( .A1(hmaster_data[0]), .A2(hwdata_m1[19]), .ZN(
        hwdata[19]) );
  AND2_X4 U_mux_U_dm_U17 ( .A1(hmaster_data[0]), .A2(hwdata_m1[30]), .ZN(
        hwdata[30]) );
  AND2_X4 U_mux_U_dm_U16 ( .A1(hmaster_data[0]), .A2(hwdata_m1[29]), .ZN(
        hwdata[29]) );
  AND2_X4 U_mux_U_dm_U15 ( .A1(hmaster_data[0]), .A2(hwdata_m1[27]), .ZN(
        hwdata[27]) );
  AND2_X4 U_mux_U_dm_U14 ( .A1(hmaster_data[0]), .A2(hwdata_m1[26]), .ZN(
        hwdata[26]) );
  AND2_X4 U_mux_U_dm_U13 ( .A1(hmaster_data[0]), .A2(hwdata_m1[25]), .ZN(
        hwdata[25]) );
  AND2_X4 U_mux_U_dm_U12 ( .A1(hmaster_data[0]), .A2(hwdata_m1[24]), .ZN(
        hwdata[24]) );
  AND2_X4 U_mux_U_dm_U11 ( .A1(hmaster_data[0]), .A2(hwdata_m1[11]), .ZN(
        hwdata[11]) );
  AND2_X4 U_mux_U_dm_U10 ( .A1(hmaster_data[0]), .A2(hwdata_m1[17]), .ZN(
        hwdata[17]) );
  AND2_X4 U_mux_U_dm_U9 ( .A1(hmaster_data[0]), .A2(hwdata_m1[21]), .ZN(
        hwdata[21]) );
  AND2_X4 U_mux_U_dm_U8 ( .A1(hmaster_data[0]), .A2(hwdata_m1[15]), .ZN(
        hwdata[15]) );
  AND2_X4 U_mux_U_dm_U7 ( .A1(hmaster_data[0]), .A2(hwdata_m1[13]), .ZN(
        hwdata[13]) );
  AND2_X4 U_mux_U_dm_U6 ( .A1(hmaster_data[0]), .A2(hwdata_m1[18]), .ZN(
        hwdata[18]) );
  AND2_X4 U_mux_U_dm_U5 ( .A1(hmaster_data[0]), .A2(hwdata_m1[14]), .ZN(
        hwdata[14]) );
  AND2_X4 U_mux_U_dm_U4 ( .A1(hmaster_data[0]), .A2(hwdata_m1[16]), .ZN(
        hwdata[16]) );
  AND2_X4 U_mux_U_dm_U3 ( .A1(hmaster_data[0]), .A2(hwdata_m1[10]), .ZN(
        hwdata[10]) );
  AND2_X4 U_mux_U_dm_U2 ( .A1(hmaster_data[0]), .A2(hwdata_m1[12]), .ZN(
        hwdata[12]) );
  AND2_X4 U_mux_U_hw_U2 ( .A1(n4), .A2(hwrite_m1), .ZN(hwrite) );
  AND2_X4 U_mux_U_p_U6 ( .A1(n4), .A2(hprot_m1[2]), .ZN(hprot[2]) );
  AND2_X4 U_mux_U_p_U5 ( .A1(n4), .A2(hprot_m1[3]), .ZN(hprot[3]) );
  OR2_X4 U_mux_U_p_U4 ( .A1(hprot_m1[1]), .A2(U_arb_U_gctrl_n25), .ZN(hprot[1]) );
  OR2_X4 U_mux_U_p_U3 ( .A1(hprot_m1[0]), .A2(U_arb_U_gctrl_n25), .ZN(hprot[0]) );
  AND2_X4 U_mux_U_s_U4 ( .A1(n4), .A2(hsize_m1[2]), .ZN(hsize[2]) );
  AND2_X4 U_mux_U_s_U3 ( .A1(n4), .A2(hsize_m1[1]), .ZN(hsize[1]) );
  AND2_X4 U_mux_U_s_U2 ( .A1(n4), .A2(hsize_m1[0]), .ZN(hsize[0]) );
  AND2_X4 U_mux_U_b_U4 ( .A1(n4), .A2(hburst_m1[1]), .ZN(hburst[1]) );
  AND2_X4 U_mux_U_b_U3 ( .A1(n4), .A2(hburst_m1[2]), .ZN(hburst[2]) );
  AND2_X4 U_mux_U_b_U2 ( .A1(n4), .A2(hburst_m1[0]), .ZN(hburst[0]) );
  AND2_X4 U_mux_U_t_U3 ( .A1(htrans_m1[1]), .A2(n4), .ZN(htrans[1]) );
  AND2_X4 U_mux_U_t_U2 ( .A1(htrans_m1[0]), .A2(n4), .ZN(htrans[0]) );
  AND2_X4 U_mux_U_a_U33 ( .A1(n4), .A2(haddr_m1[27]), .ZN(haddr[27]) );
  AND2_X4 U_mux_U_a_U32 ( .A1(n4), .A2(haddr_m1[29]), .ZN(haddr[29]) );
  AND2_X4 U_mux_U_a_U31 ( .A1(n4), .A2(haddr_m1[24]), .ZN(haddr[24]) );
  AND2_X4 U_mux_U_a_U30 ( .A1(n4), .A2(haddr_m1[22]), .ZN(haddr[22]) );
  AND2_X4 U_mux_U_a_U29 ( .A1(n4), .A2(haddr_m1[3]), .ZN(haddr[3]) );
  AND2_X4 U_mux_U_a_U28 ( .A1(n4), .A2(haddr_m1[5]), .ZN(haddr[5]) );
  AND2_X4 U_mux_U_a_U27 ( .A1(n4), .A2(haddr_m1[7]), .ZN(haddr[7]) );
  AND2_X4 U_mux_U_a_U26 ( .A1(n4), .A2(haddr_m1[4]), .ZN(haddr[4]) );
  AND2_X4 U_mux_U_a_U25 ( .A1(n4), .A2(haddr_m1[6]), .ZN(haddr[6]) );
  AND2_X4 U_mux_U_a_U24 ( .A1(n4), .A2(haddr_m1[2]), .ZN(haddr[2]) );
  AND2_X4 U_mux_U_a_U23 ( .A1(n4), .A2(haddr_m1[9]), .ZN(haddr[9]) );
  AND2_X4 U_mux_U_a_U22 ( .A1(n4), .A2(haddr_m1[8]), .ZN(haddr[8]) );
  AND2_X4 U_mux_U_a_U21 ( .A1(n4), .A2(haddr_m1[12]), .ZN(haddr[12]) );
  AND2_X4 U_mux_U_a_U20 ( .A1(n4), .A2(haddr_m1[17]), .ZN(haddr[17]) );
  AND2_X4 U_mux_U_a_U19 ( .A1(n4), .A2(haddr_m1[18]), .ZN(haddr[18]) );
  AND2_X4 U_mux_U_a_U18 ( .A1(n4), .A2(haddr_m1[16]), .ZN(haddr[16]) );
  AND2_X4 U_mux_U_a_U17 ( .A1(n4), .A2(haddr_m1[19]), .ZN(haddr[19]) );
  AND2_X4 U_mux_U_a_U16 ( .A1(n4), .A2(haddr_m1[15]), .ZN(haddr[15]) );
  AND2_X4 U_mux_U_a_U15 ( .A1(n4), .A2(haddr_m1[13]), .ZN(haddr[13]) );
  AND2_X4 U_mux_U_a_U14 ( .A1(n4), .A2(haddr_m1[14]), .ZN(haddr[14]) );
  AND2_X4 U_mux_U_a_U13 ( .A1(n4), .A2(haddr_m1[28]), .ZN(haddr[28]) );
  AND2_X4 U_mux_U_a_U12 ( .A1(n4), .A2(haddr_m1[30]), .ZN(haddr[30]) );
  AND2_X4 U_mux_U_a_U11 ( .A1(n4), .A2(haddr_m1[31]), .ZN(haddr[31]) );
  AND2_X4 U_mux_U_a_U10 ( .A1(n4), .A2(haddr_m1[25]), .ZN(haddr[25]) );
  AND2_X4 U_mux_U_a_U9 ( .A1(n4), .A2(haddr_m1[26]), .ZN(haddr[26]) );
  AND2_X4 U_mux_U_a_U8 ( .A1(n4), .A2(haddr_m1[20]), .ZN(haddr[20]) );
  AND2_X4 U_mux_U_a_U7 ( .A1(n4), .A2(haddr_m1[21]), .ZN(haddr[21]) );
  AND2_X4 U_mux_U_a_U6 ( .A1(n4), .A2(haddr_m1[23]), .ZN(haddr[23]) );
  AND2_X4 U_mux_U_a_U5 ( .A1(n4), .A2(haddr_m1[1]), .ZN(haddr[1]) );
  AND2_X4 U_mux_U_a_U4 ( .A1(n4), .A2(haddr_m1[0]), .ZN(haddr[0]) );
  AND2_X4 U_mux_U_a_U3 ( .A1(n4), .A2(haddr_m1[10]), .ZN(haddr[10]) );
  AND2_X4 U_mux_U_a_U2 ( .A1(n4), .A2(haddr_m1[11]), .ZN(haddr[11]) );
  AOI21_X1 U_arb_U_gctrl_U172 ( .B1(n4), .B2(U_arb_U_gctrl_n171), .A(
        hbusreq_m1), .ZN(U_arb_ibus_hbusreq_1_) );
  MUX2_X2 U_arb_U_gctrl_U171 ( .A(U_arb_U_gctrl_n150), .B(hgrant_m1), .S(
        U_arb_U_gctrl_n149), .Z(U_arb_U_gctrl_n94) );
  MUX2_X2 U_arb_U_gctrl_U170 ( .A(U_arb_U_gctrl_n144), .B(n4), .S(n10), .Z(
        U_arb_U_gctrl_n93) );
  MUX2_X2 U_arb_U_gctrl_U169 ( .A(n4), .B(U_arb_U_gctrl_r_hmaster_d_0_), .S(
        U_arb_U_gctrl_n143), .Z(U_arb_U_gctrl_n91) );
  MUX2_X2 U_arb_U_gctrl_U168 ( .A(U_arb_U_gctrl_n141), .B(U_arb_U_gctrl_n181), 
        .S(U_arb_U_gctrl_n149), .Z(U_arb_U_gctrl_n90) );
  MUX2_X2 U_arb_U_gctrl_U167 ( .A(U_arb_U_gctrl_n122), .B(U_arb_U_gctrl_n119), 
        .S(U_arb_U_gctrl_n118), .Z(U_arb_U_gctrl_n137) );
  XNOR2_X2 U_arb_U_gctrl_U165 ( .A(U_arb_U_gctrl_n144), .B(
        U_arb_U_gctrl_r_hmaster_d_0_), .ZN(U_arb_U_gctrl_n41) );
  AND4_X4 U_arb_U_gctrl_U164 ( .A1(U_arb_U_gctrl_n163), .A2(htrans[0]), .A3(
        U_arb_U_gctrl_n176), .A4(U_arb_U_gctrl_bbc_2_), .ZN(U_arb_U_gctrl_n159) );
  OR2_X4 U_arb_U_gctrl_U162 ( .A1(U_arb_U_gctrl_n80), .A2(U_arb_U_gctrl_n78), 
        .ZN(U_arb_U_gctrl_n75) );
  OR4_X4 U_arb_U_gctrl_U161 ( .A1(U_arb_grant_changed), .A2(n10), .A3(
        U_arb_U_gctrl_bc_3_), .A4(U_arb_U_gctrl_bc_0_), .ZN(U_arb_U_gctrl_n120) );
  OR2_X4 U_arb_U_gctrl_U160 ( .A1(U_arb_U_gctrl_n121), .A2(U_arb_U_gctrl_bc_0_), .ZN(U_arb_U_gctrl_n124) );
  MUX2_X2 U_arb_U_gctrl_U159 ( .A(U_arb_U_gctrl_n179), .B(U_arb_U_gctrl_wasinn), .S(n10), .Z(U_arb_U_gctrl_n92) );
  INV_X4 U_arb_U_gctrl_U158 ( .A(hresp[0]), .ZN(U_arb_U_gctrl_n34) );
  NAND2_X2 U_arb_U_gctrl_U157 ( .A1(U_arb_U_gctrl_n34), .A2(hresp[1]), .ZN(
        U_arb_U_gctrl_n107) );
  NAND2_X2 U_arb_U_gctrl_U156 ( .A1(U_arb_U_gctrl_n10), .A2(U_arb_U_gctrl_n17), 
        .ZN(U_arb_U_gctrl_n151) );
  NOR2_X2 U_arb_U_gctrl_U155 ( .A1(U_arb_U_gctrl_n151), .A2(U_arb_U_gctrl_n12), 
        .ZN(U_arb_U_gctrl_n142) );
  NOR2_X2 U_arb_U_gctrl_U154 ( .A1(U_arb_U_gctrl_n107), .A2(U_arb_U_gctrl_n38), 
        .ZN(U_arb_U_gctrl_n64) );
  INV_X4 U_arb_U_gctrl_U153 ( .A(htrans[1]), .ZN(U_arb_U_gctrl_n122) );
  INV_X4 U_arb_U_gctrl_U152 ( .A(U_arb_U_gctrl_n54), .ZN(U_arb_U_gctrl_n26) );
  NAND2_X2 U_arb_U_gctrl_U151 ( .A1(U_arb_U_gctrl_n64), .A2(U_arb_U_gctrl_n26), 
        .ZN(U_arb_U_gctrl_n27) );
  NAND3_X2 U_arb_U_gctrl_U149 ( .A1(U_arb_U_gctrl_n10), .A2(U_arb_U_gctrl_n12), 
        .A3(U_arb_U_gctrl_lock_sm_0_), .ZN(U_arb_U_gctrl_n57) );
  NAND2_X2 U_arb_U_gctrl_U147 ( .A1(U_arb_U_gctrl_n27), .A2(U_arb_U_gctrl_n28), 
        .ZN(U_arb_U_gctrl_n46) );
  NAND2_X2 U_arb_U_gctrl_U146 ( .A1(U_arb_U_gctrl_n54), .A2(U_arb_U_gctrl_n142), .ZN(U_arb_U_gctrl_n47) );
  NAND2_X2 U_arb_U_gctrl_U145 ( .A1(hresp[0]), .A2(hresp[1]), .ZN(
        U_arb_U_gctrl_n112) );
  NAND2_X2 U_arb_U_gctrl_U144 ( .A1(U_arb_U_gctrl_n16), .A2(U_arb_def_mst_0_), 
        .ZN(U_arb_U_gctrl_n31) );
  NAND2_X2 U_arb_U_gctrl_U143 ( .A1(U_arb_U_gctrl_n14), .A2(U_arb_U_gctrl_n31), 
        .ZN(U_arb_U_gctrl_n144) );
  NAND2_X2 U_arb_U_gctrl_U142 ( .A1(U_arb_U_gctrl_lock_sm_1_), .A2(
        U_arb_U_gctrl_lock_sm_0_), .ZN(U_arb_U_gctrl_n32) );
  NOR2_X2 U_arb_U_gctrl_U141 ( .A1(U_arb_U_gctrl_n32), .A2(
        U_arb_U_gctrl_lock_sm_2_), .ZN(U_arb_U_gctrl_n131) );
  OAI21_X2 U_arb_U_gctrl_U140 ( .B1(U_arb_U_gctrl_n47), .B2(U_arb_U_gctrl_n112), .A(U_arb_U_gctrl_n63), .ZN(U_arb_U_gctrl_n55) );
  NAND3_X2 U_arb_U_gctrl_U139 ( .A1(U_mux_n58), .A2(hlock_m1), .A3(
        U_arb_U_gctrl_n144), .ZN(U_arb_U_gctrl_n58) );
  AOI21_X2 U_arb_U_gctrl_U138 ( .B1(U_arb_U_gctrl_n54), .B2(U_arb_U_gctrl_n45), 
        .A(U_arb_U_gctrl_n58), .ZN(U_arb_U_gctrl_n66) );
  NOR3_X2 U_arb_U_gctrl_U137 ( .A1(U_arb_U_gctrl_n46), .A2(U_arb_U_gctrl_n55), 
        .A3(U_arb_U_gctrl_n66), .ZN(U_arb_U_gctrl_n166) );
  NAND2_X2 U_arb_U_gctrl_U136 ( .A1(U_arb_U_gctrl_n48), .A2(U_arb_U_gctrl_n107), .ZN(U_arb_U_gctrl_n56) );
  NAND2_X2 U_arb_U_gctrl_U133 ( .A1(U_arb_U_gctrl_n41), .A2(U_arb_U_gctrl_n131), .ZN(U_arb_U_gctrl_n35) );
  NAND2_X2 U_arb_U_gctrl_U132 ( .A1(U_arb_U_gctrl_n58), .A2(U_arb_U_gctrl_n36), 
        .ZN(U_arb_U_gctrl_n37) );
  NOR2_X2 U_arb_U_gctrl_U131 ( .A1(U_arb_U_gctrl_n59), .A2(
        U_arb_U_gctrl_nxt_lock_sm_2_), .ZN(U_arb_U_gctrl_n51) );
  NAND2_X2 U_arb_U_gctrl_U130 ( .A1(U_arb_U_gctrl_n166), .A2(U_arb_U_gctrl_n51), .ZN(U_arb_U_gctrl_n118) );
  INV_X4 U_arb_U_gctrl_U129 ( .A(U_arb_U_gctrl_n118), .ZN(U_arb_ltip) );
  AOI211_X2 U_arb_U_gctrl_U128 ( .C1(U_arb_U_gctrl_bbc_1_), .C2(
        U_arb_U_gctrl_n168), .A(U_arb_U_gctrl_bbc_3_), .B(U_arb_U_gctrl_bbc_2_), .ZN(U_arb_U_gctrl_n169) );
  INV_X4 U_arb_U_gctrl_U127 ( .A(hburst[2]), .ZN(U_arb_U_gctrl_n157) );
  NAND2_X2 U_arb_U_gctrl_U126 ( .A1(U_arb_U_gctrl_n30), .A2(U_arb_U_gctrl_n157), .ZN(U_arb_U_gctrl_n162) );
  OAI21_X2 U_arb_U_gctrl_U125 ( .B1(U_arb_U_gctrl_bbc_0_), .B2(
        U_arb_U_gctrl_bbc_1_), .A(htrans[0]), .ZN(U_arb_U_gctrl_n177) );
  OAI22_X2 U_arb_U_gctrl_U124 ( .A1(U_arb_U_gctrl_n169), .A2(
        U_arb_U_gctrl_n153), .B1(U_arb_U_gctrl_n70), .B2(U_arb_U_gctrl_n170), 
        .ZN(U_arb_U_gctrl_n171) );
  OAI22_X2 U_arb_U_gctrl_U123 ( .A1(U_arb_mask_1_), .A2(U_arb_U_gctrl_n110), 
        .B1(U_arb_U_gctrl_n22), .B2(U_arb_U_gctrl_n109), .ZN(
        U_arb_U_gctrl_n111) );
  NAND2_X2 U_arb_U_gctrl_U122 ( .A1(U_arb_parked_2t), .A2(U_arb_U_gctrl_n111), 
        .ZN(U_arb_U_gctrl_n147) );
  NOR2_X2 U_arb_U_gctrl_U121 ( .A1(U_arb_parked_2t), .A2(U_arb_grant_2t[0]), 
        .ZN(U_arb_U_gctrl_n114) );
  INV_X4 U_arb_U_gctrl_U120 ( .A(U_arb_U_gctrl_n59), .ZN(U_arb_U_gctrl_n69) );
  INV_X4 U_arb_U_gctrl_U119 ( .A(U_arb_U_gctrl_nxt_lock_sm_2_), .ZN(
        U_arb_U_gctrl_n68) );
  NAND4_X2 U_arb_U_gctrl_U118 ( .A1(U_arb_U_gctrl_n63), .A2(U_arb_U_gctrl_n62), 
        .A3(U_arb_int_set_ebt), .A4(U_arb_U_gctrl_n61), .ZN(U_arb_U_gctrl_n65)
         );
  NOR3_X2 U_arb_U_gctrl_U117 ( .A1(U_arb_U_gctrl_n66), .A2(U_arb_U_gctrl_n65), 
        .A3(U_arb_U_gctrl_n64), .ZN(U_arb_U_gctrl_n67) );
  OAI21_X2 U_arb_U_gctrl_U116 ( .B1(U_arb_U_gctrl_n115), .B2(
        U_arb_U_gctrl_n114), .A(U_arb_U_gctrl_n113), .ZN(U_arb_U_gctrl_n141)
         );
  NOR2_X2 U_arb_U_gctrl_U115 ( .A1(U_arb_U_gctrl_n112), .A2(U_arb_csilt), .ZN(
        U_arb_U_gctrl_n117) );
  NAND2_X2 U_arb_U_gctrl_U114 ( .A1(U_arb_U_gctrl_n117), .A2(
        U_arb_U_gctrl_n116), .ZN(U_arb_U_gctrl_n119) );
  INV_X4 U_arb_U_gctrl_U113 ( .A(U_arb_U_gctrl_n132), .ZN(U_arb_U_gctrl_n81)
         );
  NAND2_X2 U_arb_U_gctrl_U112 ( .A1(U_arb_U_gctrl_n73), .A2(U_arb_U_gctrl_n162), .ZN(U_arb_U_gctrl_n80) );
  NAND2_X2 U_arb_U_gctrl_U111 ( .A1(U_arb_U_gctrl_n20), .A2(U_arb_U_gctrl_n11), 
        .ZN(U_arb_U_gctrl_n79) );
  NOR2_X2 U_arb_U_gctrl_U110 ( .A1(U_arb_U_gctrl_n79), .A2(U_arb_U_gctrl_bc_2_), .ZN(U_arb_U_gctrl_n76) );
  NAND2_X2 U_arb_U_gctrl_U109 ( .A1(U_arb_U_gctrl_n76), .A2(U_arb_U_gctrl_n21), 
        .ZN(U_arb_U_gctrl_n74) );
  NAND2_X2 U_arb_U_gctrl_U108 ( .A1(U_arb_U_gctrl_n100), .A2(
        U_arb_U_gctrl_bc_1_), .ZN(U_arb_U_gctrl_n125) );
  INV_X4 U_arb_U_gctrl_U107 ( .A(U_arb_U_gctrl_n100), .ZN(U_arb_U_gctrl_n121)
         );
  NOR4_X2 U_arb_U_gctrl_U106 ( .A1(hresp[0]), .A2(U_arb_U_gctrl_n153), .A3(
        hresp[1]), .A4(U_arb_U_gctrl_n122), .ZN(U_arb_U_gctrl_n123) );
  INV_X4 U_arb_U_gctrl_U105 ( .A(U_arb_U_gctrl_n76), .ZN(U_arb_U_gctrl_n82) );
  NAND3_X2 U_arb_U_gctrl_U104 ( .A1(U_arb_U_gctrl_n100), .A2(
        U_arb_U_gctrl_bc_3_), .A3(U_arb_U_gctrl_n82), .ZN(U_arb_U_gctrl_n129)
         );
  NAND3_X2 U_arb_U_gctrl_U103 ( .A1(U_arb_U_gctrl_n132), .A2(U_arb_U_gctrl_n71), .A3(U_arb_U_gctrl_n73), .ZN(U_arb_U_gctrl_n127) );
  NAND3_X2 U_arb_U_gctrl_U102 ( .A1(U_arb_U_gctrl_n129), .A2(
        U_arb_U_gctrl_n128), .A3(U_arb_U_gctrl_n127), .ZN(U_arb_U_gctrl_n136)
         );
  NAND2_X2 U_arb_U_gctrl_U101 ( .A1(U_arb_ltip), .A2(U_arb_U_gctrl_n130), .ZN(
        U_arb_U_gctrl_n134) );
  OAI211_X2 U_arb_U_gctrl_U100 ( .C1(U_arb_U_gctrl_n135), .C2(
        U_arb_U_gctrl_n134), .A(U_arb_U_gctrl_n133), .B(U_arb_U_gctrl_n132), 
        .ZN(U_arb_U_gctrl_n139) );
  NOR3_X2 U_arb_U_gctrl_U99 ( .A1(U_arb_U_gctrl_n137), .A2(U_arb_U_gctrl_n136), 
        .A3(U_arb_U_gctrl_n135), .ZN(U_arb_U_gctrl_n138) );
  NAND2_X2 U_arb_U_gctrl_U98 ( .A1(U_arb_U_gctrl_n145), .A2(U_arb_grant_2t[1]), 
        .ZN(U_arb_U_gctrl_n148) );
  AOI21_X2 U_arb_U_gctrl_U97 ( .B1(U_arb_U_gctrl_n148), .B2(U_arb_U_gctrl_n147), .A(U_arb_U_gctrl_n146), .ZN(U_arb_U_gctrl_n150) );
  INV_X4 U_arb_U_gctrl_U96 ( .A(U_arb_U_gctrl_n163), .ZN(U_arb_U_gctrl_n154)
         );
  INV_X4 U_arb_U_gctrl_U95 ( .A(U_arb_U_gctrl_n127), .ZN(U_arb_U_gctrl_n72) );
  NAND2_X2 U_arb_U_gctrl_U94 ( .A1(U_arb_U_gctrl_n72), .A2(hready), .ZN(
        U_arb_U_gctrl_n102) );
  INV_X4 U_arb_U_gctrl_U93 ( .A(U_arb_U_gctrl_n102), .ZN(U_arb_U_gctrl_n105)
         );
  NOR3_X2 U_arb_U_gctrl_U92 ( .A1(U_arb_U_gctrl_n121), .A2(U_arb_U_gctrl_bc_0_), .A3(U_arb_U_gctrl_n154), .ZN(U_arb_U_gctrl_n104) );
  AOI211_X2 U_arb_U_gctrl_U91 ( .C1(U_arb_U_gctrl_bc_0_), .C2(
        U_arb_U_gctrl_n154), .A(U_arb_U_gctrl_n105), .B(U_arb_U_gctrl_n104), 
        .ZN(U_arb_U_gctrl_n106) );
  INV_X4 U_arb_U_gctrl_U90 ( .A(U_arb_U_gctrl_n106), .ZN(U_arb_U_gctrl_n89) );
  NAND2_X2 U_arb_U_gctrl_U89 ( .A1(htrans[0]), .A2(U_arb_U_gctrl_n18), .ZN(
        U_arb_new_tfr) );
  AOI22_X2 U_arb_U_gctrl_U88 ( .A1(U_arb_U_gctrl_n104), .A2(U_arb_U_gctrl_n20), 
        .B1(U_arb_U_gctrl_n101), .B2(U_arb_U_gctrl_bc_0_), .ZN(
        U_arb_U_gctrl_n103) );
  OAI211_X2 U_arb_U_gctrl_U87 ( .C1(U_arb_U_gctrl_n163), .C2(U_arb_U_gctrl_n20), .A(U_arb_U_gctrl_n103), .B(U_arb_U_gctrl_n102), .ZN(U_arb_U_gctrl_n88) );
  NOR3_X2 U_arb_U_gctrl_U86 ( .A1(U_arb_U_gctrl_n121), .A2(U_arb_U_gctrl_n154), 
        .A3(U_arb_U_gctrl_n82), .ZN(U_arb_U_gctrl_n83) );
  OAI21_X2 U_arb_U_gctrl_U85 ( .B1(U_arb_U_gctrl_n102), .B2(U_arb_U_gctrl_n157), .A(U_arb_U_gctrl_n84), .ZN(U_arb_U_gctrl_n87) );
  NAND3_X2 U_arb_U_gctrl_U84 ( .A1(U_arb_U_gctrl_n105), .A2(hburst[1]), .A3(
        hburst[2]), .ZN(U_arb_U_gctrl_n77) );
  OAI211_X2 U_arb_U_gctrl_U83 ( .C1(U_arb_U_gctrl_n163), .C2(U_arb_U_gctrl_n21), .A(U_arb_U_gctrl_n77), .B(U_arb_U_gctrl_n129), .ZN(U_arb_U_gctrl_n86) );
  NOR2_X2 U_arb_U_gctrl_U82 ( .A1(U_arb_U_gctrl_n166), .A2(
        U_arb_U_gctrl_nxt_lock_sm_1_), .ZN(U_arb_U_gctrl_n165) );
  OAI22_X2 U_arb_U_gctrl_U81 ( .A1(U_arb_U_gctrl_n152), .A2(U_arb_U_gctrl_n151), .B1(U_arb_U_gctrl_n15), .B2(hready), .ZN(U_arb_U_gctrl_n95) );
  AOI21_X2 U_arb_U_gctrl_U80 ( .B1(hready), .B2(U_arb_U_gctrl_wasinn), .A(
        U_arb_U_gctrl_n142), .ZN(U_arb_U_gctrl_n143) );
  NOR2_X2 U_arb_U_gctrl_U79 ( .A1(U_arb_U_gctrl_bbc_0_), .A2(
        U_arb_U_gctrl_bbc_1_), .ZN(U_arb_U_gctrl_n176) );
  AOI211_X2 U_arb_U_gctrl_U78 ( .C1(U_arb_U_gctrl_n163), .C2(
        U_arb_U_gctrl_n161), .A(U_arb_U_gctrl_n160), .B(U_arb_U_gctrl_n159), 
        .ZN(U_arb_U_gctrl_n97) );
  NAND2_X2 U_arb_U_gctrl_U77 ( .A1(U_arb_U_gctrl_n163), .A2(U_arb_U_gctrl_n162), .ZN(U_arb_U_gctrl_n164) );
  NAND2_X2 U_arb_U_gctrl_U76 ( .A1(U_arb_U_gctrl_n176), .A2(U_arb_U_gctrl_n13), 
        .ZN(U_arb_U_gctrl_n173) );
  AOI21_X2 U_arb_U_gctrl_U75 ( .B1(U_arb_U_gctrl_n155), .B2(U_arb_U_gctrl_n173), .A(U_arb_U_gctrl_n154), .ZN(U_arb_U_gctrl_n156) );
  OAI221_X2 U_arb_U_gctrl_U74 ( .B1(htrans[0]), .B2(hburst[2]), .C1(htrans[0]), 
        .C2(hburst[1]), .A(U_arb_U_gctrl_n174), .ZN(U_arb_U_gctrl_n175) );
  OAI22_X2 U_arb_U_gctrl_U73 ( .A1(U_arb_U_gctrl_n156), .A2(U_arb_U_gctrl_n24), 
        .B1(U_arb_U_gctrl_n175), .B2(U_arb_U_gctrl_n164), .ZN(
        U_arb_U_gctrl_n96) );
  NOR2_X2 U_arb_U_gctrl_U72 ( .A1(U_arb_U_gctrl_n167), .A2(U_arb_U_gctrl_n19), 
        .ZN(U_arb_U_gctrl_n178) );
  OAI22_X2 U_arb_U_gctrl_U71 ( .A1(U_arb_U_gctrl_n164), .A2(U_arb_U_gctrl_n178), .B1(U_arb_U_gctrl_n163), .B2(U_arb_U_gctrl_n19), .ZN(U_arb_U_gctrl_n99) );
  NOR3_X4 U_arb_U_gctrl_U69 ( .A1(U_arb_U_gctrl_n140), .A2(U_arb_U_gctrl_n139), 
        .A3(U_arb_U_gctrl_n138), .ZN(U_arb_U_gctrl_n149) );
  NAND3_X4 U_arb_U_gctrl_U67 ( .A1(U_arb_U_gctrl_n69), .A2(U_arb_U_gctrl_n68), 
        .A3(U_arb_U_gctrl_n67), .ZN(U_arb_U_gctrl_n132) );
  NOR2_X4 U_arb_U_gctrl_U66 ( .A1(U_arb_U_gctrl_n81), .A2(U_arb_U_gctrl_n75), 
        .ZN(U_arb_U_gctrl_n100) );
  NOR2_X2 U_arb_U_gctrl_U65 ( .A1(n10), .A2(htrans[0]), .ZN(U_arb_U_gctrl_n33)
         );
  OAI22_X1 U_arb_U_gctrl_U64 ( .A1(n10), .A2(U_arb_U_gctrl_n35), .B1(
        U_arb_U_gctrl_n43), .B2(U_arb_U_gctrl_n10), .ZN(U_arb_U_gctrl_n36) );
  NOR2_X1 U_arb_U_gctrl_U63 ( .A1(n10), .A2(U_arb_U_gctrl_n53), .ZN(
        U_arb_grant_changed) );
  OAI21_X1 U_arb_U_gctrl_U62 ( .B1(n10), .B2(U_arb_U_gctrl_n42), .A(
        U_arb_U_gctrl_n131), .ZN(U_arb_U_gctrl_n63) );
  NAND2_X1 U_arb_U_gctrl_U61 ( .A1(n10), .A2(hresp[1]), .ZN(U_arb_U_gctrl_n73)
         );
  NAND2_X1 U_arb_U_gctrl_U60 ( .A1(U_arb_U_gctrl_n108), .A2(n10), .ZN(
        U_arb_U_gctrl_n109) );
  NOR4_X1 U_arb_U_gctrl_U59 ( .A1(U_arb_U_gctrl_n137), .A2(U_arb_U_gctrl_n126), 
        .A3(U_arb_U_gctrl_n125), .A4(U_arb_U_gctrl_n120), .ZN(
        U_arb_U_gctrl_n140) );
  AOI211_X1 U_arb_U_gctrl_U58 ( .C1(U_arb_U_gctrl_bc_2_), .C2(
        U_arb_U_gctrl_n154), .A(U_arb_U_gctrl_n126), .B(U_arb_U_gctrl_n83), 
        .ZN(U_arb_U_gctrl_n84) );
  NAND2_X1 U_arb_U_gctrl_U56 ( .A1(U_arb_U_gctrl_n60), .A2(U_arb_U_gctrl_n54), 
        .ZN(U_arb_U_gctrl_n28) );
  NAND2_X1 U_arb_U_gctrl_U55 ( .A1(U_arb_U_gctrl_n12), .A2(U_arb_U_gctrl_n17), 
        .ZN(U_arb_U_gctrl_n43) );
  XNOR2_X1 U_arb_U_gctrl_U54 ( .A(U_arb_U_gctrl_n14), .B(
        U_arb_U_gctrl_hgrant_previous[1]), .ZN(U_arb_U_gctrl_n52) );
  NAND2_X1 U_arb_U_gctrl_U53 ( .A1(U_arb_U_gctrl_n43), .A2(U_arb_U_gctrl_n10), 
        .ZN(U_arb_U_gctrl_n44) );
  OAI21_X1 U_arb_U_gctrl_U52 ( .B1(U_arb_U_gctrl_n52), .B2(
        U_arb_U_gctrl_hgrant_previous[0]), .A(U_arb_U_gctrl_n16), .ZN(
        U_arb_U_gctrl_n53) );
  INV_X1 U_arb_U_gctrl_U50 ( .A(U_arb_U_gctrl_n131), .ZN(U_arb_U_gctrl_n133)
         );
  INV_X1 U_arb_U_gctrl_U49 ( .A(U_arb_U_gctrl_n179), .ZN(U_arb_U_gctrl_n116)
         );
  NOR2_X1 U_arb_U_gctrl_U48 ( .A1(U_arb_U_gctrl_n44), .A2(U_arb_U_gctrl_n131), 
        .ZN(U_arb_U_gctrl_n45) );
  INV_X2 U_arb_U_gctrl_U47 ( .A(hburst[1]), .ZN(U_arb_U_gctrl_n30) );
  OAI21_X1 U_arb_U_gctrl_U46 ( .B1(U_arb_U_gctrl_bbc_3_), .B2(
        U_arb_U_gctrl_n173), .A(htrans[0]), .ZN(U_arb_U_gctrl_n174) );
  NAND2_X1 U_arb_U_gctrl_U45 ( .A1(htrans[1]), .A2(U_arb_U_gctrl_n19), .ZN(
        U_arb_U_gctrl_n168) );
  INV_X2 U_arb_U_gctrl_U44 ( .A(U_arb_U_gctrl_n41), .ZN(U_arb_U_gctrl_n42) );
  INV_X1 U_arb_U_gctrl_U43 ( .A(htrans[0]), .ZN(U_arb_U_gctrl_n167) );
  NAND2_X1 U_arb_U_gctrl_U42 ( .A1(U_arb_U_gctrl_n157), .A2(U_arb_U_gctrl_n167), .ZN(U_arb_U_gctrl_n158) );
  NAND2_X1 U_arb_U_gctrl_U41 ( .A1(htrans[1]), .A2(U_arb_U_gctrl_n177), .ZN(
        U_arb_U_gctrl_n170) );
  NAND2_X1 U_arb_U_gctrl_U40 ( .A1(U_arb_U_gctrl_n162), .A2(U_arb_U_gctrl_n158), .ZN(U_arb_U_gctrl_n161) );
  INV_X2 U_arb_U_gctrl_U39 ( .A(U_arb_U_gctrl_n162), .ZN(U_arb_U_gctrl_n70) );
  INV_X2 U_arb_U_gctrl_U38 ( .A(U_arb_grant_changed), .ZN(U_arb_U_gctrl_n62)
         );
  INV_X2 U_arb_U_gctrl_U37 ( .A(U_arb_U_gctrl_n60), .ZN(U_arb_U_gctrl_n61) );
  OAI21_X1 U_arb_U_gctrl_U35 ( .B1(U_arb_U_gctrl_n18), .B2(hready), .A(
        U_arb_U_gctrl_n58), .ZN(U_arb_U_gctrl_n85) );
  INV_X1 U_arb_U_gctrl_U34 ( .A(U_arb_U_gctrl_n107), .ZN(U_arb_U_gctrl_n108)
         );
  INV_X2 U_arb_U_gctrl_U33 ( .A(U_arb_U_gctrl_n47), .ZN(U_arb_U_gctrl_n48) );
  NAND2_X1 U_arb_U_gctrl_U32 ( .A1(U_arb_U_gctrl_n109), .A2(U_arb_def_mst_0_), 
        .ZN(U_arb_U_gctrl_n110) );
  INV_X2 U_arb_U_gctrl_U31 ( .A(U_arb_U_gctrl_n165), .ZN(U_arb_U_gctrl_n152)
         );
  INV_X2 U_arb_U_gctrl_U30 ( .A(U_arb_U_gctrl_n126), .ZN(U_arb_U_gctrl_n128)
         );
  INV_X2 U_arb_U_gctrl_U29 ( .A(U_arb_U_gctrl_n146), .ZN(U_arb_U_gctrl_n113)
         );
  INV_X2 U_arb_U_gctrl_U28 ( .A(U_arb_U_gctrl_n125), .ZN(U_arb_U_gctrl_n101)
         );
  INV_X2 U_arb_U_gctrl_U27 ( .A(U_arb_U_gctrl_n136), .ZN(U_arb_U_gctrl_n130)
         );
  INV_X1 U_arb_U_gctrl_U26 ( .A(U_arb_parked_2t), .ZN(U_arb_U_gctrl_n145) );
  INV_X2 U_arb_U_gctrl_U25 ( .A(U_arb_U_gctrl_n147), .ZN(U_arb_U_gctrl_n115)
         );
  NOR2_X1 U_arb_U_gctrl_U24 ( .A1(U_arb_U_gctrl_n151), .A2(
        U_arb_U_gctrl_lock_sm_1_), .ZN(U_arb_U_gctrl_n179) );
  INV_X2 U_arb_U_gctrl_U23 ( .A(U_arb_U_gctrl_n142), .ZN(U_arb_U_gctrl_n38) );
  NAND2_X1 U_arb_U_gctrl_U22 ( .A1(htrans[0]), .A2(U_arb_U_gctrl_n74), .ZN(
        U_arb_U_gctrl_n78) );
  NAND2_X1 U_arb_U_gctrl_U21 ( .A1(U_arb_U_gctrl_n162), .A2(htrans[0]), .ZN(
        U_arb_U_gctrl_n153) );
  NOR3_X1 U_arb_U_gctrl_U20 ( .A1(U_arb_U_gctrl_n70), .A2(htrans[0]), .A3(
        U_arb_U_gctrl_n122), .ZN(U_arb_U_gctrl_n71) );
  INV_X1 U_arb_U_gctrl_U19 ( .A(U_arb_U_gctrl_n153), .ZN(U_arb_U_gctrl_n155)
         );
  AOI21_X1 U_arb_U_gctrl_U18 ( .B1(U_arb_U_gctrl_n163), .B2(U_arb_U_gctrl_n177), .A(U_arb_U_gctrl_bbc_2_), .ZN(U_arb_U_gctrl_n160) );
  INV_X1 U_arb_U_gctrl_U17 ( .A(U_arb_U_gctrl_n35), .ZN(U_arb_est) );
  OAI22_X1 U_arb_U_gctrl_U16 ( .A1(U_arb_U_gctrl_n8), .A2(U_arb_U_gctrl_n23), 
        .B1(U_arb_U_gctrl_n164), .B2(U_arb_U_gctrl_n9), .ZN(U_arb_U_gctrl_n98)
         );
  INV_X1 U_arb_U_gctrl_U15 ( .A(U_arb_U_gctrl_n177), .ZN(U_arb_U_gctrl_n9) );
  AOI21_X1 U_arb_U_gctrl_U14 ( .B1(U_arb_U_gctrl_bbc_0_), .B2(
        U_arb_U_gctrl_n162), .A(U_arb_U_gctrl_n154), .ZN(U_arb_U_gctrl_n8) );
  OAI211_X1 U_arb_U_gctrl_U12 ( .C1(U_arb_U_gctrl_n57), .C2(U_arb_U_gctrl_n5), 
        .A(U_arb_U_gctrl_n56), .B(U_arb_U_gctrl_n6), .ZN(
        U_arb_U_gctrl_nxt_lock_sm_1_) );
  INV_X1 U_arb_U_gctrl_U11 ( .A(U_arb_U_gctrl_n55), .ZN(U_arb_U_gctrl_n6) );
  AOI22_X1 U_arb_U_gctrl_U10 ( .A1(U_arb_U_gctrl_n54), .A2(U_arb_U_gctrl_n117), 
        .B1(U_arb_U_gctrl_n58), .B2(U_arb_U_gctrl_n26), .ZN(U_arb_U_gctrl_n5)
         );
  NOR4_X2 U_arb_U_gctrl_U8 ( .A1(U_arb_U_gctrl_n81), .A2(U_arb_U_gctrl_n78), 
        .A3(U_arb_U_gctrl_n80), .A4(U_arb_U_gctrl_n3), .ZN(U_arb_U_gctrl_n126)
         );
  NAND2_X1 U_arb_U_gctrl_U7 ( .A1(U_arb_U_gctrl_n79), .A2(U_arb_U_gctrl_bc_2_), 
        .ZN(U_arb_U_gctrl_n3) );
  OAI21_X1 U_arb_U_gctrl_U6 ( .B1(U_arb_U_gctrl_n112), .B2(U_arb_U_gctrl_n2), 
        .A(U_arb_U_gctrl_n132), .ZN(U_arb_U_gctrl_n146) );
  NAND2_X1 U_arb_U_gctrl_U5 ( .A1(U_arb_U_gctrl_n118), .A2(n10), .ZN(
        U_arb_U_gctrl_n2) );
  NAND3_X2 U_arb_U_gctrl_U4 ( .A1(U_arb_U_gctrl_n125), .A2(U_arb_U_gctrl_n124), 
        .A3(U_arb_U_gctrl_n1), .ZN(U_arb_U_gctrl_n135) );
  NOR2_X1 U_arb_U_gctrl_U3 ( .A1(U_arb_grant_changed), .A2(U_arb_U_gctrl_n123), 
        .ZN(U_arb_U_gctrl_n1) );
  DFFR_X2 U_arb_U_gctrl_ihlock_reg ( .D(U_arb_U_gctrl_n85), .CK(hclk), .RN(
        hresetn), .QN(U_arb_U_gctrl_n18) );
  DFFR_X2 U_arb_U_gctrl_r_hmaster_reg_0_ ( .D(U_arb_U_gctrl_n93), .CK(hclk), 
        .RN(hresetn), .Q(n4), .QN(U_arb_U_gctrl_n25) );
  DFFS_X2 U_arb_U_gctrl_lock_sm_reg_0_ ( .D(U_arb_U_gctrl_n166), .CK(hclk), 
        .SN(hresetn), .Q(U_arb_U_gctrl_n17), .QN(U_arb_U_gctrl_lock_sm_0_) );
  DFFR_X1 U_arb_U_gctrl_ihmastlock_reg ( .D(U_arb_U_gctrl_n165), .CK(hclk), 
        .RN(hresetn), .Q(hmastlock) );
  DFFR_X1 U_arb_U_gctrl_bc_reg_3_ ( .D(U_arb_U_gctrl_n86), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bc_3_), .QN(U_arb_U_gctrl_n21) );
  DFFR_X1 U_arb_U_gctrl_bc_reg_2_ ( .D(U_arb_U_gctrl_n87), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bc_2_) );
  DFFR_X1 U_arb_U_gctrl_bc_reg_1_ ( .D(U_arb_U_gctrl_n88), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bc_1_), .QN(U_arb_U_gctrl_n20) );
  DFFR_X1 U_arb_U_gctrl_bc_reg_0_ ( .D(U_arb_U_gctrl_n89), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bc_0_), .QN(U_arb_U_gctrl_n11) );
  DFFS_X2 U_arb_U_gctrl_hgrant_previous_reg_0_ ( .D(U_arb_U_gctrl_n181), .CK(
        hclk), .SN(hresetn), .Q(U_arb_U_gctrl_hgrant_previous[0]) );
  DFFS_X2 U_arb_U_gctrl_bus_hgrant_reg_0_ ( .D(U_arb_U_gctrl_n90), .CK(hclk), 
        .SN(hresetn), .Q(U_arb_U_gctrl_n181), .QN(U_arb_U_gctrl_n16) );
  DFFR_X1 U_arb_U_gctrl_r_hmaster_d_reg_0_ ( .D(U_arb_U_gctrl_n91), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_gctrl_r_hmaster_d_0_), .QN(U_arb_U_gctrl_n22)
         );
  DFFR_X1 U_arb_U_gctrl_wasinn_reg ( .D(U_arb_U_gctrl_n92), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_wasinn) );
  DFFR_X1 U_arb_U_gctrl_lock_sm_reg_1_ ( .D(U_arb_U_gctrl_nxt_lock_sm_1_), 
        .CK(hclk), .RN(hresetn), .Q(U_arb_U_gctrl_lock_sm_1_), .QN(
        U_arb_U_gctrl_n12) );
  DFFR_X1 U_arb_U_gctrl_lock_sm_reg_2_ ( .D(U_arb_U_gctrl_nxt_lock_sm_2_), 
        .CK(hclk), .RN(hresetn), .Q(U_arb_U_gctrl_lock_sm_2_), .QN(
        U_arb_U_gctrl_n10) );
  DFFR_X1 U_arb_U_gctrl_hgrant_previous_reg_1_ ( .D(U_arb_U_gctrl_n14), .CK(
        hclk), .RN(hresetn), .QN(U_arb_U_gctrl_hgrant_previous[1]) );
  DFFR_X1 U_arb_U_gctrl_bus_hgrant_reg_1_ ( .D(U_arb_U_gctrl_n94), .CK(hclk), 
        .RN(hresetn), .Q(hgrant_m1), .QN(U_arb_U_gctrl_n14) );
  DFFR_X1 U_arb_U_gctrl_csilt_reg ( .D(U_arb_U_gctrl_n95), .CK(hclk), .RN(
        hresetn), .Q(U_arb_csilt), .QN(U_arb_U_gctrl_n15) );
  DFFR_X1 U_arb_U_gctrl_bbc_reg_3_ ( .D(U_arb_U_gctrl_n96), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bbc_3_), .QN(U_arb_U_gctrl_n24) );
  DFFR_X1 U_arb_U_gctrl_bbc_reg_2_ ( .D(U_arb_U_gctrl_n97), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bbc_2_), .QN(U_arb_U_gctrl_n13) );
  DFFR_X1 U_arb_U_gctrl_bbc_reg_1_ ( .D(U_arb_U_gctrl_n98), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bbc_1_), .QN(U_arb_U_gctrl_n23) );
  DFFR_X1 U_arb_U_gctrl_bbc_reg_0_ ( .D(U_arb_U_gctrl_n99), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_gctrl_bbc_0_), .QN(U_arb_U_gctrl_n19) );
  OAI21_X2 U_arb_U_mask_U19 ( .B1(U_arb_U_gctrl_n73), .B2(U_arb_U_mask_n12), 
        .A(U_arb_U_mask_n8), .ZN(U_arb_U_mask_n7) );
  NOR4_X2 U_arb_U_mask_U18 ( .A1(U_arb_U_mask_n7), .A2(U_arb_U_mask_n13), .A3(
        U_arb_maskmaster_1_), .A4(U_arb_U_mask_r_mask_locked_1_), .ZN(
        U_arb_U_mask_n16) );
  OAI211_X2 U_arb_U_mask_U17 ( .C1(U_arb_U_mask_n17), .C2(U_arb_U_gctrl_n73), 
        .A(U_arb_U_mask_n16), .B(U_arb_U_mask_n15), .ZN(U_arb_mask_1_) );
  AOI22_X1 U_arb_U_mask_U14 ( .A1(n10), .A2(U_arb_U_mask_n9), .B1(U_arb_ltip), 
        .B2(hready), .ZN(U_arb_U_mask_n6) );
  NAND2_X1 U_arb_U_mask_U13 ( .A1(hresp[0]), .A2(hmaster_data[0]), .ZN(
        U_arb_U_mask_n12) );
  INV_X1 U_arb_U_mask_U12 ( .A(U_arb_U_gctrl_n73), .ZN(U_arb_U_mask_n14) );
  NAND3_X1 U_arb_U_mask_U11 ( .A1(U_arb_ltip), .A2(U_arb_U_mask_n14), .A3(
        hmaster_data[0]), .ZN(U_arb_U_mask_n15) );
  OAI22_X1 U_arb_U_mask_U9 ( .A1(U_arb_est), .A2(U_arb_U_mask_n10), .B1(
        U_arb_U_gctrl_n73), .B2(U_arb_U_mask_n4), .ZN(U_arb_U_mask_n5) );
  NAND2_X1 U_arb_U_mask_U8 ( .A1(hresp[0]), .A2(U_arb_U_mask_n3), .ZN(
        U_arb_U_mask_n4) );
  NOR3_X1 U_arb_U_mask_U7 ( .A1(U_arb_U_mask_n9), .A2(hmaster_data[0]), .A3(
        U_arb_csilt), .ZN(U_arb_U_mask_n3) );
  AND3_X1 U_arb_U_mask_U6 ( .A1(U_arb_bus_priority[7]), .A2(
        U_arb_bus_priority[6]), .A3(U_arb_U_mask_n2), .ZN(U_arb_U_mask_n13) );
  NOR4_X1 U_arb_U_mask_U5 ( .A1(hresp[0]), .A2(U_arb_U_gctrl_n73), .A3(
        hmaster_data[0]), .A4(U_arb_U_mask_n1), .ZN(U_arb_U_mask_n2) );
  NAND2_X1 U_arb_U_mask_U4 ( .A1(U_arb_bus_priority[5]), .A2(
        U_arb_bus_priority[4]), .ZN(U_arb_U_mask_n1) );
  OR3_X1 U_arb_U_mask_U3 ( .A1(U_arb_ltip), .A2(hresp[0]), .A3(hmaster_data[0]), .ZN(U_arb_U_mask_n17) );
  DFFR_X2 U_arb_U_mask_extend_ltip_reg ( .D(U_arb_U_mask_n6), .CK(hclk), .RN(
        hresetn), .QN(U_arb_U_mask_n9) );
  DFFR_X2 U_arb_U_mask_r_rec_hsplit_reg_1_ ( .D(U_arb_U_mask_n7), .CK(hclk), 
        .RN(hresetn), .QN(U_arb_U_mask_n8) );
  DFFR_X1 U_arb_U_mask_r_mask_locked_reg_1_ ( .D(U_arb_U_mask_n5), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_mask_r_mask_locked_1_), .QN(U_arb_U_mask_n10)
         );
  OAI21_X2 U_arb_U_ebt_U60 ( .B1(U_arb_U_ebt_n18), .B2(U_arb_ebten), .A(
        U_arb_U_ebt_n4), .ZN(U_arb_int_set_ebt) );
  AOI21_X2 U_arb_U_ebt_U59 ( .B1(U_arb_U_ebt_int_current_state_1_), .B2(
        U_arb_U_ebt_int_current_state_0_), .A(U_arb_U_ebt_int_reg_set_ebt), 
        .ZN(U_arb_U_ebt_n19) );
  AOI22_X2 U_arb_U_ebt_U58 ( .A1(U_arb_clr_arbint), .A2(ahbarbint), .B1(
        U_arb_ltip), .B2(U_arb_U_ebt_n11), .ZN(U_arb_U_ebt_n12) );
  NOR2_X2 U_arb_U_ebt_U57 ( .A1(U_arb_U_ebt_n12), .A2(U_arb_ebten), .ZN(
        U_arb_U_ebt_n23) );
  NOR2_X2 U_arb_U_ebt_U56 ( .A1(U_arb_U_ebt_int_count_9_), .A2(
        U_arb_U_ebt_int_count_8_), .ZN(U_arb_U_ebt_n22) );
  NOR2_X2 U_arb_U_ebt_U55 ( .A1(U_arb_U_ebt_int_count_3_), .A2(
        U_arb_U_ebt_int_count_2_), .ZN(U_arb_U_ebt_n20) );
  NOR2_X2 U_arb_U_ebt_U54 ( .A1(U_arb_U_ebt_int_count_0_), .A2(
        U_arb_U_ebt_int_count_1_), .ZN(U_arb_U_ebt_n56) );
  NAND2_X2 U_arb_U_ebt_U53 ( .A1(U_arb_U_ebt_n20), .A2(U_arb_U_ebt_n56), .ZN(
        U_arb_U_ebt_n37) );
  NOR2_X2 U_arb_U_ebt_U52 ( .A1(U_arb_U_ebt_int_count_4_), .A2(U_arb_U_ebt_n37), .ZN(U_arb_U_ebt_n40) );
  NOR4_X2 U_arb_U_ebt_U51 ( .A1(U_arb_U_ebt_int_count_7_), .A2(
        U_arb_U_ebt_int_count_6_), .A3(U_arb_U_ebt_int_count_5_), .A4(
        U_arb_U_ebt_n39), .ZN(U_arb_U_ebt_n21) );
  AOI21_X2 U_arb_U_ebt_U50 ( .B1(U_arb_U_ebt_int_current_state_0_), .B2(
        U_arb_U_ebt_int_current_state_1_), .A(U_arb_new_tfr), .ZN(
        U_arb_U_ebt_n55) );
  INV_X4 U_arb_U_ebt_U49 ( .A(U_arb_U_ebt_n55), .ZN(U_arb_U_ebt_n59) );
  AOI21_X2 U_arb_U_ebt_U48 ( .B1(U_arb_U_ebt_n22), .B2(U_arb_U_ebt_n21), .A(
        U_arb_U_ebt_n59), .ZN(U_arb_U_ebt_n51) );
  INV_X4 U_arb_U_ebt_U47 ( .A(U_arb_U_ebt_n51), .ZN(U_arb_U_ebt_n61) );
  AOI21_X2 U_arb_U_ebt_U46 ( .B1(U_arb_U_ebt_n56), .B2(U_arb_U_ebt_n6), .A(
        U_arb_U_ebt_n61), .ZN(U_arb_U_ebt_n35) );
  AOI22_X2 U_arb_U_ebt_U45 ( .A1(U_arb_U_ebt_int_count_3_), .A2(
        U_arb_U_ebt_n35), .B1(U_arb_ebtcount[3]), .B2(U_arb_U_ebt_n59), .ZN(
        U_arb_U_ebt_n36) );
  OAI21_X2 U_arb_U_ebt_U44 ( .B1(U_arb_U_ebt_n37), .B2(U_arb_U_ebt_n61), .A(
        U_arb_U_ebt_n36), .ZN(U_arb_U_ebt_n26) );
  NAND2_X2 U_arb_U_ebt_U43 ( .A1(U_arb_U_ebt_n40), .A2(U_arb_U_ebt_n8), .ZN(
        U_arb_U_ebt_n43) );
  NOR2_X2 U_arb_U_ebt_U42 ( .A1(U_arb_U_ebt_int_count_6_), .A2(U_arb_U_ebt_n43), .ZN(U_arb_U_ebt_n46) );
  NAND2_X2 U_arb_U_ebt_U41 ( .A1(U_arb_U_ebt_n46), .A2(U_arb_U_ebt_n7), .ZN(
        U_arb_U_ebt_n52) );
  OAI21_X2 U_arb_U_ebt_U40 ( .B1(U_arb_U_ebt_n45), .B2(U_arb_U_ebt_n61), .A(
        U_arb_U_ebt_n44), .ZN(U_arb_U_ebt_n29) );
  OAI222_X2 U_arb_U_ebt_U39 ( .A1(U_arb_U_ebt_n59), .A2(
        U_arb_U_ebt_int_count_4_), .B1(U_arb_U_ebt_n59), .B2(U_arb_U_ebt_n37), 
        .C1(U_arb_ebtcount[4]), .C2(U_arb_U_ebt_n55), .ZN(U_arb_U_ebt_n38) );
  OAI21_X2 U_arb_U_ebt_U38 ( .B1(U_arb_U_ebt_n39), .B2(U_arb_U_ebt_n61), .A(
        U_arb_U_ebt_n38), .ZN(U_arb_U_ebt_n27) );
  AOI21_X2 U_arb_U_ebt_U37 ( .B1(U_arb_U_ebt_int_count_1_), .B2(
        U_arb_U_ebt_int_count_0_), .A(U_arb_U_ebt_n56), .ZN(U_arb_U_ebt_n58)
         );
  OAI21_X2 U_arb_U_ebt_U36 ( .B1(U_arb_U_ebt_n58), .B2(U_arb_U_ebt_n61), .A(
        U_arb_U_ebt_n57), .ZN(U_arb_U_ebt_n33) );
  OAI21_X2 U_arb_U_ebt_U35 ( .B1(U_arb_U_ebt_int_count_0_), .B2(
        U_arb_U_ebt_n61), .A(U_arb_U_ebt_n60), .ZN(U_arb_U_ebt_n34) );
  OAI21_X2 U_arb_U_ebt_U34 ( .B1(U_arb_U_ebt_n50), .B2(U_arb_U_ebt_n61), .A(
        U_arb_U_ebt_n49), .ZN(U_arb_U_ebt_n31) );
  AOI22_X2 U_arb_U_ebt_U33 ( .A1(U_arb_U_ebt_n51), .A2(U_arb_U_ebt_n47), .B1(
        U_arb_ebtcount[7]), .B2(U_arb_U_ebt_n59), .ZN(U_arb_U_ebt_n48) );
  INV_X4 U_arb_U_ebt_U32 ( .A(U_arb_U_ebt_n48), .ZN(U_arb_U_ebt_n30) );
  AOI22_X2 U_arb_U_ebt_U31 ( .A1(U_arb_U_ebt_n51), .A2(U_arb_U_ebt_n41), .B1(
        U_arb_ebtcount[5]), .B2(U_arb_U_ebt_n59), .ZN(U_arb_U_ebt_n42) );
  INV_X4 U_arb_U_ebt_U30 ( .A(U_arb_U_ebt_n42), .ZN(U_arb_U_ebt_n28) );
  AOI221_X2 U_arb_U_ebt_U29 ( .B1(U_arb_U_ebt_n5), .B2(U_arb_U_ebt_n14), .C1(
        U_arb_U_ebt_int_current_state_1_), .C2(U_arb_U_ebt_n13), .A(
        U_arb_ebten), .ZN(U_arb_U_ebt_next_state[0]) );
  NOR4_X2 U_arb_U_ebt_U28 ( .A1(U_arb_U_ebt_int_count_4_), .A2(
        U_arb_U_ebt_int_count_7_), .A3(U_arb_U_ebt_int_count_5_), .A4(
        U_arb_U_ebt_n9), .ZN(U_arb_U_ebt_n16) );
  NOR4_X2 U_arb_U_ebt_U27 ( .A1(U_arb_U_ebt_int_count_1_), .A2(
        U_arb_U_ebt_int_count_6_), .A3(U_arb_new_tfr), .A4(U_arb_U_ebt_n5), 
        .ZN(U_arb_U_ebt_n15) );
  NAND4_X2 U_arb_U_ebt_U26 ( .A1(U_arb_U_ebt_n20), .A2(U_arb_U_ebt_n22), .A3(
        U_arb_U_ebt_n16), .A4(U_arb_U_ebt_n15), .ZN(U_arb_U_ebt_n17) );
  NOR3_X2 U_arb_U_ebt_U25 ( .A1(U_arb_U_ebt_int_current_state_1_), .A2(
        U_arb_ebten), .A3(U_arb_U_ebt_n17), .ZN(U_arb_U_ebt_next_state[1]) );
  NOR3_X2 U_arb_U_ebt_U24 ( .A1(U_arb_U_ebt_n19), .A2(hready), .A3(U_arb_ebten), .ZN(U_arb_U_ebt_n24) );
  NOR3_X1 U_arb_U_ebt_U23 ( .A1(U_arb_grant_changed), .A2(n10), .A3(
        U_arb_U_ebt_n19), .ZN(U_arb_U_ebt_n11) );
  NAND2_X1 U_arb_U_ebt_U21 ( .A1(U_arb_U_ebt_int_current_state_0_), .A2(
        U_arb_U_ebt_int_current_state_1_), .ZN(U_arb_U_ebt_n18) );
  INV_X2 U_arb_U_ebt_U19 ( .A(U_arb_U_ebt_n40), .ZN(U_arb_U_ebt_n39) );
  INV_X1 U_arb_U_ebt_U18 ( .A(U_arb_new_tfr), .ZN(U_arb_U_ebt_n13) );
  OAI21_X1 U_arb_U_ebt_U17 ( .B1(U_arb_U_ebt_n40), .B2(U_arb_U_ebt_n8), .A(
        U_arb_U_ebt_n43), .ZN(U_arb_U_ebt_n41) );
  AOI21_X1 U_arb_U_ebt_U16 ( .B1(U_arb_U_ebt_int_count_6_), .B2(
        U_arb_U_ebt_n43), .A(U_arb_U_ebt_n46), .ZN(U_arb_U_ebt_n45) );
  OR2_X2 U_arb_U_ebt_U15 ( .A1(U_arb_U_ebt_int_current_state_1_), .A2(
        U_arb_U_ebt_n13), .ZN(U_arb_U_ebt_n14) );
  NAND2_X1 U_arb_U_ebt_U14 ( .A1(U_arb_ebtcount[6]), .A2(U_arb_U_ebt_n59), 
        .ZN(U_arb_U_ebt_n44) );
  NAND2_X1 U_arb_U_ebt_U13 ( .A1(U_arb_ebtcount[8]), .A2(U_arb_U_ebt_n59), 
        .ZN(U_arb_U_ebt_n49) );
  NAND2_X1 U_arb_U_ebt_U12 ( .A1(U_arb_ebtcount[1]), .A2(U_arb_U_ebt_n59), 
        .ZN(U_arb_U_ebt_n57) );
  XOR2_X1 U_arb_U_ebt_U11 ( .A(U_arb_U_ebt_n52), .B(U_arb_U_ebt_int_count_8_), 
        .Z(U_arb_U_ebt_n50) );
  NAND2_X1 U_arb_U_ebt_U10 ( .A1(U_arb_ebtcount[0]), .A2(U_arb_U_ebt_n59), 
        .ZN(U_arb_U_ebt_n60) );
  OAI21_X1 U_arb_U_ebt_U9 ( .B1(U_arb_U_ebt_n46), .B2(U_arb_U_ebt_n7), .A(
        U_arb_U_ebt_n52), .ZN(U_arb_U_ebt_n47) );
  OAI211_X1 U_arb_U_ebt_U8 ( .C1(U_arb_U_ebt_int_count_8_), .C2(
        U_arb_U_ebt_n52), .A(U_arb_U_ebt_int_count_9_), .B(U_arb_U_ebt_n51), 
        .ZN(U_arb_U_ebt_n53) );
  OAI21_X1 U_arb_U_ebt_U7 ( .B1(U_arb_U_ebt_n55), .B2(n23), .A(U_arb_U_ebt_n53), .ZN(U_arb_U_ebt_n32) );
  INV_X1 U_arb_U_ebt_U6 ( .A(U_arb_U_ebt_n3), .ZN(U_arb_U_ebt_n25) );
  AOI211_X1 U_arb_U_ebt_U5 ( .C1(U_arb_U_ebt_n59), .C2(U_arb_ebtcount[2]), .A(
        U_arb_U_ebt_n1), .B(U_arb_U_ebt_n2), .ZN(U_arb_U_ebt_n3) );
  NOR4_X1 U_arb_U_ebt_U4 ( .A1(U_arb_U_ebt_int_count_0_), .A2(
        U_arb_U_ebt_int_count_1_), .A3(U_arb_U_ebt_n61), .A4(
        U_arb_U_ebt_int_count_2_), .ZN(U_arb_U_ebt_n2) );
  NOR3_X1 U_arb_U_ebt_U3 ( .A1(U_arb_U_ebt_n56), .A2(U_arb_U_ebt_n61), .A3(
        U_arb_U_ebt_n6), .ZN(U_arb_U_ebt_n1) );
  DFFR_X1 U_arb_U_ebt_int_ahbarbint_reg ( .D(U_arb_U_ebt_n23), .CK(hclk), .RN(
        hresetn), .Q(ahbarbint) );
  DFFR_X1 U_arb_U_ebt_int_reg_set_ebt_reg ( .D(U_arb_U_ebt_n24), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_ebt_int_reg_set_ebt), .QN(U_arb_U_ebt_n4) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_2_ ( .D(U_arb_U_ebt_n25), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_2_), .QN(U_arb_U_ebt_n6) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_3_ ( .D(U_arb_U_ebt_n26), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_3_) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_4_ ( .D(U_arb_U_ebt_n27), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_4_) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_5_ ( .D(U_arb_U_ebt_n28), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_5_), .QN(U_arb_U_ebt_n8) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_6_ ( .D(U_arb_U_ebt_n29), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_6_) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_7_ ( .D(U_arb_U_ebt_n30), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_7_), .QN(U_arb_U_ebt_n7) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_8_ ( .D(U_arb_U_ebt_n31), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_8_) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_9_ ( .D(U_arb_U_ebt_n32), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_9_) );
  DFFR_X1 U_arb_U_ebt_int_current_state_reg_0_ ( .D(U_arb_U_ebt_next_state[0]), 
        .CK(hclk), .RN(hresetn), .Q(U_arb_U_ebt_int_current_state_0_), .QN(
        U_arb_U_ebt_n5) );
  DFFR_X1 U_arb_U_ebt_int_current_state_reg_1_ ( .D(U_arb_U_ebt_next_state[1]), 
        .CK(hclk), .RN(hresetn), .Q(U_arb_U_ebt_int_current_state_1_) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_1_ ( .D(U_arb_U_ebt_n33), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_1_) );
  DFFR_X1 U_arb_U_ebt_int_count_reg_0_ ( .D(U_arb_U_ebt_n34), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_ebt_int_count_0_), .QN(U_arb_U_ebt_n9) );
  INV_X4 U_arb_U_arbif_U174 ( .A(U_arb_U_arbif_n102), .ZN(U_arb_U_arbif_n104)
         );
  MUX2_X2 U_arb_U_arbif_U173 ( .A(U_arb_U_arbif_ebten), .B(hwdata[0]), .S(
        U_arb_U_arbif_n112), .Z(U_arb_U_arbif_n143) );
  MUX2_X2 U_arb_U_arbif_U172 ( .A(U_arb_ebtcount[6]), .B(hwdata[6]), .S(
        U_arb_U_arbif_n118), .Z(U_arb_U_arbif_n150) );
  MUX2_X2 U_arb_U_arbif_U171 ( .A(U_arb_ebtcount[5]), .B(hwdata[5]), .S(
        U_arb_U_arbif_n118), .Z(U_arb_U_arbif_n149) );
  MUX2_X2 U_arb_U_arbif_U170 ( .A(U_arb_ebtcount[4]), .B(hwdata[4]), .S(
        U_arb_U_arbif_n118), .Z(U_arb_U_arbif_n148) );
  MUX2_X2 U_arb_U_arbif_U169 ( .A(U_arb_ebtcount[7]), .B(hwdata[7]), .S(
        U_arb_U_arbif_n118), .Z(U_arb_U_arbif_n151) );
  MUX2_X2 U_arb_U_arbif_U168 ( .A(U_arb_ebtcount[8]), .B(hwdata[8]), .S(
        U_arb_U_arbif_n142), .Z(U_arb_U_arbif_n152) );
  MUX2_X2 U_arb_U_arbif_U167 ( .A(U_arb_ebtcount[9]), .B(hwdata[9]), .S(
        U_arb_U_arbif_n142), .Z(U_arb_U_arbif_n153) );
  MUX2_X2 U_arb_U_arbif_U166 ( .A(n4), .B(U_arb_U_arbif_r_hmaster_d_0_), .S(
        n10), .Z(U_arb_U_arbif_n169) );
  MUX2_X2 U_arb_U_arbif_U165 ( .A(haddr[9]), .B(U_arb_U_arbif_r_haddr_d_9_), 
        .S(n10), .Z(U_arb_U_arbif_n168) );
  MUX2_X2 U_arb_U_arbif_U164 ( .A(haddr[8]), .B(U_arb_U_arbif_r_haddr_d_8_), 
        .S(n10), .Z(U_arb_U_arbif_n167) );
  MUX2_X2 U_arb_U_arbif_U163 ( .A(hsize[0]), .B(U_arb_U_arbif_r_hsize_d_0_), 
        .S(n10), .Z(U_arb_U_arbif_n173) );
  MUX2_X2 U_arb_U_arbif_U162 ( .A(hsize[1]), .B(U_arb_U_arbif_r_hsize_d_1_), 
        .S(n10), .Z(U_arb_U_arbif_n174) );
  NOR4_X2 U_arb_U_arbif_U161 ( .A1(U_arb_U_arbif_ipl1[1]), .A2(
        U_arb_U_arbif_ipl1[2]), .A3(U_arb_U_arbif_ipl1[3]), .A4(
        U_arb_U_arbif_ipl1[0]), .ZN(U_arb_maskmaster_1_) );
  AOI22_X2 U_arb_U_arbif_U160 ( .A1(hready_resp_s0), .A2(haddr[3]), .B1(
        U_arb_U_arbif_r_haddr_d_3_), .B2(U_arb_U_arbif_n34), .ZN(
        U_arb_U_arbif_n84) );
  INV_X4 U_arb_U_arbif_U159 ( .A(haddr[5]), .ZN(U_arb_U_arbif_n194) );
  AOI22_X2 U_arb_U_arbif_U158 ( .A1(hready_resp_s0), .A2(U_arb_U_arbif_n194), 
        .B1(U_arb_U_arbif_n6), .B2(U_arb_U_arbif_n34), .ZN(U_arb_U_arbif_n63)
         );
  NOR2_X2 U_arb_U_arbif_U157 ( .A1(U_arb_U_arbif_r_haddr_d_9_), .A2(
        U_arb_U_arbif_r_haddr_d_8_), .ZN(U_arb_U_arbif_n107) );
  INV_X4 U_arb_U_arbif_U156 ( .A(haddr[6]), .ZN(U_arb_U_arbif_n195) );
  NOR4_X2 U_arb_U_arbif_U155 ( .A1(haddr[5]), .A2(haddr[7]), .A3(haddr[4]), 
        .A4(U_arb_U_arbif_n195), .ZN(U_arb_U_arbif_n76) );
  INV_X4 U_arb_U_arbif_U154 ( .A(haddr[4]), .ZN(U_arb_U_arbif_n193) );
  INV_X4 U_arb_U_arbif_U153 ( .A(haddr[7]), .ZN(U_arb_U_arbif_n196) );
  NOR4_X2 U_arb_U_arbif_U152 ( .A1(haddr[3]), .A2(haddr[5]), .A3(haddr[2]), 
        .A4(haddr[6]), .ZN(U_arb_U_arbif_n38) );
  OAI221_X2 U_arb_U_arbif_U151 ( .B1(haddr[7]), .B2(U_arb_U_arbif_n193), .C1(
        U_arb_U_arbif_n196), .C2(haddr[4]), .A(U_arb_U_arbif_n38), .ZN(
        U_arb_U_arbif_n39) );
  NAND2_X2 U_arb_U_arbif_U150 ( .A1(haddr[3]), .A2(haddr[2]), .ZN(
        U_arb_U_arbif_n40) );
  NAND2_X2 U_arb_U_arbif_U149 ( .A1(U_arb_U_arbif_n39), .A2(U_arb_U_arbif_n40), 
        .ZN(U_arb_U_arbif_n42) );
  NOR4_X2 U_arb_U_arbif_U148 ( .A1(haddr[6]), .A2(haddr[7]), .A3(
        U_arb_U_arbif_n194), .A4(U_arb_U_arbif_n193), .ZN(U_arb_U_arbif_n41)
         );
  OAI22_X2 U_arb_U_arbif_U147 ( .A1(U_arb_U_arbif_n76), .A2(U_arb_U_arbif_n42), 
        .B1(U_arb_U_arbif_n41), .B2(U_arb_U_arbif_n40), .ZN(U_arb_U_arbif_n44)
         );
  INV_X4 U_arb_U_arbif_U146 ( .A(hsize[2]), .ZN(U_arb_U_arbif_n197) );
  NAND2_X2 U_arb_U_arbif_U145 ( .A1(hsize[1]), .A2(hsize[0]), .ZN(
        U_arb_U_arbif_n43) );
  NAND2_X2 U_arb_U_arbif_U144 ( .A1(U_arb_U_arbif_n197), .A2(U_arb_U_arbif_n43), .ZN(U_arb_U_arbif_n80) );
  NOR4_X2 U_arb_U_arbif_U143 ( .A1(U_arb_U_arbif_n44), .A2(haddr[9]), .A3(
        haddr[8]), .A4(U_arb_U_arbif_n80), .ZN(U_arb_U_arbif_n56) );
  NAND2_X2 U_arb_U_arbif_U142 ( .A1(U_arb_U_arbif_r_state_1_), .A2(
        U_arb_U_arbif_r_state_0_), .ZN(U_arb_U_arbif_n55) );
  OAI21_X2 U_arb_U_arbif_U141 ( .B1(U_arb_U_arbif_n56), .B2(U_arb_U_arbif_n59), 
        .A(U_arb_U_arbif_n55), .ZN(U_arb_U_arbif_N72) );
  INV_X4 U_arb_U_arbif_U140 ( .A(hwrite), .ZN(U_arb_U_arbif_n198) );
  INV_X4 U_arb_U_arbif_U139 ( .A(haddr[2]), .ZN(U_arb_U_arbif_n74) );
  OAI22_X2 U_arb_U_arbif_U138 ( .A1(U_arb_U_arbif_n74), .A2(
        U_arb_U_arbif_r_haddr_d_2_), .B1(U_arb_U_arbif_n8), .B2(haddr[1]), 
        .ZN(U_arb_U_arbif_n46) );
  AOI221_X2 U_arb_U_arbif_U137 ( .B1(U_arb_U_arbif_n74), .B2(
        U_arb_U_arbif_r_haddr_d_2_), .C1(haddr[1]), .C2(U_arb_U_arbif_n8), .A(
        U_arb_U_arbif_n46), .ZN(U_arb_U_arbif_n54) );
  AOI22_X2 U_arb_U_arbif_U136 ( .A1(U_arb_U_arbif_n194), .A2(
        U_arb_U_arbif_r_haddr_d_5_), .B1(U_arb_U_arbif_r_haddr_d_7_), .B2(
        U_arb_U_arbif_n196), .ZN(U_arb_U_arbif_n47) );
  OAI221_X2 U_arb_U_arbif_U135 ( .B1(U_arb_U_arbif_n194), .B2(
        U_arb_U_arbif_r_haddr_d_5_), .C1(U_arb_U_arbif_n196), .C2(
        U_arb_U_arbif_r_haddr_d_7_), .A(U_arb_U_arbif_n47), .ZN(
        U_arb_U_arbif_n52) );
  AOI22_X2 U_arb_U_arbif_U134 ( .A1(U_arb_U_arbif_n193), .A2(
        U_arb_U_arbif_r_haddr_d_4_), .B1(haddr[0]), .B2(U_arb_U_arbif_n14), 
        .ZN(U_arb_U_arbif_n48) );
  OAI221_X2 U_arb_U_arbif_U133 ( .B1(U_arb_U_arbif_n193), .B2(
        U_arb_U_arbif_r_haddr_d_4_), .C1(U_arb_U_arbif_n14), .C2(haddr[0]), 
        .A(U_arb_U_arbif_n48), .ZN(U_arb_U_arbif_n51) );
  AOI22_X2 U_arb_U_arbif_U132 ( .A1(U_arb_U_arbif_n192), .A2(
        U_arb_U_arbif_r_haddr_d_3_), .B1(U_arb_U_arbif_r_haddr_d_6_), .B2(
        U_arb_U_arbif_n195), .ZN(U_arb_U_arbif_n49) );
  OAI221_X2 U_arb_U_arbif_U131 ( .B1(U_arb_U_arbif_n192), .B2(
        U_arb_U_arbif_r_haddr_d_3_), .C1(U_arb_U_arbif_n195), .C2(
        U_arb_U_arbif_r_haddr_d_6_), .A(U_arb_U_arbif_n49), .ZN(
        U_arb_U_arbif_n50) );
  NOR3_X2 U_arb_U_arbif_U130 ( .A1(U_arb_U_arbif_n52), .A2(U_arb_U_arbif_n51), 
        .A3(U_arb_U_arbif_n50), .ZN(U_arb_U_arbif_n53) );
  NAND4_X2 U_arb_U_arbif_U129 ( .A1(U_arb_U_arbif_r_state_1_), .A2(
        U_arb_U_arbif_n107), .A3(U_arb_U_arbif_n54), .A4(U_arb_U_arbif_n53), 
        .ZN(U_arb_U_arbif_n57) );
  NAND2_X2 U_arb_U_arbif_U128 ( .A1(U_arb_U_arbif_n198), .A2(U_arb_U_arbif_n57), .ZN(U_arb_U_arbif_n58) );
  NOR2_X2 U_arb_U_arbif_U127 ( .A1(U_arb_U_arbif_n63), .A2(U_arb_U_arbif_n66), 
        .ZN(U_arb_U_arbif_n91) );
  AOI22_X2 U_arb_U_arbif_U126 ( .A1(hready_resp_s0), .A2(haddr[6]), .B1(
        U_arb_U_arbif_r_haddr_d_6_), .B2(U_arb_U_arbif_n34), .ZN(
        U_arb_U_arbif_n87) );
  AOI22_X2 U_arb_U_arbif_U125 ( .A1(hready_resp_s0), .A2(U_arb_U_arbif_n193), 
        .B1(U_arb_U_arbif_n11), .B2(U_arb_U_arbif_n34), .ZN(U_arb_U_arbif_n69)
         );
  AOI22_X2 U_arb_U_arbif_U124 ( .A1(hready_resp_s0), .A2(U_arb_U_arbif_n196), 
        .B1(U_arb_U_arbif_n17), .B2(U_arb_U_arbif_n34), .ZN(U_arb_U_arbif_n68)
         );
  NAND2_X2 U_arb_U_arbif_U123 ( .A1(U_arb_U_arbif_n70), .A2(U_arb_U_arbif_n90), 
        .ZN(U_arb_U_arbif_n94) );
  NAND4_X2 U_arb_U_arbif_U122 ( .A1(U_arb_U_arbif_n87), .A2(U_arb_U_arbif_n64), 
        .A3(U_arb_U_arbif_n69), .A4(U_arb_U_arbif_n81), .ZN(U_arb_U_arbif_n65)
         );
  OAI211_X2 U_arb_U_arbif_U121 ( .C1(U_arb_bus_priority[5]), .C2(
        U_arb_U_arbif_n94), .A(U_arb_U_arbif_n71), .B(U_arb_U_arbif_n103), 
        .ZN(U_arb_U_arbif_n121) );
  AOI221_X2 U_arb_U_arbif_U120 ( .B1(U_arb_U_arbif_ebten), .B2(
        U_arb_U_arbif_n84), .C1(U_arb_def_mst_0_), .C2(U_arb_U_arbif_n82), .A(
        U_arb_U_arbif_n81), .ZN(U_arb_U_arbif_n86) );
  OAI211_X2 U_arb_U_arbif_U117 ( .C1(U_arb_U_arbif_n94), .C2(
        U_arb_bus_priority[7]), .A(U_arb_U_arbif_n73), .B(U_arb_U_arbif_n103), 
        .ZN(U_arb_U_arbif_n123) );
  OAI21_X2 U_arb_U_arbif_U116 ( .B1(U_arb_U_arbif_n94), .B2(
        U_arb_bus_priority[6]), .A(U_arb_U_arbif_n72), .ZN(U_arb_U_arbif_n122)
         );
  NAND2_X2 U_arb_U_arbif_U115 ( .A1(U_arb_U_arbif_n99), .A2(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n128) );
  AOI21_X2 U_arb_U_arbif_U114 ( .B1(U_arb_U_arbif_int_ebt), .B2(
        U_arb_clr_arbint), .A(U_arb_int_set_ebt), .ZN(U_arb_U_arbif_n78) );
  AOI211_X2 U_arb_U_arbif_U113 ( .C1(U_arb_U_arbif_r_hsize_d_0_), .C2(
        U_arb_U_arbif_n8), .A(U_arb_U_arbif_r_hsize_d_1_), .B(
        U_arb_U_arbif_r_hsize_d_2_), .ZN(U_arb_U_arbif_n105) );
  INV_X4 U_arb_U_arbif_U112 ( .A(U_arb_U_arbif_n105), .ZN(U_arb_U_arbif_n119)
         );
  AOI21_X2 U_arb_U_arbif_U111 ( .B1(U_arb_U_arbif_n14), .B2(U_arb_U_arbif_n8), 
        .A(U_arb_U_arbif_n119), .ZN(U_arb_U_arbif_n116) );
  NOR3_X2 U_arb_U_arbif_U110 ( .A1(U_arb_U_arbif_n7), .A2(U_arb_U_arbif_n12), 
        .A3(U_arb_U_arbif_n18), .ZN(U_arb_U_arbif_n106) );
  NAND3_X2 U_arb_U_arbif_U109 ( .A1(U_arb_U_arbif_n107), .A2(
        U_arb_U_arbif_n106), .A3(hready), .ZN(U_arb_U_arbif_n113) );
  NOR4_X2 U_arb_U_arbif_U108 ( .A1(U_arb_U_arbif_r_haddr_d_2_), .A2(
        U_arb_U_arbif_n116), .A3(U_arb_U_arbif_n108), .A4(U_arb_U_arbif_n113), 
        .ZN(U_arb_U_arbif_n161) );
  NAND2_X2 U_arb_U_arbif_U107 ( .A1(U_arb_U_arbif_r_haddr_d_6_), .A2(
        U_arb_U_arbif_n161), .ZN(U_arb_U_arbif_n111) );
  NOR2_X2 U_arb_U_arbif_U106 ( .A1(U_arb_U_arbif_r_haddr_d_3_), .A2(
        U_arb_U_arbif_n111), .ZN(U_arb_U_arbif_n112) );
  NOR3_X2 U_arb_U_arbif_U105 ( .A1(hwdata[1]), .A2(hwdata[2]), .A3(hwdata[3]), 
        .ZN(U_arb_U_arbif_n170) );
  NAND3_X2 U_arb_U_arbif_U104 ( .A1(U_arb_U_arbif_n161), .A2(U_arb_U_arbif_n13), .A3(U_arb_U_arbif_n19), .ZN(U_arb_U_arbif_n185) );
  AOI21_X2 U_arb_U_arbif_U103 ( .B1(U_arb_U_arbif_n170), .B2(
        U_arb_U_arbif_r_hmaster_d_0_), .A(U_arb_U_arbif_n185), .ZN(
        U_arb_U_arbif_n171) );
  INV_X4 U_arb_U_arbif_U102 ( .A(hwdata[0]), .ZN(U_arb_U_arbif_n172) );
  OAI22_X2 U_arb_U_arbif_U101 ( .A1(U_arb_U_arbif_n171), .A2(
        U_arb_bus_priority[4]), .B1(U_arb_U_arbif_n172), .B2(
        U_arb_U_arbif_n185), .ZN(U_arb_U_arbif_n154) );
  NOR4_X2 U_arb_U_arbif_U100 ( .A1(U_arb_U_arbif_r_haddr_d_7_), .A2(
        U_arb_U_arbif_r_haddr_d_6_), .A3(U_arb_U_arbif_n6), .A4(
        U_arb_U_arbif_n11), .ZN(U_arb_U_arbif_n114) );
  NAND4_X2 U_arb_U_arbif_U99 ( .A1(U_arb_U_arbif_r_haddr_d_3_), .A2(
        U_arb_U_arbif_r_haddr_d_2_), .A3(U_arb_U_arbif_n115), .A4(
        U_arb_U_arbif_n114), .ZN(U_arb_U_arbif_n140) );
  AOI21_X2 U_arb_U_arbif_U98 ( .B1(U_arb_U_arbif_n178), .B2(U_arb_U_arbif_n181), .A(U_arb_U_arbif_n185), .ZN(U_arb_U_arbif_n179) );
  INV_X4 U_arb_U_arbif_U97 ( .A(hwdata[1]), .ZN(U_arb_U_arbif_n180) );
  OAI22_X2 U_arb_U_arbif_U96 ( .A1(U_arb_U_arbif_n179), .A2(
        U_arb_bus_priority[5]), .B1(U_arb_U_arbif_n180), .B2(
        U_arb_U_arbif_n185), .ZN(U_arb_U_arbif_n155) );
  INV_X4 U_arb_U_arbif_U95 ( .A(hwdata[2]), .ZN(U_arb_U_arbif_n183) );
  AOI21_X2 U_arb_U_arbif_U94 ( .B1(U_arb_U_arbif_n184), .B2(U_arb_U_arbif_n183), .A(U_arb_U_arbif_n185), .ZN(U_arb_U_arbif_n187) );
  INV_X4 U_arb_U_arbif_U93 ( .A(hwdata[3]), .ZN(U_arb_U_arbif_n186) );
  OAI22_X2 U_arb_U_arbif_U92 ( .A1(U_arb_U_arbif_n187), .A2(
        U_arb_bus_priority[7]), .B1(U_arb_U_arbif_n186), .B2(
        U_arb_U_arbif_n185), .ZN(U_arb_U_arbif_n157) );
  AOI21_X2 U_arb_U_arbif_U91 ( .B1(U_arb_U_arbif_n184), .B2(U_arb_U_arbif_n186), .A(U_arb_U_arbif_n185), .ZN(U_arb_U_arbif_n182) );
  OAI22_X2 U_arb_U_arbif_U90 ( .A1(U_arb_U_arbif_n182), .A2(
        U_arb_bus_priority[6]), .B1(U_arb_U_arbif_n183), .B2(
        U_arb_U_arbif_n185), .ZN(U_arb_U_arbif_n156) );
  NAND2_X2 U_arb_U_arbif_U89 ( .A1(U_arb_U_arbif_n75), .A2(U_arb_U_arbif_n55), 
        .ZN(U_arb_U_arbif_n45) );
  AOI21_X2 U_arb_U_arbif_U88 ( .B1(hwrite), .B2(U_arb_U_arbif_n56), .A(
        U_arb_U_arbif_n45), .ZN(U_arb_U_arbif_nxt_state_0_) );
  AOI21_X2 U_arb_U_arbif_U87 ( .B1(U_arb_U_arbif_r_haddr_d_0_), .B2(
        U_arb_U_arbif_n8), .A(U_arb_U_arbif_n119), .ZN(U_arb_U_arbif_n141) );
  NOR2_X2 U_arb_U_arbif_U86 ( .A1(U_arb_U_arbif_n141), .A2(U_arb_U_arbif_n140), 
        .ZN(U_arb_U_arbif_n142) );
  NOR2_X2 U_arb_U_arbif_U85 ( .A1(U_arb_U_arbif_n13), .A2(U_arb_U_arbif_n111), 
        .ZN(U_arb_U_arbif_n110) );
  NAND3_X2 U_arb_U_arbif_U84 ( .A1(U_arb_U_arbif_n110), .A2(U_arb_U_arbif_n170), .A3(hwdata[0]), .ZN(U_arb_U_arbif_n109) );
  OAI21_X2 U_arb_U_arbif_U83 ( .B1(U_arb_U_arbif_n110), .B2(U_arb_U_arbif_n28), 
        .A(U_arb_U_arbif_n109), .ZN(U_arb_U_arbif_n139) );
  AOI22_X2 U_arb_U_arbif_U82 ( .A1(U_arb_U_arbif_n118), .A2(U_arb_U_arbif_n186), .B1(U_arb_U_arbif_n31), .B2(U_arb_U_arbif_n117), .ZN(U_arb_U_arbif_n147) );
  AOI22_X2 U_arb_U_arbif_U81 ( .A1(U_arb_U_arbif_n118), .A2(U_arb_U_arbif_n180), .B1(U_arb_U_arbif_n29), .B2(U_arb_U_arbif_n117), .ZN(U_arb_U_arbif_n145) );
  AOI22_X2 U_arb_U_arbif_U80 ( .A1(U_arb_U_arbif_n118), .A2(U_arb_U_arbif_n183), .B1(U_arb_U_arbif_n30), .B2(U_arb_U_arbif_n117), .ZN(U_arb_U_arbif_n146) );
  AOI22_X2 U_arb_U_arbif_U79 ( .A1(U_arb_U_arbif_n118), .A2(U_arb_U_arbif_n172), .B1(U_arb_U_arbif_n32), .B2(U_arb_U_arbif_n117), .ZN(U_arb_U_arbif_n144) );
  AOI21_X2 U_arb_U_arbif_U78 ( .B1(U_arb_U_arbif_n56), .B2(U_arb_U_arbif_n198), 
        .A(U_arb_U_arbif_n45), .ZN(U_arb_U_arbif_nxt_state_1_) );
  OAI22_X2 U_arb_U_arbif_U77 ( .A1(hready), .A2(U_arb_U_arbif_n18), .B1(
        U_arb_U_arbif_n80), .B2(U_arb_U_arbif_n79), .ZN(U_arb_U_arbif_n177) );
  OAI22_X2 U_arb_U_arbif_U75 ( .A1(hready), .A2(U_arb_U_arbif_r_haddr_d_2_), 
        .B1(haddr[2]), .B2(n10), .ZN(U_arb_U_arbif_n191) );
  NAND2_X2 U_arb_U_arbif_U74 ( .A1(htrans[1]), .A2(hready), .ZN(
        U_arb_U_arbif_n188) );
  NOR2_X2 U_arb_U_arbif_U72 ( .A1(U_arb_U_arbif_n116), .A2(U_arb_U_arbif_n140), 
        .ZN(U_arb_U_arbif_n118) );
  NAND2_X1 U_arb_U_arbif_U71 ( .A1(hready), .A2(hsel_s0), .ZN(
        U_arb_U_arbif_n79) );
  AOI22_X2 U_arb_U_arbif_U67 ( .A1(hready_resp_s0), .A2(haddr[2]), .B1(
        U_arb_U_arbif_r_haddr_d_2_), .B2(U_arb_U_arbif_n34), .ZN(
        U_arb_U_arbif_n83) );
  AOI22_X1 U_arb_U_arbif_U66 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[1]), 
        .B1(U_arb_ebtcount[1]), .B2(U_arb_U_arbif_n100), .ZN(U_arb_U_arbif_n71) );
  AOI22_X1 U_arb_U_arbif_U65 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[3]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[3]), .ZN(U_arb_U_arbif_n73) );
  NOR2_X1 U_arb_U_arbif_U64 ( .A1(U_arb_U_arbif_N72), .A2(U_arb_U_arbif_n62), 
        .ZN(U_arb_U_arbif_n102) );
  AOI22_X1 U_arb_U_arbif_U62 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[2]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[2]), .ZN(U_arb_U_arbif_n72) );
  AOI22_X1 U_arb_U_arbif_U61 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[5]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[5]), .ZN(U_arb_U_arbif_n96) );
  AOI22_X1 U_arb_U_arbif_U60 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[8]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[8]), .ZN(U_arb_U_arbif_n99) );
  AOI22_X1 U_arb_U_arbif_U59 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[6]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[6]), .ZN(U_arb_U_arbif_n97) );
  AOI22_X1 U_arb_U_arbif_U58 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[4]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[4]), .ZN(U_arb_U_arbif_n95) );
  AOI22_X1 U_arb_U_arbif_U57 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[7]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[7]), .ZN(U_arb_U_arbif_n98) );
  AOI22_X1 U_arb_U_arbif_U56 ( .A1(U_arb_U_arbif_n102), .A2(hrdata_s0[9]), 
        .B1(U_arb_U_arbif_n100), .B2(U_arb_ebtcount[9]), .ZN(
        U_arb_U_arbif_n101) );
  INV_X4 U_arb_U_arbif_U55 ( .A(U_arb_U_arbif_n188), .ZN(U_arb_U_arbif_n5) );
  NAND2_X2 U_arb_U_arbif_U54 ( .A1(U_arb_U_arbif_n5), .A2(hsel_s0), .ZN(
        U_arb_U_arbif_n59) );
  NAND3_X1 U_arb_U_arbif_U53 ( .A1(U_arb_U_arbif_n6), .A2(U_arb_U_arbif_n17), 
        .A3(U_arb_U_arbif_n11), .ZN(U_arb_U_arbif_n108) );
  NAND3_X1 U_arb_U_arbif_U52 ( .A1(U_arb_U_arbif_r_htrans_d_1_), .A2(
        U_arb_U_arbif_r_hsel_arb_d), .A3(U_arb_U_arbif_n34), .ZN(
        U_arb_U_arbif_n60) );
  NOR2_X1 U_arb_U_arbif_U51 ( .A1(hwdata[2]), .A2(hwdata[3]), .ZN(
        U_arb_U_arbif_n178) );
  AND2_X2 U_arb_U_arbif_U50 ( .A1(U_arb_U_arbif_n172), .A2(
        U_arb_U_arbif_r_hmaster_d_0_), .ZN(U_arb_U_arbif_n181) );
  INV_X2 U_arb_U_arbif_U49 ( .A(U_arb_U_arbif_n83), .ZN(U_arb_U_arbif_n81) );
  INV_X1 U_arb_U_arbif_U46 ( .A(U_arb_U_arbif_n84), .ZN(U_arb_U_arbif_n82) );
  AND2_X2 U_arb_U_arbif_U45 ( .A1(U_arb_U_arbif_n181), .A2(U_arb_U_arbif_n180), 
        .ZN(U_arb_U_arbif_n184) );
  NOR2_X1 U_arb_U_arbif_U44 ( .A1(U_arb_U_arbif_n69), .A2(U_arb_U_arbif_n68), 
        .ZN(U_arb_U_arbif_n90) );
  INV_X1 U_arb_U_arbif_U43 ( .A(U_arb_U_arbif_n68), .ZN(U_arb_U_arbif_n64) );
  INV_X2 U_arb_U_arbif_U42 ( .A(U_arb_U_arbif_n63), .ZN(U_arb_U_arbif_n67) );
  OAI21_X1 U_arb_U_arbif_U41 ( .B1(hready), .B2(U_arb_U_arbif_n12), .A(
        U_arb_U_arbif_n188), .ZN(U_arb_U_arbif_n158) );
  AOI22_X1 U_arb_U_arbif_U40 ( .A1(n10), .A2(U_arb_U_arbif_n14), .B1(
        U_arb_U_arbif_n189), .B2(hready), .ZN(U_arb_U_arbif_n159) );
  AOI22_X1 U_arb_U_arbif_U39 ( .A1(n10), .A2(U_arb_U_arbif_n8), .B1(
        U_arb_U_arbif_n190), .B2(hready), .ZN(U_arb_U_arbif_n160) );
  AOI22_X1 U_arb_U_arbif_U38 ( .A1(n10), .A2(U_arb_U_arbif_n7), .B1(
        U_arb_U_arbif_n198), .B2(hready), .ZN(U_arb_U_arbif_n176) );
  AOI22_X1 U_arb_U_arbif_U37 ( .A1(n10), .A2(U_arb_U_arbif_n33), .B1(
        U_arb_U_arbif_n197), .B2(hready), .ZN(U_arb_U_arbif_n175) );
  AOI22_X1 U_arb_U_arbif_U36 ( .A1(n10), .A2(U_arb_U_arbif_n13), .B1(
        U_arb_U_arbif_n192), .B2(hready), .ZN(U_arb_U_arbif_n162) );
  AOI22_X1 U_arb_U_arbif_U35 ( .A1(n10), .A2(U_arb_U_arbif_n11), .B1(
        U_arb_U_arbif_n193), .B2(hready), .ZN(U_arb_U_arbif_n163) );
  AOI22_X1 U_arb_U_arbif_U34 ( .A1(n10), .A2(U_arb_U_arbif_n6), .B1(
        U_arb_U_arbif_n194), .B2(hready), .ZN(U_arb_U_arbif_n164) );
  AOI22_X1 U_arb_U_arbif_U33 ( .A1(n10), .A2(U_arb_U_arbif_n17), .B1(
        U_arb_U_arbif_n196), .B2(hready), .ZN(U_arb_U_arbif_n166) );
  AOI22_X1 U_arb_U_arbif_U32 ( .A1(n10), .A2(U_arb_U_arbif_n19), .B1(
        U_arb_U_arbif_n195), .B2(hready), .ZN(U_arb_U_arbif_n165) );
  INV_X2 U_arb_U_arbif_U31 ( .A(U_arb_U_arbif_n98), .ZN(U_arb_U_arbif_n127) );
  INV_X2 U_arb_U_arbif_U30 ( .A(U_arb_U_arbif_n78), .ZN(U_arb_U_arbif_n138) );
  INV_X2 U_arb_U_arbif_U29 ( .A(U_arb_U_arbif_n95), .ZN(U_arb_U_arbif_n124) );
  INV_X2 U_arb_U_arbif_U28 ( .A(U_arb_U_arbif_n97), .ZN(U_arb_U_arbif_n126) );
  INV_X2 U_arb_U_arbif_U27 ( .A(U_arb_U_arbif_n101), .ZN(U_arb_U_arbif_n129)
         );
  NAND3_X2 U_arb_U_arbif_U26 ( .A1(U_arb_U_arbif_n70), .A2(U_arb_U_arbif_n69), 
        .A3(U_arb_U_arbif_n68), .ZN(U_arb_U_arbif_n103) );
  INV_X1 U_arb_U_arbif_U25 ( .A(haddr[0]), .ZN(U_arb_U_arbif_n189) );
  INV_X1 U_arb_U_arbif_U24 ( .A(haddr[1]), .ZN(U_arb_U_arbif_n190) );
  INV_X2 U_arb_U_arbif_U23 ( .A(haddr[3]), .ZN(U_arb_U_arbif_n192) );
  INV_X4 U_arb_U_arbif_U22 ( .A(U_arb_U_arbif_n113), .ZN(U_arb_U_arbif_n115)
         );
  INV_X2 U_arb_U_arbif_U21 ( .A(U_arb_U_arbif_n118), .ZN(U_arb_U_arbif_n117)
         );
  INV_X2 U_arb_U_arbif_U20 ( .A(U_arb_U_arbif_n59), .ZN(U_arb_U_arbif_n75) );
  INV_X2 U_arb_U_arbif_U19 ( .A(U_arb_U_arbif_N72), .ZN(U_arb_U_arbif_n61) );
  OAI21_X1 U_arb_U_arbif_U18 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n25), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n135) );
  OAI21_X1 U_arb_U_arbif_U17 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n27), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n137) );
  OAI21_X1 U_arb_U_arbif_U16 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n21), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n131) );
  OAI21_X1 U_arb_U_arbif_U15 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n22), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n132) );
  OAI21_X1 U_arb_U_arbif_U14 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n23), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n133) );
  NAND2_X1 U_arb_U_arbif_U13 ( .A1(U_arb_U_arbif_n96), .A2(U_arb_U_arbif_n103), 
        .ZN(U_arb_U_arbif_n125) );
  OAI21_X1 U_arb_U_arbif_U12 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n20), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n130) );
  OAI21_X1 U_arb_U_arbif_U11 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n26), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n136) );
  OAI21_X1 U_arb_U_arbif_U10 ( .B1(U_arb_U_arbif_n104), .B2(U_arb_U_arbif_n24), 
        .A(U_arb_U_arbif_n103), .ZN(U_arb_U_arbif_n134) );
  NAND2_X1 U_arb_U_arbif_U9 ( .A1(U_arb_U_arbif_n3), .A2(
        U_arb_U_arbif_nxt_state_0_), .ZN(U_arb_U_arbif_n215) );
  NAND2_X1 U_arb_U_arbif_U8 ( .A1(U_arb_U_arbif_n57), .A2(U_arb_U_arbif_n56), 
        .ZN(U_arb_U_arbif_n3) );
  NAND4_X1 U_arb_U_arbif_U7 ( .A1(U_arb_U_arbif_n76), .A2(U_arb_U_arbif_n1), 
        .A3(U_arb_U_arbif_n75), .A4(U_arb_U_arbif_n2), .ZN(U_arb_clr_arbint)
         );
  NOR3_X1 U_arb_U_arbif_U6 ( .A1(haddr[0]), .A2(haddr[9]), .A3(haddr[8]), .ZN(
        U_arb_U_arbif_n2) );
  NOR4_X1 U_arb_U_arbif_U5 ( .A1(haddr[3]), .A2(U_arb_U_arbif_n74), .A3(
        haddr[1]), .A4(hwrite), .ZN(U_arb_U_arbif_n1) );
  AND4_X1 U_arb_U_arbif_U4 ( .A1(U_arb_U_arbif_n91), .A2(U_arb_U_arbif_n84), 
        .A3(U_arb_U_arbif_n83), .A4(U_arb_U_arbif_n87), .ZN(U_arb_U_arbif_n70)
         );
  OAI22_X1 U_arb_U_arbif_U3 ( .A1(U_arb_U_arbif_n59), .A2(U_arb_U_arbif_n58), 
        .B1(U_arb_U_arbif_r_hwrite_d), .B2(U_arb_U_arbif_n60), .ZN(
        U_arb_U_arbif_n62) );
  DFFS_X2 U_arb_U_arbif_r_haddr_d_reg_2_ ( .D(U_arb_U_arbif_n191), .CK(hclk), 
        .SN(hresetn), .QN(U_arb_U_arbif_r_haddr_d_2_) );
  DFFS_X2 U_arb_U_arbif_r_hready_resp_s0_reg ( .D(U_arb_U_arbif_n215), .CK(
        hclk), .SN(hresetn), .Q(hready_resp_s0), .QN(U_arb_U_arbif_n34) );
  DFFR_X2 U_arb_U_arbif_r_haddr_d_reg_1_ ( .D(U_arb_U_arbif_n160), .CK(hclk), 
        .RN(hresetn), .QN(U_arb_U_arbif_n8) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_0_ ( .D(U_arb_U_arbif_n120), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[0]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_1_ ( .D(U_arb_U_arbif_n121), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[1]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_2_ ( .D(U_arb_U_arbif_n122), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[2]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_3_ ( .D(U_arb_U_arbif_n123), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[3]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_4_ ( .D(U_arb_U_arbif_n124), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[4]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_5_ ( .D(U_arb_U_arbif_n125), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[5]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_6_ ( .D(U_arb_U_arbif_n126), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[6]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_7_ ( .D(U_arb_U_arbif_n127), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[7]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_8_ ( .D(U_arb_U_arbif_n128), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[8]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_9_ ( .D(U_arb_U_arbif_n129), .CK(hclk), 
        .RN(hresetn), .Q(hrdata_s0[9]) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_11_ ( .D(U_arb_U_arbif_n130), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[11]), .QN(U_arb_U_arbif_n20) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_12_ ( .D(U_arb_U_arbif_n131), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[12]), .QN(U_arb_U_arbif_n21) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_13_ ( .D(U_arb_U_arbif_n132), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[13]), .QN(U_arb_U_arbif_n22) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_20_ ( .D(U_arb_U_arbif_n133), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[20]), .QN(U_arb_U_arbif_n23) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_21_ ( .D(U_arb_U_arbif_n134), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[21]), .QN(U_arb_U_arbif_n24) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_25_ ( .D(U_arb_U_arbif_n135), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[25]), .QN(U_arb_U_arbif_n25) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_28_ ( .D(U_arb_U_arbif_n136), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[28]), .QN(U_arb_U_arbif_n26) );
  DFFR_X1 U_arb_U_arbif_ireg_hrdata_reg_29_ ( .D(U_arb_U_arbif_n137), .CK(hclk), .RN(hresetn), .Q(hrdata_s0[29]), .QN(U_arb_U_arbif_n27) );
  DFFR_X1 U_arb_U_arbif_int_ebt_reg ( .D(U_arb_U_arbif_n138), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_arbif_int_ebt) );
  DFFR_X1 U_arb_U_arbif_idef_mst_reg_0_ ( .D(U_arb_U_arbif_n139), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_def_mst_0_), .QN(U_arb_U_arbif_n28) );
  DFFR_X1 U_arb_U_arbif_iebten_reg ( .D(U_arb_U_arbif_n143), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_arbif_ebten), .QN(U_arb_ebten) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_0_ ( .D(U_arb_U_arbif_n144), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[0]), .QN(U_arb_U_arbif_n32) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_1_ ( .D(U_arb_U_arbif_n145), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[1]), .QN(U_arb_U_arbif_n29) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_2_ ( .D(U_arb_U_arbif_n146), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[2]), .QN(U_arb_U_arbif_n30) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_3_ ( .D(U_arb_U_arbif_n147), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[3]), .QN(U_arb_U_arbif_n31) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_4_ ( .D(U_arb_U_arbif_n148), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[4]) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_5_ ( .D(U_arb_U_arbif_n149), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[5]) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_6_ ( .D(U_arb_U_arbif_n150), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[6]) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_7_ ( .D(U_arb_U_arbif_n151), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[7]) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_8_ ( .D(U_arb_U_arbif_n152), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[8]) );
  DFFR_X1 U_arb_U_arbif_iebtcount_reg_9_ ( .D(U_arb_U_arbif_n153), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_ebtcount[9]), .QN(n23) );
  DFFS_X2 U_arb_U_arbif_ipl1_reg_0_ ( .D(U_arb_U_arbif_n154), .CK(hclk), .SN(
        hresetn), .Q(U_arb_U_arbif_ipl1[0]), .QN(U_arb_bus_priority[4]) );
  DFFR_X1 U_arb_U_arbif_ipl1_reg_1_ ( .D(U_arb_U_arbif_n155), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_arbif_ipl1[1]), .QN(U_arb_bus_priority[5]) );
  DFFR_X1 U_arb_U_arbif_ipl1_reg_2_ ( .D(U_arb_U_arbif_n156), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_arbif_ipl1[2]), .QN(U_arb_bus_priority[6]) );
  DFFR_X1 U_arb_U_arbif_ipl1_reg_3_ ( .D(U_arb_U_arbif_n157), .CK(hclk), .RN(
        hresetn), .Q(U_arb_U_arbif_ipl1[3]), .QN(U_arb_bus_priority[7]) );
  DFFR_X1 U_arb_U_arbif_r_hresp_s0_reg_0_ ( .D(U_arb_U_arbif_N72), .CK(hclk), 
        .RN(hresetn), .Q(hresp_s0[0]) );
  DFFR_X1 U_arb_U_arbif_r_state_reg_1_ ( .D(U_arb_U_arbif_nxt_state_1_), .CK(
        hclk), .RN(hresetn), .Q(U_arb_U_arbif_r_state_1_) );
  DFFR_X1 U_arb_U_arbif_r_state_reg_0_ ( .D(U_arb_U_arbif_nxt_state_0_), .CK(
        hclk), .RN(hresetn), .Q(U_arb_U_arbif_r_state_0_) );
  DFFR_X1 U_arb_U_arbif_r_htrans_d_reg_1_ ( .D(U_arb_U_arbif_n158), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_htrans_d_1_), .QN(U_arb_U_arbif_n12)
         );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_0_ ( .D(U_arb_U_arbif_n159), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_0_), .QN(U_arb_U_arbif_n14)
         );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_3_ ( .D(U_arb_U_arbif_n162), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_3_), .QN(U_arb_U_arbif_n13)
         );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_4_ ( .D(U_arb_U_arbif_n163), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_4_), .QN(U_arb_U_arbif_n11)
         );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_5_ ( .D(U_arb_U_arbif_n164), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_5_), .QN(U_arb_U_arbif_n6) );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_6_ ( .D(U_arb_U_arbif_n165), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_6_), .QN(U_arb_U_arbif_n19)
         );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_7_ ( .D(U_arb_U_arbif_n166), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_7_), .QN(U_arb_U_arbif_n17)
         );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_8_ ( .D(U_arb_U_arbif_n167), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_8_) );
  DFFR_X1 U_arb_U_arbif_r_haddr_d_reg_9_ ( .D(U_arb_U_arbif_n168), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_haddr_d_9_) );
  DFFR_X1 U_arb_U_arbif_r_hmaster_d_reg_0_ ( .D(U_arb_U_arbif_n169), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_hmaster_d_0_) );
  DFFR_X1 U_arb_U_arbif_r_hsize_d_reg_0_ ( .D(U_arb_U_arbif_n173), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_hsize_d_0_) );
  DFFR_X1 U_arb_U_arbif_r_hsize_d_reg_1_ ( .D(U_arb_U_arbif_n174), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_hsize_d_1_) );
  DFFR_X1 U_arb_U_arbif_r_hsize_d_reg_2_ ( .D(U_arb_U_arbif_n175), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_hsize_d_2_), .QN(U_arb_U_arbif_n33)
         );
  DFFR_X1 U_arb_U_arbif_r_hwrite_d_reg ( .D(U_arb_U_arbif_n176), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_hwrite_d), .QN(U_arb_U_arbif_n7) );
  DFFR_X1 U_arb_U_arbif_r_hsel_arb_d_reg ( .D(U_arb_U_arbif_n177), .CK(hclk), 
        .RN(hresetn), .Q(U_arb_U_arbif_r_hsel_arb_d), .QN(U_arb_U_arbif_n18)
         );
  OR2_X1 U3 ( .A1(haddr[22]), .A2(haddr[21]), .ZN(U_dcdr_n11) );
  OAI21_X2 U7 ( .B1(U_arb_U_gctrl_n57), .B2(U_arb_U_gctrl_n54), .A(
        U_arb_U_gctrl_n56), .ZN(U_arb_U_gctrl_n59) );
  NAND3_X1 U8 ( .A1(U_arb_U_mask_n17), .A2(U_arb_U_mask_n12), .A3(
        U_arb_U_mask_n14), .ZN(n12) );
  AND3_X1 U9 ( .A1(U_arb_U_gctrl_n25), .A2(U_arb_U_gctrl_n171), .A3(n12), .ZN(
        U_arb_grant_2t[0]) );
  NOR3_X1 U10 ( .A1(haddr[14]), .A2(haddr[15]), .A3(haddr[13]), .ZN(n13) );
  INV_X1 U11 ( .A(haddr[20]), .ZN(n14) );
  NOR4_X2 U12 ( .A1(U_dcdr_n11), .A2(haddr[23]), .A3(U_dcdr_n15), .A4(n14), 
        .ZN(n15) );
  AND4_X1 U13 ( .A1(U_dcdr_n13), .A2(n13), .A3(U_dcdr_n12), .A4(n15), .ZN(
        U_dcdr_n16) );
  OAI21_X1 U14 ( .B1(U_arb_U_gctrl_n25), .B2(U_arb_U_gctrl_r_hmaster_d_0_), 
        .A(hresp[1]), .ZN(n16) );
  AOI211_X1 U15 ( .C1(U_arb_U_gctrl_n25), .C2(U_arb_U_gctrl_r_hmaster_d_0_), 
        .A(U_arb_U_gctrl_n15), .B(n16), .ZN(n17) );
  NOR2_X1 U16 ( .A1(n17), .A2(U_arb_U_gctrl_n57), .ZN(U_arb_U_gctrl_n60) );
  NOR4_X1 U18 ( .A1(n10), .A2(U_dcdr_n16), .A3(hsel_s2), .A4(
        U_arb_U_gctrl_n122), .ZN(U_dfltslv_n5) );
  AOI22_X1 U19 ( .A1(U_arb_ebtcount[0]), .A2(U_arb_U_arbif_n100), .B1(
        hrdata_s0[0]), .B2(U_arb_U_arbif_n102), .ZN(n19) );
  AOI21_X1 U20 ( .B1(U_arb_U_arbif_int_ebt), .B2(U_arb_U_arbif_n84), .A(
        U_arb_U_arbif_n83), .ZN(n20) );
  NOR3_X1 U21 ( .A1(U_arb_U_arbif_n87), .A2(U_arb_U_arbif_n86), .A3(n20), .ZN(
        n21) );
  NAND3_X1 U22 ( .A1(U_arb_U_arbif_n90), .A2(U_arb_U_arbif_n91), .A3(n21), 
        .ZN(n22) );
  OAI211_X1 U23 ( .C1(U_arb_bus_priority[4]), .C2(U_arb_U_arbif_n94), .A(n19), 
        .B(n22), .ZN(U_arb_U_arbif_n120) );
  OAI211_X2 U24 ( .C1(hready_resp_s0), .C2(U_arb_U_arbif_n107), .A(
        U_arb_U_arbif_n61), .B(U_arb_U_arbif_n62), .ZN(U_arb_U_arbif_n66) );
  NOR2_X2 U25 ( .A1(U_mux_n14), .A2(U_mux_n2), .ZN(U_mux_n53) );
  NOR4_X2 U26 ( .A1(U_arb_U_arbif_n84), .A2(U_arb_U_arbif_n67), .A3(
        U_arb_U_arbif_n66), .A4(U_arb_U_arbif_n65), .ZN(U_arb_U_arbif_n100) );
  OAI21_X2 U27 ( .B1(U_arb_U_gctrl_n47), .B2(U_arb_U_gctrl_n107), .A(
        U_arb_U_gctrl_n37), .ZN(U_arb_U_gctrl_nxt_lock_sm_2_) );
  INV_X4 U28 ( .A(U_mux_n58), .ZN(n10) );
  NOR2_X2 U29 ( .A1(U_arb_U_gctrl_n163), .A2(U_arb_U_gctrl_n33), .ZN(
        U_arb_U_gctrl_n54) );
  NOR2_X2 U30 ( .A1(n10), .A2(U_arb_U_gctrl_n122), .ZN(U_arb_U_gctrl_n163) );
endmodule


