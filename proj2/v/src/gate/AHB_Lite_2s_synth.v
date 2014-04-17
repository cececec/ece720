
module AHB_Lite_2s ( HCLK, HRESETn, HADDR, HBURST, HMASTLOCK, HPROT, HSIZE, 
        HTRANS, HWDATA, HWRITE, hsel_s1, hready_resp_s1, hresp_s1, hrdata_s1, 
        hsel_s2, hready_resp_s2, hresp_s2, hrdata_s2, haddr_s, hburst_s, 
        hprot_s, hsize_s, htrans_s, hwdata_s, hwrite_s, HREADY, hresp_ahb, 
        HRDATA, hmaster, hmaster_data, hmastlock_s );
  input [31:0] HADDR;
  input [2:0] HBURST;
  input [3:0] HPROT;
  input [2:0] HSIZE;
  input [1:0] HTRANS;
  input [31:0] HWDATA;
  input [1:0] hresp_s1;
  input [31:0] hrdata_s1;
  input [1:0] hresp_s2;
  input [31:0] hrdata_s2;
  output [31:0] haddr_s;
  output [2:0] hburst_s;
  output [3:0] hprot_s;
  output [2:0] hsize_s;
  output [1:0] htrans_s;
  output [31:0] hwdata_s;
  output [1:0] hresp_ahb;
  output [31:0] HRDATA;
  output [3:0] hmaster;
  output [3:0] hmaster_data;
  input HCLK, HRESETn, HMASTLOCK, HWRITE, hready_resp_s1, hready_resp_s2;
  output hsel_s1, hsel_s2, hwrite_s, hmastlock_s;
  inout HREADY;
  wire   n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403;
  assign HREADY = hready_resp_s1;

  INV_X4 U70 ( .A(1'b1), .ZN(hmastlock_s) );
  INV_X4 U72 ( .A(1'b0), .ZN(hmaster_data[0]) );
  INV_X4 U74 ( .A(1'b1), .ZN(hmaster_data[1]) );
  INV_X4 U76 ( .A(1'b1), .ZN(hmaster_data[2]) );
  INV_X4 U78 ( .A(1'b1), .ZN(hmaster_data[3]) );
  INV_X4 U80 ( .A(1'b0), .ZN(hmaster[0]) );
  INV_X4 U82 ( .A(1'b1), .ZN(hmaster[1]) );
  INV_X4 U84 ( .A(1'b1), .ZN(hmaster[2]) );
  INV_X4 U86 ( .A(1'b1), .ZN(hmaster[3]) );
  INV_X4 U88 ( .A(1'b1), .ZN(hresp_ahb[0]) );
  INV_X4 U90 ( .A(1'b1), .ZN(hresp_ahb[1]) );
  NOR3_X4 U92 ( .A1(HADDR[30]), .A2(HADDR[31]), .A3(HADDR[29]), .ZN(hsel_s1)
         );
  INV_X4 U93 ( .A(n377), .ZN(HRDATA[31]) );
  INV_X4 U94 ( .A(n378), .ZN(HRDATA[30]) );
  INV_X4 U95 ( .A(n380), .ZN(HRDATA[29]) );
  INV_X4 U96 ( .A(n381), .ZN(HRDATA[28]) );
  INV_X4 U97 ( .A(n382), .ZN(HRDATA[27]) );
  INV_X4 U98 ( .A(n383), .ZN(HRDATA[26]) );
  INV_X4 U99 ( .A(n384), .ZN(HRDATA[25]) );
  INV_X4 U100 ( .A(n385), .ZN(HRDATA[24]) );
  INV_X4 U101 ( .A(n386), .ZN(HRDATA[23]) );
  INV_X4 U102 ( .A(n387), .ZN(HRDATA[22]) );
  INV_X4 U103 ( .A(n388), .ZN(HRDATA[21]) );
  INV_X4 U104 ( .A(n389), .ZN(HRDATA[20]) );
  INV_X4 U105 ( .A(n391), .ZN(HRDATA[19]) );
  INV_X4 U106 ( .A(n392), .ZN(HRDATA[18]) );
  INV_X4 U107 ( .A(n393), .ZN(HRDATA[17]) );
  INV_X4 U108 ( .A(n394), .ZN(HRDATA[16]) );
  INV_X4 U109 ( .A(n395), .ZN(HRDATA[15]) );
  INV_X4 U110 ( .A(n396), .ZN(HRDATA[14]) );
  INV_X4 U111 ( .A(n397), .ZN(HRDATA[13]) );
  INV_X4 U112 ( .A(n398), .ZN(HRDATA[12]) );
  INV_X4 U113 ( .A(n399), .ZN(HRDATA[11]) );
  INV_X4 U114 ( .A(n400), .ZN(HRDATA[10]) );
  INV_X4 U115 ( .A(n371), .ZN(HRDATA[9]) );
  INV_X4 U116 ( .A(n372), .ZN(HRDATA[8]) );
  INV_X4 U117 ( .A(n373), .ZN(HRDATA[7]) );
  INV_X4 U118 ( .A(n374), .ZN(HRDATA[6]) );
  INV_X4 U119 ( .A(n375), .ZN(HRDATA[5]) );
  INV_X4 U120 ( .A(n376), .ZN(HRDATA[4]) );
  INV_X4 U121 ( .A(n379), .ZN(HRDATA[3]) );
  INV_X4 U122 ( .A(n390), .ZN(HRDATA[2]) );
  INV_X4 U123 ( .A(n401), .ZN(HRDATA[1]) );
  INV_X4 U124 ( .A(n402), .ZN(HRDATA[0]) );
  NOR3_X4 U125 ( .A1(HADDR[29]), .A2(HADDR[31]), .A3(n403), .ZN(hsel_s2) );
  BUF_X2 U126 ( .A(HADDR[31]), .Z(haddr_s[31]) );
  BUF_X2 U127 ( .A(HADDR[30]), .Z(haddr_s[30]) );
  BUF_X2 U128 ( .A(HADDR[29]), .Z(haddr_s[29]) );
  BUF_X2 U129 ( .A(HADDR[28]), .Z(haddr_s[28]) );
  BUF_X2 U130 ( .A(HADDR[27]), .Z(haddr_s[27]) );
  BUF_X2 U131 ( .A(HADDR[26]), .Z(haddr_s[26]) );
  BUF_X2 U132 ( .A(HADDR[25]), .Z(haddr_s[25]) );
  BUF_X2 U133 ( .A(HADDR[24]), .Z(haddr_s[24]) );
  BUF_X2 U134 ( .A(HADDR[23]), .Z(haddr_s[23]) );
  BUF_X2 U135 ( .A(HADDR[22]), .Z(haddr_s[22]) );
  BUF_X2 U136 ( .A(HADDR[21]), .Z(haddr_s[21]) );
  BUF_X2 U137 ( .A(HADDR[20]), .Z(haddr_s[20]) );
  BUF_X2 U138 ( .A(HADDR[19]), .Z(haddr_s[19]) );
  BUF_X2 U139 ( .A(HADDR[18]), .Z(haddr_s[18]) );
  BUF_X2 U140 ( .A(HADDR[17]), .Z(haddr_s[17]) );
  BUF_X2 U141 ( .A(HADDR[16]), .Z(haddr_s[16]) );
  BUF_X2 U142 ( .A(HADDR[15]), .Z(haddr_s[15]) );
  BUF_X2 U143 ( .A(HADDR[14]), .Z(haddr_s[14]) );
  BUF_X2 U144 ( .A(HADDR[13]), .Z(haddr_s[13]) );
  BUF_X2 U145 ( .A(HADDR[12]), .Z(haddr_s[12]) );
  BUF_X2 U146 ( .A(HADDR[11]), .Z(haddr_s[11]) );
  BUF_X2 U147 ( .A(HADDR[10]), .Z(haddr_s[10]) );
  BUF_X2 U148 ( .A(HADDR[9]), .Z(haddr_s[9]) );
  BUF_X2 U149 ( .A(HADDR[8]), .Z(haddr_s[8]) );
  BUF_X2 U150 ( .A(HADDR[7]), .Z(haddr_s[7]) );
  BUF_X2 U151 ( .A(HADDR[6]), .Z(haddr_s[6]) );
  BUF_X2 U152 ( .A(HADDR[5]), .Z(haddr_s[5]) );
  BUF_X2 U153 ( .A(HADDR[4]), .Z(haddr_s[4]) );
  BUF_X2 U154 ( .A(HADDR[3]), .Z(haddr_s[3]) );
  BUF_X2 U155 ( .A(HADDR[2]), .Z(haddr_s[2]) );
  BUF_X2 U156 ( .A(HADDR[1]), .Z(haddr_s[1]) );
  BUF_X2 U157 ( .A(HADDR[0]), .Z(haddr_s[0]) );
  BUF_X2 U158 ( .A(HBURST[2]), .Z(hburst_s[2]) );
  BUF_X2 U159 ( .A(HBURST[1]), .Z(hburst_s[1]) );
  BUF_X2 U160 ( .A(HBURST[0]), .Z(hburst_s[0]) );
  BUF_X2 U161 ( .A(HPROT[3]), .Z(hprot_s[3]) );
  BUF_X2 U162 ( .A(HPROT[2]), .Z(hprot_s[2]) );
  BUF_X2 U163 ( .A(HPROT[1]), .Z(hprot_s[1]) );
  BUF_X2 U164 ( .A(HPROT[0]), .Z(hprot_s[0]) );
  BUF_X2 U165 ( .A(HSIZE[2]), .Z(hsize_s[2]) );
  BUF_X2 U166 ( .A(HSIZE[1]), .Z(hsize_s[1]) );
  BUF_X2 U167 ( .A(HSIZE[0]), .Z(hsize_s[0]) );
  BUF_X2 U168 ( .A(HTRANS[1]), .Z(htrans_s[1]) );
  BUF_X2 U169 ( .A(HTRANS[0]), .Z(htrans_s[0]) );
  BUF_X2 U170 ( .A(HWDATA[31]), .Z(hwdata_s[31]) );
  BUF_X2 U171 ( .A(HWDATA[30]), .Z(hwdata_s[30]) );
  BUF_X2 U172 ( .A(HWDATA[29]), .Z(hwdata_s[29]) );
  BUF_X2 U173 ( .A(HWDATA[28]), .Z(hwdata_s[28]) );
  BUF_X2 U174 ( .A(HWDATA[27]), .Z(hwdata_s[27]) );
  BUF_X2 U175 ( .A(HWDATA[26]), .Z(hwdata_s[26]) );
  BUF_X2 U176 ( .A(HWDATA[25]), .Z(hwdata_s[25]) );
  BUF_X2 U177 ( .A(HWDATA[24]), .Z(hwdata_s[24]) );
  BUF_X2 U178 ( .A(HWDATA[23]), .Z(hwdata_s[23]) );
  BUF_X2 U179 ( .A(HWDATA[22]), .Z(hwdata_s[22]) );
  BUF_X2 U180 ( .A(HWDATA[21]), .Z(hwdata_s[21]) );
  BUF_X2 U181 ( .A(HWDATA[20]), .Z(hwdata_s[20]) );
  BUF_X2 U182 ( .A(HWDATA[19]), .Z(hwdata_s[19]) );
  BUF_X2 U183 ( .A(HWDATA[18]), .Z(hwdata_s[18]) );
  BUF_X2 U184 ( .A(HWDATA[17]), .Z(hwdata_s[17]) );
  BUF_X2 U185 ( .A(HWDATA[16]), .Z(hwdata_s[16]) );
  BUF_X2 U186 ( .A(HWDATA[15]), .Z(hwdata_s[15]) );
  BUF_X2 U187 ( .A(HWDATA[14]), .Z(hwdata_s[14]) );
  BUF_X2 U188 ( .A(HWDATA[13]), .Z(hwdata_s[13]) );
  BUF_X2 U189 ( .A(HWDATA[12]), .Z(hwdata_s[12]) );
  BUF_X2 U190 ( .A(HWDATA[11]), .Z(hwdata_s[11]) );
  BUF_X2 U191 ( .A(HWDATA[10]), .Z(hwdata_s[10]) );
  BUF_X2 U192 ( .A(HWDATA[9]), .Z(hwdata_s[9]) );
  BUF_X2 U193 ( .A(HWDATA[8]), .Z(hwdata_s[8]) );
  BUF_X2 U194 ( .A(HWDATA[7]), .Z(hwdata_s[7]) );
  BUF_X2 U195 ( .A(HWDATA[6]), .Z(hwdata_s[6]) );
  BUF_X2 U196 ( .A(HWDATA[5]), .Z(hwdata_s[5]) );
  BUF_X2 U197 ( .A(HWDATA[4]), .Z(hwdata_s[4]) );
  BUF_X2 U198 ( .A(HWDATA[3]), .Z(hwdata_s[3]) );
  BUF_X2 U199 ( .A(HWDATA[2]), .Z(hwdata_s[2]) );
  BUF_X2 U200 ( .A(HWDATA[1]), .Z(hwdata_s[1]) );
  BUF_X2 U201 ( .A(HWDATA[0]), .Z(hwdata_s[0]) );
  BUF_X2 U202 ( .A(HWRITE), .Z(hwrite_s) );
  AOI22_X1 U203 ( .A1(hrdata_s1[9]), .A2(hsel_s1), .B1(hrdata_s2[9]), .B2(
        hsel_s2), .ZN(n371) );
  AOI22_X1 U204 ( .A1(hrdata_s1[8]), .A2(hsel_s1), .B1(hrdata_s2[8]), .B2(
        hsel_s2), .ZN(n372) );
  AOI22_X1 U205 ( .A1(hrdata_s1[7]), .A2(hsel_s1), .B1(hrdata_s2[7]), .B2(
        hsel_s2), .ZN(n373) );
  AOI22_X1 U206 ( .A1(hrdata_s1[6]), .A2(hsel_s1), .B1(hrdata_s2[6]), .B2(
        hsel_s2), .ZN(n374) );
  AOI22_X1 U207 ( .A1(hrdata_s1[5]), .A2(hsel_s1), .B1(hrdata_s2[5]), .B2(
        hsel_s2), .ZN(n375) );
  AOI22_X1 U208 ( .A1(hrdata_s1[4]), .A2(hsel_s1), .B1(hrdata_s2[4]), .B2(
        hsel_s2), .ZN(n376) );
  AOI22_X1 U209 ( .A1(hrdata_s1[31]), .A2(hsel_s1), .B1(hrdata_s2[31]), .B2(
        hsel_s2), .ZN(n377) );
  AOI22_X1 U210 ( .A1(hrdata_s1[30]), .A2(hsel_s1), .B1(hrdata_s2[30]), .B2(
        hsel_s2), .ZN(n378) );
  AOI22_X1 U211 ( .A1(hrdata_s1[3]), .A2(hsel_s1), .B1(hrdata_s2[3]), .B2(
        hsel_s2), .ZN(n379) );
  AOI22_X1 U212 ( .A1(hrdata_s1[29]), .A2(hsel_s1), .B1(hrdata_s2[29]), .B2(
        hsel_s2), .ZN(n380) );
  AOI22_X1 U213 ( .A1(hrdata_s1[28]), .A2(hsel_s1), .B1(hrdata_s2[28]), .B2(
        hsel_s2), .ZN(n381) );
  AOI22_X1 U214 ( .A1(hrdata_s1[27]), .A2(hsel_s1), .B1(hrdata_s2[27]), .B2(
        hsel_s2), .ZN(n382) );
  AOI22_X1 U215 ( .A1(hrdata_s1[26]), .A2(hsel_s1), .B1(hrdata_s2[26]), .B2(
        hsel_s2), .ZN(n383) );
  AOI22_X1 U216 ( .A1(hrdata_s1[25]), .A2(hsel_s1), .B1(hrdata_s2[25]), .B2(
        hsel_s2), .ZN(n384) );
  AOI22_X1 U217 ( .A1(hrdata_s1[24]), .A2(hsel_s1), .B1(hrdata_s2[24]), .B2(
        hsel_s2), .ZN(n385) );
  AOI22_X1 U218 ( .A1(hrdata_s1[23]), .A2(hsel_s1), .B1(hrdata_s2[23]), .B2(
        hsel_s2), .ZN(n386) );
  AOI22_X1 U219 ( .A1(hrdata_s1[22]), .A2(hsel_s1), .B1(hrdata_s2[22]), .B2(
        hsel_s2), .ZN(n387) );
  AOI22_X1 U220 ( .A1(hrdata_s1[21]), .A2(hsel_s1), .B1(hrdata_s2[21]), .B2(
        hsel_s2), .ZN(n388) );
  AOI22_X1 U221 ( .A1(hrdata_s1[20]), .A2(hsel_s1), .B1(hrdata_s2[20]), .B2(
        hsel_s2), .ZN(n389) );
  AOI22_X1 U222 ( .A1(hrdata_s1[2]), .A2(hsel_s1), .B1(hrdata_s2[2]), .B2(
        hsel_s2), .ZN(n390) );
  AOI22_X1 U223 ( .A1(hrdata_s1[19]), .A2(hsel_s1), .B1(hrdata_s2[19]), .B2(
        hsel_s2), .ZN(n391) );
  AOI22_X1 U224 ( .A1(hrdata_s1[18]), .A2(hsel_s1), .B1(hrdata_s2[18]), .B2(
        hsel_s2), .ZN(n392) );
  AOI22_X1 U225 ( .A1(hrdata_s1[17]), .A2(hsel_s1), .B1(hrdata_s2[17]), .B2(
        hsel_s2), .ZN(n393) );
  AOI22_X1 U226 ( .A1(hrdata_s1[16]), .A2(hsel_s1), .B1(hrdata_s2[16]), .B2(
        hsel_s2), .ZN(n394) );
  AOI22_X1 U227 ( .A1(hrdata_s1[15]), .A2(hsel_s1), .B1(hrdata_s2[15]), .B2(
        hsel_s2), .ZN(n395) );
  AOI22_X1 U228 ( .A1(hrdata_s1[14]), .A2(hsel_s1), .B1(hrdata_s2[14]), .B2(
        hsel_s2), .ZN(n396) );
  AOI22_X1 U229 ( .A1(hrdata_s1[13]), .A2(hsel_s1), .B1(hrdata_s2[13]), .B2(
        hsel_s2), .ZN(n397) );
  AOI22_X1 U230 ( .A1(hrdata_s1[12]), .A2(hsel_s1), .B1(hrdata_s2[12]), .B2(
        hsel_s2), .ZN(n398) );
  AOI22_X1 U231 ( .A1(hrdata_s1[11]), .A2(hsel_s1), .B1(hrdata_s2[11]), .B2(
        hsel_s2), .ZN(n399) );
  AOI22_X1 U232 ( .A1(hrdata_s1[10]), .A2(hsel_s1), .B1(hrdata_s2[10]), .B2(
        hsel_s2), .ZN(n400) );
  AOI22_X1 U233 ( .A1(hrdata_s1[1]), .A2(hsel_s1), .B1(hrdata_s2[1]), .B2(
        hsel_s2), .ZN(n401) );
  AOI22_X1 U234 ( .A1(hrdata_s1[0]), .A2(hsel_s1), .B1(hrdata_s2[0]), .B2(
        hsel_s2), .ZN(n402) );
  INV_X1 U235 ( .A(HADDR[30]), .ZN(n403) );
endmodule

