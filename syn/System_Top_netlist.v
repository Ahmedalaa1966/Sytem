/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Sat Oct  4 03:50:34 2025
/////////////////////////////////////////////////////////////


module SYS_CNTRL ( CLK, RST, RdData_Valid, ALU_OUT, OUT_Valid, RdData, 
        RX_P_DATA, RX_D_VLD, FIFO_FULL, TX_P_DATA, TX_D_VLD, clk_div_en, 
        ALU_FUN, ALU_EN, CLK_EN, Adrress, WrEn, RdEn, WrData );
  input [15:0] ALU_OUT;
  input [7:0] RdData;
  input [7:0] RX_P_DATA;
  output [7:0] TX_P_DATA;
  output [3:0] ALU_FUN;
  output [3:0] Adrress;
  output [7:0] WrData;
  input CLK, RST, RdData_Valid, OUT_Valid, RX_D_VLD, FIFO_FULL;
  output TX_D_VLD, clk_div_en, ALU_EN, CLK_EN, WrEn, RdEn;
  wire   n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n70, n71, n72, n73;
  wire   [3:0] cs;
  wire   [3:0] ns;
  wire   [3:0] Address_comb;
  tri   CLK;
  tri   RST;

  DFFNSRHX2M \Adrress_reg[2]  ( .D(Address_comb[2]), .CKN(CLK), .SN(1'b1), 
        .RN(RST), .Q(Adrress[2]) );
  DFFNSRHX2M \Adrress_reg[1]  ( .D(Address_comb[1]), .CKN(CLK), .SN(1'b1), 
        .RN(RST), .Q(Adrress[1]) );
  DFFNSRHX2M \Adrress_reg[0]  ( .D(Address_comb[0]), .CKN(CLK), .SN(1'b1), 
        .RN(RST), .Q(Adrress[0]) );
  DFFNSRHX1M \Adrress_reg[3]  ( .D(Address_comb[3]), .CKN(CLK), .SN(1'b1), 
        .RN(RST), .Q(Adrress[3]) );
  DFFRQX2M \cs_reg[1]  ( .D(ns[1]), .CK(CLK), .RN(RST), .Q(cs[1]) );
  DFFRQX1M \cs_reg[2]  ( .D(ns[2]), .CK(CLK), .RN(RST), .Q(cs[2]) );
  DFFRQX1M \cs_reg[3]  ( .D(n9), .CK(CLK), .RN(RST), .Q(cs[3]) );
  DFFRQX1M \cs_reg[0]  ( .D(ns[0]), .CK(CLK), .RN(RST), .Q(cs[0]) );
  NOR3BX2M U6 ( .AN(n29), .B(n17), .C(n37), .Y(n52) );
  NOR2X2M U8 ( .A(n39), .B(n56), .Y(ALU_FUN[2]) );
  NOR2X2M U9 ( .A(n39), .B(n58), .Y(ALU_FUN[0]) );
  OAI22X1M U10 ( .A0(n39), .A1(n15), .B0(OUT_Valid), .B1(n26), .Y(ALU_EN) );
  INVX2M U11 ( .A(WrEn), .Y(n14) );
  NOR2X2M U12 ( .A(n15), .B(n52), .Y(WrEn) );
  INVX2M U13 ( .A(n28), .Y(n17) );
  NOR2X2M U14 ( .A(FIFO_FULL), .B(n51), .Y(TX_D_VLD) );
  INVX2M U15 ( .A(n55), .Y(n22) );
  INVX2M U16 ( .A(FIFO_FULL), .Y(n10) );
  NAND4X2M U17 ( .A(n51), .B(n50), .C(n52), .D(n53), .Y(clk_div_en) );
  NOR4X1M U18 ( .A(n22), .B(n71), .C(n20), .D(n18), .Y(n53) );
  OAI222X1M U19 ( .A0(n31), .A1(n55), .B0(n58), .B1(n50), .C0(n15), .C1(n28), 
        .Y(Address_comb[0]) );
  NAND2X2M U20 ( .A(n47), .B(n73), .Y(n50) );
  NAND3X2M U21 ( .A(n21), .B(n72), .C(n60), .Y(n28) );
  NAND3X2M U22 ( .A(n72), .B(n73), .C(n59), .Y(n55) );
  NOR2X2M U23 ( .A(n49), .B(n50), .Y(Address_comb[3]) );
  NOR2X2M U24 ( .A(n57), .B(n50), .Y(Address_comb[1]) );
  NOR2X2M U25 ( .A(n56), .B(n50), .Y(Address_comb[2]) );
  AND3X2M U26 ( .A(n41), .B(n13), .C(n12), .Y(n31) );
  INVX2M U27 ( .A(n6), .Y(n15) );
  NOR2X2M U28 ( .A(n12), .B(n14), .Y(WrData[4]) );
  NOR2X2M U29 ( .A(n11), .B(n14), .Y(WrData[7]) );
  NOR2X2M U30 ( .A(n39), .B(n57), .Y(ALU_FUN[1]) );
  NOR2X2M U31 ( .A(n52), .B(n58), .Y(WrData[0]) );
  NOR2X2M U32 ( .A(n52), .B(n57), .Y(WrData[1]) );
  NOR2XLM U33 ( .A(n52), .B(n56), .Y(WrData[2]) );
  NOR2XLM U34 ( .A(n52), .B(n49), .Y(WrData[3]) );
  OAI2B11X2M U35 ( .A1N(n36), .A0(n6), .B0(n42), .C0(n43), .Y(ns[0]) );
  AOI31X2M U36 ( .A0(n13), .A1(n12), .A2(n45), .B0(ALU_EN), .Y(n42) );
  AOI221XLM U37 ( .A0(n70), .A1(n10), .B0(n17), .B1(n6), .C0(n38), .Y(n43) );
  NOR2X2M U38 ( .A(n39), .B(n49), .Y(ALU_FUN[3]) );
  NOR2X2M U39 ( .A(n7), .B(n8), .Y(n25) );
  AND2X2M U40 ( .A(n25), .B(n27), .Y(n51) );
  BUFX2M U41 ( .A(n46), .Y(n8) );
  NOR3BX2M U42 ( .AN(n47), .B(n73), .C(n72), .Y(n46) );
  NAND4X2M U43 ( .A(n28), .B(n16), .C(n29), .D(n30), .Y(ns[2]) );
  AOI221XLM U44 ( .A0(n19), .A1(n6), .B0(n31), .B1(n22), .C0(n32), .Y(n30) );
  INVX2M U45 ( .A(n33), .Y(n19) );
  INVX2M U46 ( .A(n39), .Y(n20) );
  INVX2M U47 ( .A(n27), .Y(n70) );
  INVX2M U48 ( .A(RdEn), .Y(n16) );
  INVX2M U49 ( .A(n26), .Y(n18) );
  NAND2X2M U50 ( .A(n50), .B(n29), .Y(n36) );
  INVX2M U51 ( .A(n54), .Y(n71) );
  NOR4X1M U52 ( .A(n5), .B(RX_P_DATA[1]), .C(RX_P_DATA[5]), .D(n49), .Y(n41)
         );
  NAND3X2M U53 ( .A(RX_P_DATA[7]), .B(RX_P_DATA[2]), .C(RX_P_DATA[6]), .Y(n5)
         );
  NOR2BX2M U54 ( .AN(cs[2]), .B(cs[3]), .Y(n60) );
  NAND3X2M U55 ( .A(cs[1]), .B(n21), .C(n60), .Y(n39) );
  NOR2X2M U56 ( .A(n21), .B(cs[2]), .Y(n47) );
  NAND2X2M U57 ( .A(RX_P_DATA[3]), .B(n6), .Y(n49) );
  NOR2X2M U58 ( .A(cs[2]), .B(cs[0]), .Y(n59) );
  NAND3X2M U59 ( .A(n47), .B(n72), .C(cs[3]), .Y(n26) );
  INVX2M U60 ( .A(cs[1]), .Y(n72) );
  NAND2X2M U61 ( .A(RX_P_DATA[0]), .B(n6), .Y(n58) );
  INVX2M U62 ( .A(cs[3]), .Y(n73) );
  OAI21X2M U63 ( .A0(OUT_Valid), .A1(n26), .B0(n39), .Y(CLK_EN) );
  BUFX2M U64 ( .A(RX_D_VLD), .Y(n6) );
  INVX2M U65 ( .A(cs[0]), .Y(n21) );
  INVX2M U66 ( .A(RX_P_DATA[4]), .Y(n12) );
  INVX2M U67 ( .A(RX_P_DATA[0]), .Y(n13) );
  NAND2X2M U68 ( .A(RX_P_DATA[2]), .B(n6), .Y(n56) );
  NAND2X2M U69 ( .A(RX_P_DATA[1]), .B(n6), .Y(n57) );
  NOR3BX2M U70 ( .AN(n59), .B(cs[3]), .C(n72), .Y(n37) );
  NAND3X2M U71 ( .A(cs[0]), .B(n72), .C(n60), .Y(n29) );
  AND2X2M U72 ( .A(RX_P_DATA[5]), .B(WrEn), .Y(WrData[5]) );
  AND2X2M U73 ( .A(RX_P_DATA[6]), .B(WrEn), .Y(WrData[6]) );
  NOR2X2M U74 ( .A(n54), .B(RdData_Valid), .Y(RdEn) );
  NAND3X2M U75 ( .A(cs[1]), .B(cs[0]), .C(n60), .Y(n54) );
  NAND3X2M U76 ( .A(n59), .B(cs[3]), .C(cs[1]), .Y(n27) );
  NOR2X2M U77 ( .A(FIFO_FULL), .B(n69), .Y(TX_P_DATA[0]) );
  AOI222X1M U78 ( .A0(RdData[0]), .A1(n7), .B0(ALU_OUT[8]), .B1(n8), .C0(
        ALU_OUT[0]), .C1(n70), .Y(n69) );
  NOR2X2M U79 ( .A(FIFO_FULL), .B(n68), .Y(TX_P_DATA[1]) );
  AOI222X1M U80 ( .A0(RdData[1]), .A1(n7), .B0(ALU_OUT[9]), .B1(n8), .C0(
        ALU_OUT[1]), .C1(n70), .Y(n68) );
  NOR2X2M U81 ( .A(FIFO_FULL), .B(n67), .Y(TX_P_DATA[2]) );
  AOI222X1M U82 ( .A0(RdData[2]), .A1(n7), .B0(ALU_OUT[10]), .B1(n8), .C0(
        ALU_OUT[2]), .C1(n70), .Y(n67) );
  NOR2X2M U83 ( .A(FIFO_FULL), .B(n66), .Y(TX_P_DATA[3]) );
  AOI222X1M U84 ( .A0(RdData[3]), .A1(n7), .B0(ALU_OUT[11]), .B1(n8), .C0(
        ALU_OUT[3]), .C1(n70), .Y(n66) );
  NOR2X2M U85 ( .A(FIFO_FULL), .B(n65), .Y(TX_P_DATA[4]) );
  AOI222X1M U86 ( .A0(RdData[4]), .A1(n7), .B0(ALU_OUT[12]), .B1(n8), .C0(
        ALU_OUT[4]), .C1(n70), .Y(n65) );
  NOR2X2M U87 ( .A(FIFO_FULL), .B(n64), .Y(TX_P_DATA[5]) );
  AOI222X1M U88 ( .A0(RdData[5]), .A1(n7), .B0(ALU_OUT[13]), .B1(n8), .C0(
        ALU_OUT[5]), .C1(n70), .Y(n64) );
  NOR2X2M U89 ( .A(FIFO_FULL), .B(n63), .Y(TX_P_DATA[6]) );
  AOI222X1M U90 ( .A0(RdData[6]), .A1(n7), .B0(ALU_OUT[14]), .B1(n8), .C0(
        ALU_OUT[6]), .C1(n70), .Y(n63) );
  NOR2X2M U91 ( .A(FIFO_FULL), .B(n61), .Y(TX_P_DATA[7]) );
  AOI222X1M U92 ( .A0(RdData[7]), .A1(n7), .B0(ALU_OUT[15]), .B1(n8), .C0(
        ALU_OUT[7]), .C1(n70), .Y(n61) );
  NAND2X2M U93 ( .A(n34), .B(n35), .Y(ns[1]) );
  AOI221XLM U94 ( .A0(OUT_Valid), .A1(n18), .B0(n6), .B1(n36), .C0(n70), .Y(
        n35) );
  AOI211X2M U95 ( .A0(n37), .A1(n15), .B0(n38), .C0(n32), .Y(n34) );
  NAND3X2M U96 ( .A(n33), .B(n16), .C(n44), .Y(n38) );
  AOI32X1M U97 ( .A0(RX_P_DATA[4]), .A1(RX_P_DATA[0]), .A2(n45), .B0(n8), .B1(
        FIFO_FULL), .Y(n44) );
  INVX2M U98 ( .A(n23), .Y(n9) );
  AOI221XLM U99 ( .A0(n20), .A1(n6), .B0(n71), .B1(RdData_Valid), .C0(n24), 
        .Y(n23) );
  OAI211X2M U100 ( .A0(n10), .A1(n25), .B0(n26), .C0(n27), .Y(n24) );
  BUFX2M U101 ( .A(n62), .Y(n7) );
  NOR3BX2M U102 ( .AN(n59), .B(n73), .C(cs[1]), .Y(n62) );
  AND4X2M U103 ( .A(RX_P_DATA[1]), .B(n22), .C(RX_P_DATA[5]), .D(n48), .Y(n45)
         );
  NOR4X1M U104 ( .A(RX_P_DATA[6]), .B(RX_P_DATA[2]), .C(n49), .D(n11), .Y(n48)
         );
  OAI21X2M U105 ( .A0(n6), .A1(n39), .B0(n40), .Y(n32) );
  NAND4X2M U106 ( .A(RX_P_DATA[4]), .B(RX_P_DATA[0]), .C(n22), .D(n41), .Y(n40) );
  NAND3X2M U107 ( .A(n47), .B(n73), .C(cs[1]), .Y(n33) );
  INVX2M U108 ( .A(RX_P_DATA[7]), .Y(n11) );
endmodule


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, RdData_VLD, 
        REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, \regArr[15][7] , \regArr[15][6] , \regArr[15][5] ,
         \regArr[15][4] , \regArr[15][3] , \regArr[15][2] , \regArr[15][1] ,
         \regArr[15][0] , \regArr[14][7] , \regArr[14][6] , \regArr[14][5] ,
         \regArr[14][4] , \regArr[14][3] , \regArr[14][2] , \regArr[14][1] ,
         \regArr[14][0] , \regArr[13][7] , \regArr[13][6] , \regArr[13][5] ,
         \regArr[13][4] , \regArr[13][3] , \regArr[13][2] , \regArr[13][1] ,
         \regArr[13][0] , \regArr[12][7] , \regArr[12][6] , \regArr[12][5] ,
         \regArr[12][4] , \regArr[12][3] , \regArr[12][2] , \regArr[12][1] ,
         \regArr[12][0] , \regArr[11][7] , \regArr[11][6] , \regArr[11][5] ,
         \regArr[11][4] , \regArr[11][3] , \regArr[11][2] , \regArr[11][1] ,
         \regArr[11][0] , \regArr[10][7] , \regArr[10][6] , \regArr[10][5] ,
         \regArr[10][4] , \regArr[10][3] , \regArr[10][2] , \regArr[10][1] ,
         \regArr[10][0] , \regArr[9][7] , \regArr[9][6] , \regArr[9][5] ,
         \regArr[9][4] , \regArr[9][3] , \regArr[9][2] , \regArr[9][1] ,
         \regArr[9][0] , \regArr[8][7] , \regArr[8][6] , \regArr[8][5] ,
         \regArr[8][4] , \regArr[8][3] , \regArr[8][2] , \regArr[8][1] ,
         \regArr[8][0] , \regArr[7][7] , \regArr[7][6] , \regArr[7][5] ,
         \regArr[7][4] , \regArr[7][3] , \regArr[7][2] , \regArr[7][1] ,
         \regArr[7][0] , \regArr[6][7] , \regArr[6][6] , \regArr[6][5] ,
         \regArr[6][4] , \regArr[6][3] , \regArr[6][2] , \regArr[6][1] ,
         \regArr[6][0] , \regArr[5][7] , \regArr[5][6] , \regArr[5][5] ,
         \regArr[5][4] , \regArr[5][3] , \regArr[5][2] , \regArr[5][1] ,
         \regArr[5][0] , \regArr[4][7] , \regArr[4][6] , \regArr[4][5] ,
         \regArr[4][4] , \regArr[4][3] , \regArr[4][2] , \regArr[4][1] ,
         \regArr[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214;
  tri   CLK;
  tri   RST;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFSQX2M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n1), .Q(REG3[5]) );
  DFFSQX2M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n1), .Q(REG2[0]) );
  DFFSQX2M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .SN(n1), .Q(REG2[7]) );
  DFFRQX2M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n1), .Q(REG1[7]) );
  DFFRQX2M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n1), .Q(REG1[5]) );
  DFFRQX2M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n1), .Q(REG1[4]) );
  DFFRQX2M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n1), .Q(REG1[3]) );
  DFFRQX2M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n1), .Q(REG1[2]) );
  DFFRQX2M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n1), .Q(REG1[1]) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n1), .Q(REG1[0]) );
  DFFRQX2M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n1), .Q(REG2[6]) );
  DFFRQX2M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n1), .Q(REG2[5]) );
  DFFRQX2M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n1), .Q(REG2[3]) );
  DFFRQX2M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n1), .Q(REG2[2]) );
  DFFRQX1M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n1), .Q(RdData_VLD) );
  DFFRQX1M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n1), .Q(REG1[6]) );
  DFFRQX1M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n1), .Q(REG2[4]) );
  DFFRQX1M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n1), .Q(REG2[1]) );
  DFFRQX1M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n1), .Q(\regArr[6][7] ) );
  DFFRQX1M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n1), .Q(\regArr[6][6] ) );
  DFFRQX1M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n1), .Q(\regArr[6][5] ) );
  DFFRQX1M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n1), .Q(\regArr[6][4] ) );
  DFFRQX1M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n1), .Q(\regArr[6][3] ) );
  DFFRQX1M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n1), .Q(\regArr[6][2] )
         );
  DFFRQX1M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n1), .Q(\regArr[6][1] )
         );
  DFFRQX1M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n1), .Q(\regArr[6][0] )
         );
  DFFRQX1M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n1), .Q(\regArr[4][7] )
         );
  DFFRQX1M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n1), .Q(\regArr[4][6] )
         );
  DFFRQX1M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n1), .Q(\regArr[4][5] )
         );
  DFFRQX1M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n1), .Q(\regArr[4][4] )
         );
  DFFRQX1M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n1), .Q(\regArr[4][3] )
         );
  DFFRQX1M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n1), .Q(\regArr[4][2] )
         );
  DFFRQX1M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n1), .Q(\regArr[4][1] )
         );
  DFFRQX1M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n1), .Q(\regArr[4][0] )
         );
  DFFRQX1M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n1), .Q(REG3[7]) );
  DFFRQX1M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n1), .Q(REG3[6]) );
  DFFRQX1M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n1), .Q(REG3[4]) );
  DFFRQX1M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n1), .Q(REG3[3]) );
  DFFRQX1M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n1), .Q(REG3[2]) );
  DFFRQX1M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n1), .Q(REG3[1]) );
  DFFRQX1M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n1), .Q(REG3[0]) );
  DFFRQX1M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n1), .Q(\regArr[7][7] ) );
  DFFRQX1M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n1), .Q(\regArr[7][6] ) );
  DFFRQX1M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n1), .Q(\regArr[7][5] ) );
  DFFRQX1M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n1), .Q(\regArr[7][4] ) );
  DFFRQX1M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n1), .Q(\regArr[7][3] ) );
  DFFRQX1M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n1), .Q(\regArr[7][2] ) );
  DFFRQX1M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n1), .Q(\regArr[7][1] ) );
  DFFRQX1M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n1), .Q(\regArr[7][0] ) );
  DFFRQX1M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n1), .Q(\regArr[5][7] )
         );
  DFFRQX1M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n1), .Q(\regArr[5][6] )
         );
  DFFRQX1M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n1), .Q(\regArr[5][5] )
         );
  DFFRQX1M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n1), .Q(\regArr[5][4] )
         );
  DFFRQX1M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n1), .Q(\regArr[5][3] )
         );
  DFFRQX1M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n1), .Q(\regArr[5][2] )
         );
  DFFRQX1M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n1), .Q(\regArr[5][1] )
         );
  DFFRQX1M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n1), .Q(\regArr[5][0] )
         );
  DFFRQX1M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n1), .Q(REG0[7]) );
  DFFRQX1M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n1), .Q(REG0[6]) );
  DFFRQX1M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n1), .Q(REG0[5]) );
  DFFRQX1M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n1), .Q(REG0[4]) );
  DFFRQX1M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n1), .Q(REG0[3]) );
  DFFRQX1M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n1), .Q(REG0[2]) );
  DFFRQX1M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n1), .Q(REG0[1]) );
  DFFRQX1M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n1), .Q(REG0[0]) );
  DFFRQX1M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n1), .Q(
        \regArr[15][7] ) );
  DFFRQX1M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n1), .Q(
        \regArr[15][6] ) );
  DFFRQX1M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n1), .Q(
        \regArr[15][5] ) );
  DFFRQX1M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n1), .Q(
        \regArr[15][4] ) );
  DFFRQX1M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n1), .Q(
        \regArr[15][3] ) );
  DFFRQX1M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n1), .Q(
        \regArr[15][2] ) );
  DFFRQX1M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n1), .Q(
        \regArr[15][1] ) );
  DFFRQX1M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n1), .Q(
        \regArr[15][0] ) );
  DFFRQX1M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n1), .Q(
        \regArr[14][7] ) );
  DFFRQX1M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n1), .Q(
        \regArr[14][6] ) );
  DFFRQX1M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n1), .Q(
        \regArr[14][5] ) );
  DFFRQX1M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n1), .Q(
        \regArr[14][4] ) );
  DFFRQX1M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n1), .Q(
        \regArr[14][3] ) );
  DFFRQX1M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n1), .Q(
        \regArr[14][2] ) );
  DFFRQX1M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n1), .Q(
        \regArr[14][1] ) );
  DFFRQX1M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n1), .Q(
        \regArr[14][0] ) );
  DFFRQX1M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n1), .Q(
        \regArr[13][7] ) );
  DFFRQX1M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n1), .Q(
        \regArr[13][6] ) );
  DFFRQX1M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n1), .Q(
        \regArr[13][5] ) );
  DFFRQX1M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n1), .Q(
        \regArr[13][4] ) );
  DFFRQX1M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n1), .Q(
        \regArr[13][3] ) );
  DFFRQX1M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n1), .Q(
        \regArr[13][2] ) );
  DFFRQX1M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n1), .Q(
        \regArr[13][1] ) );
  DFFRQX1M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n1), .Q(
        \regArr[13][0] ) );
  DFFRQX1M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n1), .Q(
        \regArr[12][7] ) );
  DFFRQX1M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n1), .Q(
        \regArr[12][6] ) );
  DFFRQX1M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n1), .Q(
        \regArr[12][5] ) );
  DFFRQX1M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n1), .Q(
        \regArr[12][4] ) );
  DFFRQX1M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n1), .Q(
        \regArr[12][3] ) );
  DFFRQX1M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n1), .Q(
        \regArr[12][2] ) );
  DFFRQX1M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n1), .Q(
        \regArr[12][1] ) );
  DFFRQX1M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n1), .Q(
        \regArr[12][0] ) );
  DFFRQX1M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n1), .Q(
        \regArr[11][7] ) );
  DFFRQX1M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n1), .Q(
        \regArr[11][6] ) );
  DFFRQX1M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n1), .Q(
        \regArr[11][5] ) );
  DFFRQX1M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n1), .Q(
        \regArr[11][4] ) );
  DFFRQX1M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n1), .Q(
        \regArr[11][3] ) );
  DFFRQX1M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n1), .Q(
        \regArr[11][2] ) );
  DFFRQX1M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n1), .Q(
        \regArr[11][1] ) );
  DFFRQX1M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n1), .Q(
        \regArr[11][0] ) );
  DFFRQX1M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n1), .Q(
        \regArr[10][7] ) );
  DFFRQX1M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n1), .Q(
        \regArr[10][6] ) );
  DFFRQX1M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n1), .Q(
        \regArr[10][5] ) );
  DFFRQX1M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n1), .Q(
        \regArr[10][4] ) );
  DFFRQX1M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n1), .Q(
        \regArr[10][3] ) );
  DFFRQX1M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n1), .Q(
        \regArr[10][2] ) );
  DFFRQX1M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n1), .Q(
        \regArr[10][1] ) );
  DFFRQX1M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n1), .Q(
        \regArr[10][0] ) );
  DFFRQX1M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n1), .Q(\regArr[9][7] ) );
  DFFRQX1M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n1), .Q(\regArr[9][6] ) );
  DFFRQX1M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n1), .Q(\regArr[9][5] ) );
  DFFRQX1M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n1), .Q(\regArr[9][4] ) );
  DFFRQX1M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n1), .Q(\regArr[9][3] ) );
  DFFRQX1M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n1), .Q(\regArr[9][2] ) );
  DFFRQX1M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n1), .Q(\regArr[9][1] ) );
  DFFRQX1M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n1), .Q(\regArr[9][0] ) );
  DFFRQX1M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n1), .Q(\regArr[8][7] ) );
  DFFRQX1M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n1), .Q(\regArr[8][6] ) );
  DFFRQX1M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n1), .Q(\regArr[8][5] ) );
  DFFRQX1M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n1), .Q(\regArr[8][4] ) );
  DFFRQX1M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n1), .Q(\regArr[8][3] ) );
  DFFRQX1M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n1), .Q(\regArr[8][2] ) );
  DFFRQX1M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n1), .Q(\regArr[8][1] ) );
  DFFRQX1M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n1), .Q(\regArr[8][0] ) );
  DFFRQX1M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n1), .Q(RdData[0]) );
  DFFRQX1M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n1), .Q(RdData[7]) );
  DFFRQX1M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n1), .Q(RdData[6]) );
  DFFRQX1M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n1), .Q(RdData[5]) );
  DFFRQX1M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n1), .Q(RdData[1]) );
  DFFRQX1M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n1), .Q(RdData[4]) );
  DFFRQX1M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n1), .Q(RdData[3]) );
  DFFRQX1M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n1), .Q(RdData[2]) );
  BUFX10M U3 ( .A(RST), .Y(n1) );
  NOR2X2M U4 ( .A(n205), .B(N13), .Y(n20) );
  NOR2X2M U5 ( .A(N12), .B(N13), .Y(n15) );
  NOR2BX2M U6 ( .AN(N13), .B(N12), .Y(n23) );
  NOR2BX2M U7 ( .AN(N13), .B(n205), .Y(n26) );
  INVX2M U8 ( .A(WrData[5]), .Y(n208) );
  INVX2M U9 ( .A(WrData[6]), .Y(n207) );
  INVX2M U10 ( .A(n201), .Y(n202) );
  INVX2M U11 ( .A(n199), .Y(n200) );
  INVX2M U12 ( .A(n201), .Y(n203) );
  BUFX2M U13 ( .A(n204), .Y(n201) );
  BUFX2M U14 ( .A(n205), .Y(n199) );
  INVX2M U15 ( .A(n12), .Y(n214) );
  NOR2BX2M U16 ( .AN(n27), .B(N11), .Y(n16) );
  NOR2BX2M U17 ( .AN(n27), .B(n204), .Y(n18) );
  NOR2BX2M U18 ( .AN(n38), .B(N11), .Y(n30) );
  NOR2BX2M U19 ( .AN(n38), .B(n204), .Y(n32) );
  NAND2X2M U20 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U21 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U22 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U23 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U24 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U25 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U26 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U27 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U28 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U29 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U30 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U31 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U32 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U33 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U34 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U35 ( .A(n15), .B(n16), .Y(n14) );
  INVX2M U36 ( .A(WrData[4]), .Y(n209) );
  INVX2M U37 ( .A(WrData[7]), .Y(n206) );
  NAND2BX2M U38 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  NOR2BX2M U39 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  INVX2M U40 ( .A(WrData[0]), .Y(n213) );
  INVX2M U41 ( .A(WrData[1]), .Y(n212) );
  INVX2M U42 ( .A(WrData[2]), .Y(n211) );
  INVX2M U43 ( .A(WrData[3]), .Y(n210) );
  NOR2BX2M U44 ( .AN(n13), .B(N14), .Y(n27) );
  OAI2BB2X1M U45 ( .B0(n14), .B1(n213), .A0N(REG0[0]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U46 ( .B0(n14), .B1(n212), .A0N(REG0[1]), .A1N(n14), .Y(n50) );
  OAI2BB2X1M U47 ( .B0(n14), .B1(n211), .A0N(REG0[2]), .A1N(n14), .Y(n51) );
  OAI2BB2X1M U48 ( .B0(n14), .B1(n210), .A0N(REG0[3]), .A1N(n14), .Y(n52) );
  OAI2BB2X1M U49 ( .B0(n14), .B1(n209), .A0N(REG0[4]), .A1N(n14), .Y(n53) );
  OAI2BB2X1M U50 ( .B0(n14), .B1(n208), .A0N(REG0[5]), .A1N(n14), .Y(n54) );
  OAI2BB2X1M U51 ( .B0(n14), .B1(n207), .A0N(REG0[6]), .A1N(n14), .Y(n55) );
  OAI2BB2X1M U52 ( .B0(n14), .B1(n206), .A0N(REG0[7]), .A1N(n14), .Y(n56) );
  OAI2BB2X1M U53 ( .B0(n212), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n66) );
  OAI2BB2X1M U54 ( .B0(n211), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n67) );
  OAI2BB2X1M U55 ( .B0(n210), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n68) );
  OAI2BB2X1M U56 ( .B0(n209), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n69) );
  OAI2BB2X1M U57 ( .B0(n208), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n70) );
  OAI2BB2X1M U58 ( .B0(n207), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n71) );
  OAI2BB2X1M U59 ( .B0(n213), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U60 ( .B0(n212), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n74) );
  OAI2BB2X1M U61 ( .B0(n211), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n75) );
  OAI2BB2X1M U62 ( .B0(n210), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n76) );
  OAI2BB2X1M U63 ( .B0(n209), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n77) );
  OAI2BB2X1M U64 ( .B0(n207), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n79) );
  OAI2BB2X1M U65 ( .B0(n206), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n80) );
  OAI2BB2X1M U66 ( .B0(n213), .B1(n22), .A0N(\regArr[4][0] ), .A1N(n22), .Y(
        n81) );
  OAI2BB2X1M U67 ( .B0(n212), .B1(n22), .A0N(\regArr[4][1] ), .A1N(n22), .Y(
        n82) );
  OAI2BB2X1M U68 ( .B0(n211), .B1(n22), .A0N(\regArr[4][2] ), .A1N(n22), .Y(
        n83) );
  OAI2BB2X1M U69 ( .B0(n210), .B1(n22), .A0N(\regArr[4][3] ), .A1N(n22), .Y(
        n84) );
  OAI2BB2X1M U70 ( .B0(n209), .B1(n22), .A0N(\regArr[4][4] ), .A1N(n22), .Y(
        n85) );
  OAI2BB2X1M U71 ( .B0(n208), .B1(n22), .A0N(\regArr[4][5] ), .A1N(n22), .Y(
        n86) );
  OAI2BB2X1M U72 ( .B0(n207), .B1(n22), .A0N(\regArr[4][6] ), .A1N(n22), .Y(
        n87) );
  OAI2BB2X1M U73 ( .B0(n206), .B1(n22), .A0N(\regArr[4][7] ), .A1N(n22), .Y(
        n88) );
  OAI2BB2X1M U74 ( .B0(n213), .B1(n24), .A0N(\regArr[5][0] ), .A1N(n24), .Y(
        n89) );
  OAI2BB2X1M U75 ( .B0(n212), .B1(n24), .A0N(\regArr[5][1] ), .A1N(n24), .Y(
        n90) );
  OAI2BB2X1M U76 ( .B0(n211), .B1(n24), .A0N(\regArr[5][2] ), .A1N(n24), .Y(
        n91) );
  OAI2BB2X1M U77 ( .B0(n210), .B1(n24), .A0N(\regArr[5][3] ), .A1N(n24), .Y(
        n92) );
  OAI2BB2X1M U78 ( .B0(n209), .B1(n24), .A0N(\regArr[5][4] ), .A1N(n24), .Y(
        n93) );
  OAI2BB2X1M U79 ( .B0(n208), .B1(n24), .A0N(\regArr[5][5] ), .A1N(n24), .Y(
        n94) );
  OAI2BB2X1M U80 ( .B0(n207), .B1(n24), .A0N(\regArr[5][6] ), .A1N(n24), .Y(
        n95) );
  OAI2BB2X1M U81 ( .B0(n206), .B1(n24), .A0N(\regArr[5][7] ), .A1N(n24), .Y(
        n96) );
  OAI2BB2X1M U82 ( .B0(n213), .B1(n25), .A0N(\regArr[6][0] ), .A1N(n25), .Y(
        n97) );
  OAI2BB2X1M U83 ( .B0(n212), .B1(n25), .A0N(\regArr[6][1] ), .A1N(n25), .Y(
        n98) );
  OAI2BB2X1M U84 ( .B0(n211), .B1(n25), .A0N(\regArr[6][2] ), .A1N(n25), .Y(
        n99) );
  OAI2BB2X1M U85 ( .B0(n210), .B1(n25), .A0N(\regArr[6][3] ), .A1N(n25), .Y(
        n100) );
  OAI2BB2X1M U86 ( .B0(n209), .B1(n25), .A0N(\regArr[6][4] ), .A1N(n25), .Y(
        n101) );
  OAI2BB2X1M U87 ( .B0(n208), .B1(n25), .A0N(\regArr[6][5] ), .A1N(n25), .Y(
        n102) );
  OAI2BB2X1M U88 ( .B0(n207), .B1(n25), .A0N(\regArr[6][6] ), .A1N(n25), .Y(
        n103) );
  OAI2BB2X1M U89 ( .B0(n206), .B1(n25), .A0N(\regArr[6][7] ), .A1N(n25), .Y(
        n104) );
  OAI2BB2X1M U90 ( .B0(n213), .B1(n28), .A0N(\regArr[7][0] ), .A1N(n28), .Y(
        n105) );
  OAI2BB2X1M U91 ( .B0(n212), .B1(n28), .A0N(\regArr[7][1] ), .A1N(n28), .Y(
        n106) );
  OAI2BB2X1M U92 ( .B0(n211), .B1(n28), .A0N(\regArr[7][2] ), .A1N(n28), .Y(
        n107) );
  OAI2BB2X1M U93 ( .B0(n210), .B1(n28), .A0N(\regArr[7][3] ), .A1N(n28), .Y(
        n108) );
  OAI2BB2X1M U94 ( .B0(n209), .B1(n28), .A0N(\regArr[7][4] ), .A1N(n28), .Y(
        n109) );
  OAI2BB2X1M U95 ( .B0(n208), .B1(n28), .A0N(\regArr[7][5] ), .A1N(n28), .Y(
        n110) );
  OAI2BB2X1M U96 ( .B0(n207), .B1(n28), .A0N(\regArr[7][6] ), .A1N(n28), .Y(
        n111) );
  OAI2BB2X1M U97 ( .B0(n206), .B1(n28), .A0N(\regArr[7][7] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U98 ( .B0(n213), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U99 ( .B0(n212), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n58) );
  OAI2BB2X1M U100 ( .B0(n211), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n59) );
  OAI2BB2X1M U101 ( .B0(n210), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n60) );
  OAI2BB2X1M U102 ( .B0(n209), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n61) );
  OAI2BB2X1M U103 ( .B0(n208), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n62) );
  OAI2BB2X1M U104 ( .B0(n207), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n63) );
  OAI2BB2X1M U105 ( .B0(n206), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n64) );
  OAI2BB2X1M U106 ( .B0(n213), .B1(n29), .A0N(\regArr[8][0] ), .A1N(n29), .Y(
        n113) );
  OAI2BB2X1M U107 ( .B0(n212), .B1(n29), .A0N(\regArr[8][1] ), .A1N(n29), .Y(
        n114) );
  OAI2BB2X1M U108 ( .B0(n211), .B1(n29), .A0N(\regArr[8][2] ), .A1N(n29), .Y(
        n115) );
  OAI2BB2X1M U109 ( .B0(n210), .B1(n29), .A0N(\regArr[8][3] ), .A1N(n29), .Y(
        n116) );
  OAI2BB2X1M U110 ( .B0(n209), .B1(n29), .A0N(\regArr[8][4] ), .A1N(n29), .Y(
        n117) );
  OAI2BB2X1M U111 ( .B0(n208), .B1(n29), .A0N(\regArr[8][5] ), .A1N(n29), .Y(
        n118) );
  OAI2BB2X1M U112 ( .B0(n207), .B1(n29), .A0N(\regArr[8][6] ), .A1N(n29), .Y(
        n119) );
  OAI2BB2X1M U113 ( .B0(n206), .B1(n29), .A0N(\regArr[8][7] ), .A1N(n29), .Y(
        n120) );
  OAI2BB2X1M U114 ( .B0(n213), .B1(n31), .A0N(\regArr[9][0] ), .A1N(n31), .Y(
        n121) );
  OAI2BB2X1M U115 ( .B0(n212), .B1(n31), .A0N(\regArr[9][1] ), .A1N(n31), .Y(
        n122) );
  OAI2BB2X1M U116 ( .B0(n211), .B1(n31), .A0N(\regArr[9][2] ), .A1N(n31), .Y(
        n123) );
  OAI2BB2X1M U117 ( .B0(n210), .B1(n31), .A0N(\regArr[9][3] ), .A1N(n31), .Y(
        n124) );
  OAI2BB2X1M U118 ( .B0(n209), .B1(n31), .A0N(\regArr[9][4] ), .A1N(n31), .Y(
        n125) );
  OAI2BB2X1M U119 ( .B0(n208), .B1(n31), .A0N(\regArr[9][5] ), .A1N(n31), .Y(
        n126) );
  OAI2BB2X1M U120 ( .B0(n207), .B1(n31), .A0N(\regArr[9][6] ), .A1N(n31), .Y(
        n127) );
  OAI2BB2X1M U121 ( .B0(n206), .B1(n31), .A0N(\regArr[9][7] ), .A1N(n31), .Y(
        n128) );
  OAI2BB2X1M U122 ( .B0(n213), .B1(n33), .A0N(\regArr[10][0] ), .A1N(n33), .Y(
        n129) );
  OAI2BB2X1M U123 ( .B0(n212), .B1(n33), .A0N(\regArr[10][1] ), .A1N(n33), .Y(
        n130) );
  OAI2BB2X1M U124 ( .B0(n211), .B1(n33), .A0N(\regArr[10][2] ), .A1N(n33), .Y(
        n131) );
  OAI2BB2X1M U125 ( .B0(n210), .B1(n33), .A0N(\regArr[10][3] ), .A1N(n33), .Y(
        n132) );
  OAI2BB2X1M U126 ( .B0(n209), .B1(n33), .A0N(\regArr[10][4] ), .A1N(n33), .Y(
        n133) );
  OAI2BB2X1M U127 ( .B0(n208), .B1(n33), .A0N(\regArr[10][5] ), .A1N(n33), .Y(
        n134) );
  OAI2BB2X1M U128 ( .B0(n207), .B1(n33), .A0N(\regArr[10][6] ), .A1N(n33), .Y(
        n135) );
  OAI2BB2X1M U129 ( .B0(n206), .B1(n33), .A0N(\regArr[10][7] ), .A1N(n33), .Y(
        n136) );
  OAI2BB2X1M U130 ( .B0(n213), .B1(n34), .A0N(\regArr[11][0] ), .A1N(n34), .Y(
        n137) );
  OAI2BB2X1M U131 ( .B0(n212), .B1(n34), .A0N(\regArr[11][1] ), .A1N(n34), .Y(
        n138) );
  OAI2BB2X1M U132 ( .B0(n211), .B1(n34), .A0N(\regArr[11][2] ), .A1N(n34), .Y(
        n139) );
  OAI2BB2X1M U133 ( .B0(n210), .B1(n34), .A0N(\regArr[11][3] ), .A1N(n34), .Y(
        n140) );
  OAI2BB2X1M U134 ( .B0(n209), .B1(n34), .A0N(\regArr[11][4] ), .A1N(n34), .Y(
        n141) );
  OAI2BB2X1M U135 ( .B0(n208), .B1(n34), .A0N(\regArr[11][5] ), .A1N(n34), .Y(
        n142) );
  OAI2BB2X1M U136 ( .B0(n207), .B1(n34), .A0N(\regArr[11][6] ), .A1N(n34), .Y(
        n143) );
  OAI2BB2X1M U137 ( .B0(n206), .B1(n34), .A0N(\regArr[11][7] ), .A1N(n34), .Y(
        n144) );
  OAI2BB2X1M U138 ( .B0(n213), .B1(n35), .A0N(\regArr[12][0] ), .A1N(n35), .Y(
        n145) );
  OAI2BB2X1M U139 ( .B0(n212), .B1(n35), .A0N(\regArr[12][1] ), .A1N(n35), .Y(
        n146) );
  OAI2BB2X1M U140 ( .B0(n211), .B1(n35), .A0N(\regArr[12][2] ), .A1N(n35), .Y(
        n147) );
  OAI2BB2X1M U141 ( .B0(n210), .B1(n35), .A0N(\regArr[12][3] ), .A1N(n35), .Y(
        n148) );
  OAI2BB2X1M U142 ( .B0(n209), .B1(n35), .A0N(\regArr[12][4] ), .A1N(n35), .Y(
        n149) );
  OAI2BB2X1M U143 ( .B0(n208), .B1(n35), .A0N(\regArr[12][5] ), .A1N(n35), .Y(
        n150) );
  OAI2BB2X1M U144 ( .B0(n207), .B1(n35), .A0N(\regArr[12][6] ), .A1N(n35), .Y(
        n151) );
  OAI2BB2X1M U145 ( .B0(n206), .B1(n35), .A0N(\regArr[12][7] ), .A1N(n35), .Y(
        n152) );
  OAI2BB2X1M U146 ( .B0(n213), .B1(n36), .A0N(\regArr[13][0] ), .A1N(n36), .Y(
        n153) );
  OAI2BB2X1M U147 ( .B0(n212), .B1(n36), .A0N(\regArr[13][1] ), .A1N(n36), .Y(
        n154) );
  OAI2BB2X1M U148 ( .B0(n211), .B1(n36), .A0N(\regArr[13][2] ), .A1N(n36), .Y(
        n155) );
  OAI2BB2X1M U149 ( .B0(n210), .B1(n36), .A0N(\regArr[13][3] ), .A1N(n36), .Y(
        n156) );
  OAI2BB2X1M U150 ( .B0(n209), .B1(n36), .A0N(\regArr[13][4] ), .A1N(n36), .Y(
        n157) );
  OAI2BB2X1M U151 ( .B0(n208), .B1(n36), .A0N(\regArr[13][5] ), .A1N(n36), .Y(
        n158) );
  OAI2BB2X1M U152 ( .B0(n207), .B1(n36), .A0N(\regArr[13][6] ), .A1N(n36), .Y(
        n159) );
  OAI2BB2X1M U153 ( .B0(n206), .B1(n36), .A0N(\regArr[13][7] ), .A1N(n36), .Y(
        n160) );
  OAI2BB2X1M U154 ( .B0(n213), .B1(n37), .A0N(\regArr[14][0] ), .A1N(n37), .Y(
        n161) );
  OAI2BB2X1M U155 ( .B0(n212), .B1(n37), .A0N(\regArr[14][1] ), .A1N(n37), .Y(
        n162) );
  OAI2BB2X1M U156 ( .B0(n211), .B1(n37), .A0N(\regArr[14][2] ), .A1N(n37), .Y(
        n163) );
  OAI2BB2X1M U157 ( .B0(n210), .B1(n37), .A0N(\regArr[14][3] ), .A1N(n37), .Y(
        n164) );
  OAI2BB2X1M U158 ( .B0(n209), .B1(n37), .A0N(\regArr[14][4] ), .A1N(n37), .Y(
        n165) );
  OAI2BB2X1M U159 ( .B0(n208), .B1(n37), .A0N(\regArr[14][5] ), .A1N(n37), .Y(
        n166) );
  OAI2BB2X1M U160 ( .B0(n207), .B1(n37), .A0N(\regArr[14][6] ), .A1N(n37), .Y(
        n167) );
  OAI2BB2X1M U161 ( .B0(n206), .B1(n37), .A0N(\regArr[14][7] ), .A1N(n37), .Y(
        n168) );
  OAI2BB2X1M U162 ( .B0(n213), .B1(n39), .A0N(\regArr[15][0] ), .A1N(n39), .Y(
        n169) );
  OAI2BB2X1M U163 ( .B0(n212), .B1(n39), .A0N(\regArr[15][1] ), .A1N(n39), .Y(
        n170) );
  OAI2BB2X1M U164 ( .B0(n211), .B1(n39), .A0N(\regArr[15][2] ), .A1N(n39), .Y(
        n171) );
  OAI2BB2X1M U165 ( .B0(n210), .B1(n39), .A0N(\regArr[15][3] ), .A1N(n39), .Y(
        n172) );
  OAI2BB2X1M U166 ( .B0(n209), .B1(n39), .A0N(\regArr[15][4] ), .A1N(n39), .Y(
        n173) );
  OAI2BB2X1M U167 ( .B0(n208), .B1(n39), .A0N(\regArr[15][5] ), .A1N(n39), .Y(
        n174) );
  OAI2BB2X1M U168 ( .B0(n207), .B1(n39), .A0N(\regArr[15][6] ), .A1N(n39), .Y(
        n175) );
  OAI2BB2X1M U169 ( .B0(n206), .B1(n39), .A0N(\regArr[15][7] ), .A1N(n39), .Y(
        n176) );
  OAI2BB2X1M U170 ( .B0(n213), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U171 ( .B0(n206), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n72) );
  OAI2BB2X1M U172 ( .B0(n208), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n78) );
  AO22X1M U173 ( .A0(N43), .A1(n214), .B0(RdData[0]), .B1(n12), .Y(n40) );
  MX4X1M U174 ( .A(n5), .B(n3), .C(n4), .D(n2), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U175 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(N11), 
        .S1(N12), .Y(n5) );
  MX4X1M U176 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(N12), .Y(n3) );
  AO22X1M U177 ( .A0(N41), .A1(n214), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4X1M U178 ( .A(n178), .B(n11), .C(n177), .D(n10), .S0(N14), .S1(N13), .Y(
        N41) );
  MX4X1M U179 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n202), 
        .S1(n200), .Y(n178) );
  MX4X1M U180 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n202), .S1(n200), .Y(n11) );
  AO22X1M U181 ( .A0(N40), .A1(n214), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4X1M U182 ( .A(n182), .B(n180), .C(n181), .D(n179), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4X1M U183 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n202), 
        .S1(n200), .Y(n182) );
  MX4X1M U184 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n202), .S1(n200), .Y(n180) );
  AO22X1M U185 ( .A0(N39), .A1(n214), .B0(RdData[4]), .B1(n12), .Y(n44) );
  MX4X1M U186 ( .A(n186), .B(n184), .C(n185), .D(n183), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U187 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n203), 
        .S1(n200), .Y(n186) );
  MX4X1M U188 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n202), .S1(n200), .Y(n184) );
  AO22X1M U189 ( .A0(N38), .A1(n214), .B0(RdData[5]), .B1(n12), .Y(n45) );
  MX4X1M U190 ( .A(n190), .B(n188), .C(n189), .D(n187), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U191 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n203), 
        .S1(N12), .Y(n190) );
  MX4X1M U192 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n203), .S1(N12), .Y(n188) );
  AO22X1M U193 ( .A0(N37), .A1(n214), .B0(RdData[6]), .B1(n12), .Y(n46) );
  MX4X1M U194 ( .A(n194), .B(n192), .C(n193), .D(n191), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U195 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n203), 
        .S1(N12), .Y(n194) );
  MX4X1M U196 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n203), .S1(N12), .Y(n192) );
  AO22X1M U197 ( .A0(N36), .A1(n214), .B0(RdData[7]), .B1(n12), .Y(n47) );
  MX4X1M U198 ( .A(n198), .B(n196), .C(n197), .D(n195), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U199 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n203), 
        .S1(N12), .Y(n198) );
  MX4X1M U200 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n203), .S1(N12), .Y(n196) );
  MX4X1M U201 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n202), 
        .S1(N12), .Y(n9) );
  MX4X1M U202 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(N11), .S1(N12), .Y(n4) );
  MX4X1M U203 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(n202), .S1(N12), .Y(n8) );
  MX4X1M U204 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n202), .S1(n200), .Y(n177) );
  MX4X1M U205 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n202), .S1(n200), .Y(n181) );
  MX4X1M U206 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n202), .S1(n200), .Y(n185) );
  MX4X1M U207 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n203), .S1(N12), .Y(n189) );
  MX4X1M U208 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n203), .S1(N12), .Y(n193) );
  MX4X1M U209 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n203), .S1(N12), .Y(n197) );
  MX4X1M U210 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n203), .S1(n200), .Y(n2) );
  MX4X1M U211 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n202), .S1(n200), .Y(n10) );
  MX4X1M U212 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n202), .S1(n200), .Y(n179) );
  MX4X1M U213 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n202), .S1(n200), .Y(n183) );
  MX4X1M U214 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n203), .S1(N12), .Y(n187) );
  MX4X1M U215 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n203), .S1(N12), .Y(n191) );
  MX4X1M U216 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n203), .S1(N12), .Y(n195) );
  AND2X2M U217 ( .A(N14), .B(n13), .Y(n38) );
  AO22X1M U218 ( .A0(N42), .A1(n214), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4X1M U219 ( .A(n9), .B(n7), .C(n8), .D(n6), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U220 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(N12), .Y(n7) );
  MX4X1M U221 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n202), .S1(n200), .Y(n6) );
  INVX2M U222 ( .A(N11), .Y(n204) );
  INVX2M U223 ( .A(N12), .Y(n205) );
  OAI2BB1X2M U224 ( .A0N(RdData_VLD), .A1N(n13), .B0(n12), .Y(n48) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U2 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  INVX2M U8 ( .A(B[1]), .Y(n8) );
  NAND2X2M U9 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n14, n13, n15, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n7), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n6), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n8), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U13 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U14 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U15 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U16 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U17 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U18 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U21 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U22 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U23 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  CLKXOR2X2M U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  AND2X2M U25 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U33 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U34 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U35 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  INVX2M U37 ( .A(A[0]), .Y(n39) );
  INVX2M U38 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U39 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U40 ( .A(A[3]), .Y(n36) );
  INVX2M U41 ( .A(A[2]), .Y(n37) );
  INVX2M U42 ( .A(A[4]), .Y(n35) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140;
  wire   [15:0] ALU_OUT_Comb;
  tri   RST;

  ALU_DW_div_uns_0 div_52 ( .a({n12, n11, n10, n9, n8, n7, n6, n5}), .b({B[7], 
        n4, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, N126, 
        N125}) );
  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n12, n11, n10, n9, n8, n7, n6, n5}), .B({
        1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_49 ( .A({n12, n11, n10, n9, n8, n7, n6, n5}), .B({B[7], 
        n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, N119, 
        N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX1M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX1M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX1M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX1M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX1M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX1M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX1M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX1M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX1M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX1M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX1M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX1M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX1M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX1M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX1M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  OAI2BB1X2M U4 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  OAI2BB1X2M U7 ( .A0N(n126), .A1N(n105), .B0(n101), .Y(n47) );
  NOR2BX2M U8 ( .AN(n106), .B(n124), .Y(n37) );
  AND2X2M U9 ( .A(n99), .B(n105), .Y(n42) );
  AND2X2M U10 ( .A(n106), .B(n105), .Y(n50) );
  BUFX2M U11 ( .A(n41), .Y(n13) );
  NOR2X2M U12 ( .A(n107), .B(n124), .Y(n41) );
  INVX2M U13 ( .A(n100), .Y(n124) );
  INVX2M U14 ( .A(n91), .Y(n125) );
  INVX2M U15 ( .A(n107), .Y(n126) );
  OAI2BB1X2M U16 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U17 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U18 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U19 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U20 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U21 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U22 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  INVX2M U23 ( .A(ALU_FUN[1]), .Y(n127) );
  AND2X2M U24 ( .A(ALU_FUN[2]), .B(n127), .Y(n99) );
  AND4X2M U25 ( .A(N159), .B(n99), .C(n3), .D(n128), .Y(n90) );
  NOR3BX2M U26 ( .AN(n105), .B(n127), .C(ALU_FUN[2]), .Y(n49) );
  NOR3X2M U27 ( .A(n124), .B(ALU_FUN[2]), .C(n127), .Y(n35) );
  NOR2X2M U28 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U29 ( .A(n106), .B(n128), .C(n3), .Y(n46) );
  NAND3X2M U30 ( .A(n126), .B(n128), .C(n3), .Y(n36) );
  NAND2X2M U31 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U32 ( .A(ALU_FUN[0]), .Y(n128) );
  NOR2X2M U33 ( .A(n128), .B(n3), .Y(n105) );
  NOR2X2M U34 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  NAND3X2M U35 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  NOR2BX2M U36 ( .AN(n35), .B(n129), .Y(n31) );
  NAND3X2M U37 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  AOI31X2M U38 ( .A0(n93), .A1(n94), .A2(n95), .B0(n129), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U39 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U40 ( .A0(n13), .A1(n140), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U41 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U42 ( .A0(n81), .A1(n82), .A2(n83), .B0(n129), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U43 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U44 ( .A0(n7), .A1(n125), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U45 ( .A0(N126), .A1(n49), .B0(n13), .B1(n139), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U46 ( .A0(n75), .A1(n76), .A2(n77), .B0(n129), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U47 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U48 ( .A0(n8), .A1(n125), .B0(n13), .B1(n138), .C0(n78), .Y(n77)
         );
  AOI222X1M U49 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U50 ( .A0(n69), .A1(n70), .A2(n71), .B0(n129), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U51 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U52 ( .A0(n9), .A1(n125), .B0(n13), .B1(n137), .C0(n72), .Y(n71)
         );
  AOI222X1M U53 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U54 ( .A0(n63), .A1(n64), .A2(n65), .B0(n129), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U55 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U56 ( .A0(n125), .A1(n10), .B0(n13), .B1(n136), .C0(n66), .Y(n65)
         );
  AOI222X1M U57 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U58 ( .A0(n51), .A1(n52), .A2(n53), .B0(n129), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U59 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U60 ( .A0(n125), .A1(n12), .B0(n13), .B1(n134), .C0(n54), .Y(n53)
         );
  AOI222X1M U61 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  AOI31X2M U62 ( .A0(n57), .A1(n58), .A2(n59), .B0(n129), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U63 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U64 ( .A0(n125), .A1(n11), .B0(n13), .B1(n135), .C0(n60), .Y(n59)
         );
  AOI222X1M U65 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U66 ( .A0(n38), .A1(n39), .A2(n40), .B0(n129), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U67 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U68 ( .A0(n13), .A1(n133), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U69 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U70 ( .A0(n33), .A1(n34), .B0(n129), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U71 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U72 ( .B0(N117), .B1(n35), .A0N(n133), .A1N(n36), .Y(n34) );
  OAI222X1M U73 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n135), 
        .Y(n54) );
  AOI221XLM U74 ( .A0(n11), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n56)
         );
  AOI221XLM U75 ( .A0(n46), .A1(n134), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U76 ( .A(n4), .Y(n122) );
  NAND2X2M U77 ( .A(EN), .B(n123), .Y(n32) );
  INVX2M U78 ( .A(n92), .Y(n123) );
  AOI211X2M U79 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  BUFX2M U80 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U81 ( .A(EN), .Y(n129) );
  INVX2M U82 ( .A(n6), .Y(n139) );
  INVX2M U83 ( .A(n5), .Y(n140) );
  INVX2M U84 ( .A(n11), .Y(n134) );
  INVX2M U85 ( .A(n12), .Y(n133) );
  INVX2M U86 ( .A(n8), .Y(n137) );
  INVX2M U87 ( .A(n7), .Y(n138) );
  INVX2M U88 ( .A(n10), .Y(n135) );
  INVX2M U89 ( .A(n9), .Y(n136) );
  BUFX2M U90 ( .A(B[6]), .Y(n4) );
  BUFX2M U91 ( .A(A[7]), .Y(n12) );
  BUFX2M U92 ( .A(A[5]), .Y(n10) );
  BUFX2M U93 ( .A(A[4]), .Y(n9) );
  BUFX2M U94 ( .A(A[3]), .Y(n8) );
  BUFX2M U95 ( .A(A[2]), .Y(n7) );
  BUFX2M U96 ( .A(A[1]), .Y(n6) );
  BUFX2M U97 ( .A(A[0]), .Y(n5) );
  INVX2M U98 ( .A(n25), .Y(n120) );
  OAI2B2X1M U99 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n139), .Y(n97) );
  AOI221XLM U100 ( .A0(n46), .A1(n140), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  OAI2B2X1M U101 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n140), .Y(n85) );
  AOI221XLM U102 ( .A0(n46), .A1(n139), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  OAI222X1M U103 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n139), .Y(n78) );
  AOI221XLM U104 ( .A0(n7), .A1(n46), .B0(n47), .B1(n138), .C0(n13), .Y(n80)
         );
  AOI221XLM U105 ( .A0(n46), .A1(n138), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U106 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n138), .Y(n72) );
  AOI221XLM U107 ( .A0(n8), .A1(n46), .B0(n47), .B1(n137), .C0(n13), .Y(n74)
         );
  AOI221XLM U108 ( .A0(n46), .A1(n137), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U109 ( .A0(n67), .A1(n132), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n137), .Y(n66) );
  INVX2M U110 ( .A(B[4]), .Y(n132) );
  AOI221XLM U111 ( .A0(n9), .A1(n46), .B0(n47), .B1(n136), .C0(n13), .Y(n68)
         );
  AOI221XLM U112 ( .A0(n46), .A1(n136), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U113 ( .A0(n61), .A1(n131), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n136), .Y(n60) );
  INVX2M U114 ( .A(B[5]), .Y(n131) );
  AOI221XLM U115 ( .A0(n10), .A1(n46), .B0(n47), .B1(n135), .C0(n13), .Y(n62)
         );
  AOI221XLM U116 ( .A0(n46), .A1(n135), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U117 ( .A0(n44), .A1(n130), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n134), .Y(n43) );
  INVX2M U118 ( .A(B[7]), .Y(n130) );
  AOI221XLM U119 ( .A0(n46), .A1(n12), .B0(n47), .B1(n133), .C0(n13), .Y(n45)
         );
  AOI221XLM U120 ( .A0(n46), .A1(n133), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  INVX2M U121 ( .A(n14), .Y(n118) );
  OAI21X2M U122 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U123 ( .A0(n5), .A1(n46), .B0(n47), .B1(n140), .C0(n13), .Y(n102)
         );
  AOI31X2M U124 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U125 ( .A(n127), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI21X2M U126 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U127 ( .A0(n6), .A1(n46), .B0(n47), .B1(n139), .C0(n13), .Y(n87)
         );
  AOI31X2M U128 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U129 ( .A(n128), .B(ALU_FUN[2]), .C(n127), .Y(n89) );
  INVX2M U130 ( .A(B[0]), .Y(n117) );
  INVX2M U131 ( .A(B[2]), .Y(n119) );
  INVX2M U132 ( .A(B[3]), .Y(n121) );
  NOR2X1M U133 ( .A(n133), .B(B[7]), .Y(n113) );
  NAND2BX1M U134 ( .AN(B[4]), .B(n9), .Y(n29) );
  NAND2BX1M U135 ( .AN(n9), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U136 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U137 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U138 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U139 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U140 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U141 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U142 ( .A0(n14), .A1(n139), .B0(B[1]), .Y(n15) );
  AOI211X1M U143 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U144 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U145 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U146 ( .AN(n10), .B(B[5]), .Y(n111) );
  OAI211X1M U147 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U148 ( .AN(B[5]), .B(n10), .Y(n30) );
  XNOR2X1M U149 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U150 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n134), .Y(n21)
         );
  CLKNAND2X2M U151 ( .A(B[7]), .B(n133), .Y(n114) );
  OAI21X1M U152 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U153 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U154 ( .A0(n24), .A1(n139), .B0(B[1]), .Y(n22) );
  AOI211X1M U155 ( .A0(n24), .A1(n139), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U156 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U157 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U158 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U159 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  CLKINVX1M U160 ( .A(n116), .Y(N158) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;
  wire   Latch_Out;
  tri   CLK;

  TLATNX2M Latch_Out_reg ( .D(CLK_EN), .GN(CLK), .Q(Latch_Out) );
  AND2X2M U2 ( .A(Latch_Out), .B(CLK), .Y(GATED_CLK) );
endmodule


module fifo_mem ( w_clk, w_rstn, w_full, w_inc, w_addr, r_addr, w_data, r_data
 );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc;
  wire   N9, N10, N11, \FIFO_MEM[7][7] , \FIFO_MEM[7][6] , \FIFO_MEM[7][5] ,
         \FIFO_MEM[7][4] , \FIFO_MEM[7][3] , \FIFO_MEM[7][2] ,
         \FIFO_MEM[7][1] , \FIFO_MEM[7][0] , \FIFO_MEM[6][7] ,
         \FIFO_MEM[6][6] , \FIFO_MEM[6][5] , \FIFO_MEM[6][4] ,
         \FIFO_MEM[6][3] , \FIFO_MEM[6][2] , \FIFO_MEM[6][1] ,
         \FIFO_MEM[6][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[4][7] , \FIFO_MEM[4][6] , \FIFO_MEM[4][5] ,
         \FIFO_MEM[4][4] , \FIFO_MEM[4][3] , \FIFO_MEM[4][2] ,
         \FIFO_MEM[4][1] , \FIFO_MEM[4][0] , \FIFO_MEM[3][7] ,
         \FIFO_MEM[3][6] , \FIFO_MEM[3][5] , \FIFO_MEM[3][4] ,
         \FIFO_MEM[3][3] , \FIFO_MEM[3][2] , \FIFO_MEM[3][1] ,
         \FIFO_MEM[3][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[1][7] , \FIFO_MEM[1][6] , \FIFO_MEM[1][5] ,
         \FIFO_MEM[1][4] , \FIFO_MEM[1][3] , \FIFO_MEM[1][2] ,
         \FIFO_MEM[1][1] , \FIFO_MEM[1][0] , \FIFO_MEM[0][7] ,
         \FIFO_MEM[0][6] , \FIFO_MEM[0][5] , \FIFO_MEM[0][4] ,
         \FIFO_MEM[0][3] , \FIFO_MEM[0][2] , \FIFO_MEM[0][1] ,
         \FIFO_MEM[0][0] , n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108;
  tri   w_clk;
  assign N9 = r_addr[0];
  assign N10 = r_addr[1];
  assign N11 = r_addr[2];

  DFFRQX1M \FIFO_MEM_reg[4][7]  ( .D(n61), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX1M \FIFO_MEM_reg[4][6]  ( .D(n60), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX1M \FIFO_MEM_reg[4][5]  ( .D(n59), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX1M \FIFO_MEM_reg[4][4]  ( .D(n58), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX1M \FIFO_MEM_reg[4][3]  ( .D(n57), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX1M \FIFO_MEM_reg[4][2]  ( .D(n56), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX1M \FIFO_MEM_reg[4][1]  ( .D(n55), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX1M \FIFO_MEM_reg[4][0]  ( .D(n54), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX1M \FIFO_MEM_reg[6][7]  ( .D(n77), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX1M \FIFO_MEM_reg[6][6]  ( .D(n76), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX1M \FIFO_MEM_reg[6][5]  ( .D(n75), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX1M \FIFO_MEM_reg[6][4]  ( .D(n74), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX1M \FIFO_MEM_reg[6][3]  ( .D(n73), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX1M \FIFO_MEM_reg[6][2]  ( .D(n72), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX1M \FIFO_MEM_reg[6][1]  ( .D(n71), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX1M \FIFO_MEM_reg[6][0]  ( .D(n70), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX1M \FIFO_MEM_reg[5][7]  ( .D(n69), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX1M \FIFO_MEM_reg[5][6]  ( .D(n68), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX1M \FIFO_MEM_reg[5][5]  ( .D(n67), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX1M \FIFO_MEM_reg[5][4]  ( .D(n66), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX1M \FIFO_MEM_reg[5][3]  ( .D(n65), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX1M \FIFO_MEM_reg[5][2]  ( .D(n64), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX1M \FIFO_MEM_reg[5][1]  ( .D(n63), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX1M \FIFO_MEM_reg[5][0]  ( .D(n62), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX1M \FIFO_MEM_reg[7][7]  ( .D(n85), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX1M \FIFO_MEM_reg[7][6]  ( .D(n84), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX1M \FIFO_MEM_reg[7][5]  ( .D(n83), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX1M \FIFO_MEM_reg[7][4]  ( .D(n82), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX1M \FIFO_MEM_reg[7][3]  ( .D(n81), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX1M \FIFO_MEM_reg[7][2]  ( .D(n80), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX1M \FIFO_MEM_reg[7][1]  ( .D(n79), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX1M \FIFO_MEM_reg[7][0]  ( .D(n78), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX1M \FIFO_MEM_reg[2][7]  ( .D(n45), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX1M \FIFO_MEM_reg[2][6]  ( .D(n44), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX1M \FIFO_MEM_reg[2][5]  ( .D(n43), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX1M \FIFO_MEM_reg[2][4]  ( .D(n42), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX1M \FIFO_MEM_reg[2][3]  ( .D(n41), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX1M \FIFO_MEM_reg[2][2]  ( .D(n40), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX1M \FIFO_MEM_reg[2][1]  ( .D(n39), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX1M \FIFO_MEM_reg[2][0]  ( .D(n38), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX1M \FIFO_MEM_reg[1][7]  ( .D(n37), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX1M \FIFO_MEM_reg[1][6]  ( .D(n36), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX1M \FIFO_MEM_reg[1][5]  ( .D(n35), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX1M \FIFO_MEM_reg[1][4]  ( .D(n34), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX1M \FIFO_MEM_reg[1][3]  ( .D(n33), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX1M \FIFO_MEM_reg[1][2]  ( .D(n32), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX1M \FIFO_MEM_reg[1][1]  ( .D(n31), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX1M \FIFO_MEM_reg[1][0]  ( .D(n30), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX1M \FIFO_MEM_reg[3][7]  ( .D(n53), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX1M \FIFO_MEM_reg[3][6]  ( .D(n52), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX1M \FIFO_MEM_reg[3][5]  ( .D(n51), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX1M \FIFO_MEM_reg[3][4]  ( .D(n50), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX1M \FIFO_MEM_reg[3][3]  ( .D(n49), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX1M \FIFO_MEM_reg[3][2]  ( .D(n48), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX1M \FIFO_MEM_reg[3][1]  ( .D(n47), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX1M \FIFO_MEM_reg[3][0]  ( .D(n46), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[3][0] ) );
  DFFRQX1M \FIFO_MEM_reg[0][7]  ( .D(n29), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX1M \FIFO_MEM_reg[0][6]  ( .D(n28), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX1M \FIFO_MEM_reg[0][5]  ( .D(n27), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX1M \FIFO_MEM_reg[0][4]  ( .D(n26), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX1M \FIFO_MEM_reg[0][3]  ( .D(n25), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX1M \FIFO_MEM_reg[0][2]  ( .D(n24), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX1M \FIFO_MEM_reg[0][1]  ( .D(n23), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX1M \FIFO_MEM_reg[0][0]  ( .D(n22), .CK(w_clk), .RN(w_rstn), .Q(
        \FIFO_MEM[0][0] ) );
  BUFX2M U2 ( .A(n14), .Y(n97) );
  BUFX2M U3 ( .A(n15), .Y(n96) );
  BUFX2M U4 ( .A(n19), .Y(n95) );
  BUFX2M U5 ( .A(n20), .Y(n94) );
  BUFX2M U6 ( .A(n21), .Y(n93) );
  BUFX2M U7 ( .A(n13), .Y(n98) );
  NOR2BX2M U8 ( .AN(w_inc), .B(w_full), .Y(n16) );
  NAND3X2M U9 ( .A(n107), .B(n108), .C(n18), .Y(n17) );
  NAND3X2M U10 ( .A(n107), .B(n108), .C(n12), .Y(n11) );
  NOR2BX2M U11 ( .AN(n16), .B(w_addr[2]), .Y(n12) );
  OAI2BB2X1M U12 ( .B0(n11), .B1(n99), .A0N(\FIFO_MEM[0][0] ), .A1N(n11), .Y(
        n22) );
  OAI2BB2X1M U13 ( .B0(n11), .B1(n100), .A0N(\FIFO_MEM[0][1] ), .A1N(n11), .Y(
        n23) );
  OAI2BB2X1M U14 ( .B0(n11), .B1(n101), .A0N(\FIFO_MEM[0][2] ), .A1N(n11), .Y(
        n24) );
  OAI2BB2X1M U15 ( .B0(n11), .B1(n102), .A0N(\FIFO_MEM[0][3] ), .A1N(n11), .Y(
        n25) );
  OAI2BB2X1M U16 ( .B0(n11), .B1(n103), .A0N(\FIFO_MEM[0][4] ), .A1N(n11), .Y(
        n26) );
  OAI2BB2X1M U17 ( .B0(n11), .B1(n104), .A0N(\FIFO_MEM[0][5] ), .A1N(n11), .Y(
        n27) );
  OAI2BB2X1M U18 ( .B0(n11), .B1(n105), .A0N(\FIFO_MEM[0][6] ), .A1N(n11), .Y(
        n28) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n106), .A0N(\FIFO_MEM[0][7] ), .A1N(n11), .Y(
        n29) );
  OAI2BB2X1M U20 ( .B0(n99), .B1(n17), .A0N(\FIFO_MEM[4][0] ), .A1N(n17), .Y(
        n54) );
  OAI2BB2X1M U21 ( .B0(n100), .B1(n17), .A0N(\FIFO_MEM[4][1] ), .A1N(n17), .Y(
        n55) );
  OAI2BB2X1M U22 ( .B0(n101), .B1(n17), .A0N(\FIFO_MEM[4][2] ), .A1N(n17), .Y(
        n56) );
  OAI2BB2X1M U23 ( .B0(n102), .B1(n17), .A0N(\FIFO_MEM[4][3] ), .A1N(n17), .Y(
        n57) );
  OAI2BB2X1M U24 ( .B0(n103), .B1(n17), .A0N(\FIFO_MEM[4][4] ), .A1N(n17), .Y(
        n58) );
  OAI2BB2X1M U25 ( .B0(n104), .B1(n17), .A0N(\FIFO_MEM[4][5] ), .A1N(n17), .Y(
        n59) );
  OAI2BB2X1M U26 ( .B0(n105), .B1(n17), .A0N(\FIFO_MEM[4][6] ), .A1N(n17), .Y(
        n60) );
  OAI2BB2X1M U27 ( .B0(n106), .B1(n17), .A0N(\FIFO_MEM[4][7] ), .A1N(n17), .Y(
        n61) );
  INVX2M U28 ( .A(w_data[0]), .Y(n99) );
  INVX2M U29 ( .A(w_data[1]), .Y(n100) );
  INVX2M U30 ( .A(w_data[2]), .Y(n101) );
  INVX2M U31 ( .A(w_data[3]), .Y(n102) );
  INVX2M U32 ( .A(w_data[4]), .Y(n103) );
  INVX2M U33 ( .A(w_data[5]), .Y(n104) );
  INVX2M U34 ( .A(w_data[6]), .Y(n105) );
  INVX2M U35 ( .A(w_data[7]), .Y(n106) );
  OAI2BB2X1M U36 ( .B0(n99), .B1(n98), .A0N(\FIFO_MEM[1][0] ), .A1N(n98), .Y(
        n30) );
  OAI2BB2X1M U37 ( .B0(n100), .B1(n98), .A0N(\FIFO_MEM[1][1] ), .A1N(n98), .Y(
        n31) );
  OAI2BB2X1M U38 ( .B0(n101), .B1(n98), .A0N(\FIFO_MEM[1][2] ), .A1N(n98), .Y(
        n32) );
  OAI2BB2X1M U39 ( .B0(n102), .B1(n98), .A0N(\FIFO_MEM[1][3] ), .A1N(n98), .Y(
        n33) );
  OAI2BB2X1M U40 ( .B0(n103), .B1(n98), .A0N(\FIFO_MEM[1][4] ), .A1N(n98), .Y(
        n34) );
  OAI2BB2X1M U41 ( .B0(n104), .B1(n98), .A0N(\FIFO_MEM[1][5] ), .A1N(n98), .Y(
        n35) );
  OAI2BB2X1M U42 ( .B0(n105), .B1(n98), .A0N(\FIFO_MEM[1][6] ), .A1N(n98), .Y(
        n36) );
  OAI2BB2X1M U43 ( .B0(n106), .B1(n98), .A0N(\FIFO_MEM[1][7] ), .A1N(n98), .Y(
        n37) );
  OAI2BB2X1M U44 ( .B0(n99), .B1(n97), .A0N(\FIFO_MEM[2][0] ), .A1N(n97), .Y(
        n38) );
  OAI2BB2X1M U45 ( .B0(n100), .B1(n97), .A0N(\FIFO_MEM[2][1] ), .A1N(n97), .Y(
        n39) );
  OAI2BB2X1M U46 ( .B0(n101), .B1(n97), .A0N(\FIFO_MEM[2][2] ), .A1N(n97), .Y(
        n40) );
  OAI2BB2X1M U47 ( .B0(n102), .B1(n97), .A0N(\FIFO_MEM[2][3] ), .A1N(n97), .Y(
        n41) );
  OAI2BB2X1M U48 ( .B0(n103), .B1(n97), .A0N(\FIFO_MEM[2][4] ), .A1N(n97), .Y(
        n42) );
  OAI2BB2X1M U49 ( .B0(n104), .B1(n97), .A0N(\FIFO_MEM[2][5] ), .A1N(n97), .Y(
        n43) );
  OAI2BB2X1M U50 ( .B0(n105), .B1(n97), .A0N(\FIFO_MEM[2][6] ), .A1N(n97), .Y(
        n44) );
  OAI2BB2X1M U51 ( .B0(n106), .B1(n97), .A0N(\FIFO_MEM[2][7] ), .A1N(n97), .Y(
        n45) );
  OAI2BB2X1M U52 ( .B0(n99), .B1(n96), .A0N(\FIFO_MEM[3][0] ), .A1N(n96), .Y(
        n46) );
  OAI2BB2X1M U53 ( .B0(n100), .B1(n96), .A0N(\FIFO_MEM[3][1] ), .A1N(n96), .Y(
        n47) );
  OAI2BB2X1M U54 ( .B0(n101), .B1(n96), .A0N(\FIFO_MEM[3][2] ), .A1N(n96), .Y(
        n48) );
  OAI2BB2X1M U55 ( .B0(n102), .B1(n96), .A0N(\FIFO_MEM[3][3] ), .A1N(n96), .Y(
        n49) );
  OAI2BB2X1M U56 ( .B0(n103), .B1(n96), .A0N(\FIFO_MEM[3][4] ), .A1N(n96), .Y(
        n50) );
  OAI2BB2X1M U57 ( .B0(n104), .B1(n96), .A0N(\FIFO_MEM[3][5] ), .A1N(n96), .Y(
        n51) );
  OAI2BB2X1M U58 ( .B0(n105), .B1(n96), .A0N(\FIFO_MEM[3][6] ), .A1N(n96), .Y(
        n52) );
  OAI2BB2X1M U59 ( .B0(n106), .B1(n96), .A0N(\FIFO_MEM[3][7] ), .A1N(n96), .Y(
        n53) );
  OAI2BB2X1M U60 ( .B0(n99), .B1(n95), .A0N(\FIFO_MEM[5][0] ), .A1N(n95), .Y(
        n62) );
  OAI2BB2X1M U61 ( .B0(n100), .B1(n95), .A0N(\FIFO_MEM[5][1] ), .A1N(n95), .Y(
        n63) );
  OAI2BB2X1M U62 ( .B0(n101), .B1(n95), .A0N(\FIFO_MEM[5][2] ), .A1N(n95), .Y(
        n64) );
  OAI2BB2X1M U63 ( .B0(n102), .B1(n95), .A0N(\FIFO_MEM[5][3] ), .A1N(n95), .Y(
        n65) );
  OAI2BB2X1M U64 ( .B0(n103), .B1(n95), .A0N(\FIFO_MEM[5][4] ), .A1N(n95), .Y(
        n66) );
  OAI2BB2X1M U65 ( .B0(n104), .B1(n95), .A0N(\FIFO_MEM[5][5] ), .A1N(n95), .Y(
        n67) );
  OAI2BB2X1M U66 ( .B0(n105), .B1(n95), .A0N(\FIFO_MEM[5][6] ), .A1N(n95), .Y(
        n68) );
  OAI2BB2X1M U67 ( .B0(n106), .B1(n95), .A0N(\FIFO_MEM[5][7] ), .A1N(n95), .Y(
        n69) );
  OAI2BB2X1M U68 ( .B0(n99), .B1(n94), .A0N(\FIFO_MEM[6][0] ), .A1N(n94), .Y(
        n70) );
  OAI2BB2X1M U69 ( .B0(n100), .B1(n94), .A0N(\FIFO_MEM[6][1] ), .A1N(n94), .Y(
        n71) );
  OAI2BB2X1M U70 ( .B0(n101), .B1(n94), .A0N(\FIFO_MEM[6][2] ), .A1N(n94), .Y(
        n72) );
  OAI2BB2X1M U71 ( .B0(n102), .B1(n94), .A0N(\FIFO_MEM[6][3] ), .A1N(n94), .Y(
        n73) );
  OAI2BB2X1M U72 ( .B0(n103), .B1(n94), .A0N(\FIFO_MEM[6][4] ), .A1N(n94), .Y(
        n74) );
  OAI2BB2X1M U73 ( .B0(n104), .B1(n94), .A0N(\FIFO_MEM[6][5] ), .A1N(n94), .Y(
        n75) );
  OAI2BB2X1M U74 ( .B0(n105), .B1(n94), .A0N(\FIFO_MEM[6][6] ), .A1N(n94), .Y(
        n76) );
  OAI2BB2X1M U75 ( .B0(n106), .B1(n94), .A0N(\FIFO_MEM[6][7] ), .A1N(n94), .Y(
        n77) );
  OAI2BB2X1M U76 ( .B0(n99), .B1(n93), .A0N(\FIFO_MEM[7][0] ), .A1N(n93), .Y(
        n78) );
  OAI2BB2X1M U77 ( .B0(n100), .B1(n93), .A0N(\FIFO_MEM[7][1] ), .A1N(n93), .Y(
        n79) );
  OAI2BB2X1M U78 ( .B0(n101), .B1(n93), .A0N(\FIFO_MEM[7][2] ), .A1N(n93), .Y(
        n80) );
  OAI2BB2X1M U79 ( .B0(n102), .B1(n93), .A0N(\FIFO_MEM[7][3] ), .A1N(n93), .Y(
        n81) );
  OAI2BB2X1M U80 ( .B0(n103), .B1(n93), .A0N(\FIFO_MEM[7][4] ), .A1N(n93), .Y(
        n82) );
  OAI2BB2X1M U81 ( .B0(n104), .B1(n93), .A0N(\FIFO_MEM[7][5] ), .A1N(n93), .Y(
        n83) );
  OAI2BB2X1M U82 ( .B0(n105), .B1(n93), .A0N(\FIFO_MEM[7][6] ), .A1N(n93), .Y(
        n84) );
  OAI2BB2X1M U83 ( .B0(n106), .B1(n93), .A0N(\FIFO_MEM[7][7] ), .A1N(n93), .Y(
        n85) );
  AND2X2M U84 ( .A(w_addr[2]), .B(n16), .Y(n18) );
  NAND3X2M U85 ( .A(n12), .B(n108), .C(w_addr[0]), .Y(n13) );
  NAND3X2M U86 ( .A(n12), .B(n107), .C(w_addr[1]), .Y(n14) );
  NAND3X2M U87 ( .A(w_addr[0]), .B(n12), .C(w_addr[1]), .Y(n15) );
  NAND3X2M U88 ( .A(w_addr[1]), .B(w_addr[0]), .C(n18), .Y(n21) );
  NAND3X2M U89 ( .A(w_addr[0]), .B(n108), .C(n18), .Y(n19) );
  NAND3X2M U90 ( .A(w_addr[1]), .B(n107), .C(n18), .Y(n20) );
  INVX2M U91 ( .A(w_addr[0]), .Y(n107) );
  INVX2M U92 ( .A(w_addr[1]), .Y(n108) );
  BUFX4M U93 ( .A(N9), .Y(n92) );
  MX2X2M U94 ( .A(n2), .B(n1), .S0(N11), .Y(r_data[0]) );
  MX4X1M U95 ( .A(\FIFO_MEM[0][0] ), .B(\FIFO_MEM[1][0] ), .C(\FIFO_MEM[2][0] ), .D(\FIFO_MEM[3][0] ), .S0(n92), .S1(N10), .Y(n2) );
  MX4X1M U96 ( .A(\FIFO_MEM[4][0] ), .B(\FIFO_MEM[5][0] ), .C(\FIFO_MEM[6][0] ), .D(\FIFO_MEM[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX2X2M U97 ( .A(n4), .B(n3), .S0(N11), .Y(r_data[1]) );
  MX4X1M U98 ( .A(\FIFO_MEM[0][1] ), .B(\FIFO_MEM[1][1] ), .C(\FIFO_MEM[2][1] ), .D(\FIFO_MEM[3][1] ), .S0(n92), .S1(N10), .Y(n4) );
  MX4X1M U99 ( .A(\FIFO_MEM[4][1] ), .B(\FIFO_MEM[5][1] ), .C(\FIFO_MEM[6][1] ), .D(\FIFO_MEM[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX2X2M U100 ( .A(n6), .B(n5), .S0(N11), .Y(r_data[2]) );
  MX4X1M U101 ( .A(\FIFO_MEM[0][2] ), .B(\FIFO_MEM[1][2] ), .C(
        \FIFO_MEM[2][2] ), .D(\FIFO_MEM[3][2] ), .S0(n92), .S1(N10), .Y(n6) );
  MX4X1M U102 ( .A(\FIFO_MEM[4][2] ), .B(\FIFO_MEM[5][2] ), .C(
        \FIFO_MEM[6][2] ), .D(\FIFO_MEM[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX2X2M U103 ( .A(n8), .B(n7), .S0(N11), .Y(r_data[3]) );
  MX4X1M U104 ( .A(\FIFO_MEM[0][3] ), .B(\FIFO_MEM[1][3] ), .C(
        \FIFO_MEM[2][3] ), .D(\FIFO_MEM[3][3] ), .S0(n92), .S1(N10), .Y(n8) );
  MX4X1M U105 ( .A(\FIFO_MEM[4][3] ), .B(\FIFO_MEM[5][3] ), .C(
        \FIFO_MEM[6][3] ), .D(\FIFO_MEM[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX2X2M U106 ( .A(n10), .B(n9), .S0(N11), .Y(r_data[4]) );
  MX4X1M U107 ( .A(\FIFO_MEM[0][4] ), .B(\FIFO_MEM[1][4] ), .C(
        \FIFO_MEM[2][4] ), .D(\FIFO_MEM[3][4] ), .S0(n92), .S1(N10), .Y(n10)
         );
  MX4X1M U108 ( .A(\FIFO_MEM[4][4] ), .B(\FIFO_MEM[5][4] ), .C(
        \FIFO_MEM[6][4] ), .D(\FIFO_MEM[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX2X2M U109 ( .A(n87), .B(n86), .S0(N11), .Y(r_data[5]) );
  MX4X1M U110 ( .A(\FIFO_MEM[0][5] ), .B(\FIFO_MEM[1][5] ), .C(
        \FIFO_MEM[2][5] ), .D(\FIFO_MEM[3][5] ), .S0(n92), .S1(N10), .Y(n87)
         );
  MX4X1M U111 ( .A(\FIFO_MEM[4][5] ), .B(\FIFO_MEM[5][5] ), .C(
        \FIFO_MEM[6][5] ), .D(\FIFO_MEM[7][5] ), .S0(n92), .S1(N10), .Y(n86)
         );
  MX2X2M U112 ( .A(n89), .B(n88), .S0(N11), .Y(r_data[6]) );
  MX4X1M U113 ( .A(\FIFO_MEM[0][6] ), .B(\FIFO_MEM[1][6] ), .C(
        \FIFO_MEM[2][6] ), .D(\FIFO_MEM[3][6] ), .S0(n92), .S1(N10), .Y(n89)
         );
  MX4X1M U114 ( .A(\FIFO_MEM[4][6] ), .B(\FIFO_MEM[5][6] ), .C(
        \FIFO_MEM[6][6] ), .D(\FIFO_MEM[7][6] ), .S0(n92), .S1(N10), .Y(n88)
         );
  MX2X2M U115 ( .A(n91), .B(n90), .S0(N11), .Y(r_data[7]) );
  MX4X1M U116 ( .A(\FIFO_MEM[0][7] ), .B(\FIFO_MEM[1][7] ), .C(
        \FIFO_MEM[2][7] ), .D(\FIFO_MEM[3][7] ), .S0(n92), .S1(N10), .Y(n91)
         );
  MX4X1M U117 ( .A(\FIFO_MEM[4][7] ), .B(\FIFO_MEM[5][7] ), .C(
        \FIFO_MEM[6][7] ), .D(\FIFO_MEM[7][7] ), .S0(n92), .S1(N10), .Y(n90)
         );
endmodule


module fifo_wr ( w_clk, w_rstn, w_inc, sync_rd_ptr, w_addr, gray_w_ptr, full
 );
  input [3:0] sync_rd_ptr;
  output [2:0] w_addr;
  output [3:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc;
  output full;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] comb_gray_w_ptr;
  tri   w_clk;
  tri   [3:0] sync_rd_ptr;
  tri   [3:0] gray_w_ptr;

  DFFRX1M \w_ptr_reg[0]  ( .D(n14), .CK(w_clk), .RN(w_rstn), .Q(w_addr[0]), 
        .QN(n1) );
  DFFRQX2M \w_ptr_reg[1]  ( .D(n13), .CK(w_clk), .RN(w_rstn), .Q(w_addr[1]) );
  DFFRQX1M \gray_w_ptr_reg[3]  ( .D(comb_gray_w_ptr[3]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[3]) );
  DFFRQX1M \gray_w_ptr_reg[0]  ( .D(comb_gray_w_ptr[0]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[0]) );
  DFFRQX1M \gray_w_ptr_reg[2]  ( .D(comb_gray_w_ptr[2]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[2]) );
  DFFRQX1M \gray_w_ptr_reg[1]  ( .D(comb_gray_w_ptr[1]), .CK(w_clk), .RN(
        w_rstn), .Q(gray_w_ptr[1]) );
  DFFRQX1M \w_ptr_reg[2]  ( .D(n12), .CK(w_clk), .RN(w_rstn), .Q(w_addr[2]) );
  DFFRQX1M \w_ptr_reg[3]  ( .D(n11), .CK(w_clk), .RN(w_rstn), .Q(
        comb_gray_w_ptr[3]) );
  INVX2M U3 ( .A(n6), .Y(full) );
  NAND2X2M U4 ( .A(w_inc), .B(n6), .Y(n5) );
  XNOR2X2M U5 ( .A(comb_gray_w_ptr[1]), .B(sync_rd_ptr[1]), .Y(n7) );
  XNOR2X2M U6 ( .A(n1), .B(w_addr[1]), .Y(comb_gray_w_ptr[0]) );
  NOR2X2M U7 ( .A(n5), .B(n1), .Y(n4) );
  XNOR2X2M U8 ( .A(w_addr[2]), .B(n3), .Y(n12) );
  XNOR2X2M U9 ( .A(comb_gray_w_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U10 ( .AN(n3), .B(w_addr[2]), .Y(n2) );
  NAND4X2M U11 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  CLKXOR2X2M U12 ( .A(sync_rd_ptr[3]), .B(comb_gray_w_ptr[3]), .Y(n10) );
  XNOR2X2M U13 ( .A(comb_gray_w_ptr[0]), .B(sync_rd_ptr[0]), .Y(n8) );
  CLKXOR2X2M U14 ( .A(sync_rd_ptr[2]), .B(comb_gray_w_ptr[2]), .Y(n9) );
  NAND2X2M U15 ( .A(n4), .B(w_addr[1]), .Y(n3) );
  CLKXOR2X2M U16 ( .A(comb_gray_w_ptr[3]), .B(w_addr[2]), .Y(
        comb_gray_w_ptr[2]) );
  CLKXOR2X2M U17 ( .A(w_addr[1]), .B(w_addr[2]), .Y(comb_gray_w_ptr[1]) );
  CLKXOR2X2M U18 ( .A(w_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module fifo_rd ( r_clk, r_rstn, r_inc, sync_wr_ptr, rd_addr, empty, 
        gray_rd_ptr );
  input [3:0] sync_wr_ptr;
  output [2:0] rd_addr;
  output [3:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc;
  output empty;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [3:0] comb_gray_rd_ptr;
  tri   r_clk;
  tri   r_rstn;
  tri   [3:0] sync_wr_ptr;
  tri   [3:0] gray_rd_ptr;

  DFFRQX2M \rd_ptr_reg[3]  ( .D(n11), .CK(r_clk), .RN(r_rstn), .Q(
        comb_gray_rd_ptr[3]) );
  DFFRX1M \rd_ptr_reg[0]  ( .D(n14), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[0]), 
        .QN(n1) );
  DFFRQX2M \rd_ptr_reg[2]  ( .D(n12), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[2])
         );
  DFFRQX2M \gray_rd_ptr_reg[2]  ( .D(comb_gray_rd_ptr[2]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[2]) );
  DFFRQX2M \gray_rd_ptr_reg[1]  ( .D(comb_gray_rd_ptr[1]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[1]) );
  DFFRQX2M \gray_rd_ptr_reg[0]  ( .D(comb_gray_rd_ptr[0]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[0]) );
  DFFRQX2M \rd_ptr_reg[1]  ( .D(n13), .CK(r_clk), .RN(r_rstn), .Q(rd_addr[1])
         );
  DFFRQX2M \gray_rd_ptr_reg[3]  ( .D(comb_gray_rd_ptr[3]), .CK(r_clk), .RN(
        r_rstn), .Q(gray_rd_ptr[3]) );
  INVX2M U3 ( .A(n6), .Y(empty) );
  XNOR2X2M U4 ( .A(comb_gray_rd_ptr[1]), .B(sync_wr_ptr[1]), .Y(n7) );
  XNOR2X2M U5 ( .A(n1), .B(rd_addr[1]), .Y(comb_gray_rd_ptr[0]) );
  NOR2X2M U6 ( .A(n5), .B(n1), .Y(n4) );
  NAND4X2M U7 ( .A(n7), .B(n8), .C(n9), .D(n10), .Y(n6) );
  XNOR2X2M U8 ( .A(comb_gray_rd_ptr[3]), .B(sync_wr_ptr[3]), .Y(n9) );
  XNOR2X2M U9 ( .A(comb_gray_rd_ptr[2]), .B(sync_wr_ptr[2]), .Y(n10) );
  XNOR2X2M U10 ( .A(comb_gray_rd_ptr[0]), .B(sync_wr_ptr[0]), .Y(n8) );
  NAND2X2M U11 ( .A(n4), .B(rd_addr[1]), .Y(n3) );
  NAND2X2M U12 ( .A(r_inc), .B(n6), .Y(n5) );
  XNOR2X2M U13 ( .A(comb_gray_rd_ptr[3]), .B(n2), .Y(n11) );
  NAND2BX2M U14 ( .AN(n3), .B(rd_addr[2]), .Y(n2) );
  CLKXOR2X2M U15 ( .A(rd_addr[1]), .B(rd_addr[2]), .Y(comb_gray_rd_ptr[1]) );
  CLKXOR2X2M U16 ( .A(comb_gray_rd_ptr[3]), .B(rd_addr[2]), .Y(
        comb_gray_rd_ptr[2]) );
  XNOR2X2M U17 ( .A(rd_addr[2]), .B(n3), .Y(n12) );
  CLKXOR2X2M U18 ( .A(rd_addr[1]), .B(n4), .Y(n13) );
  CLKXOR2X2M U19 ( .A(n1), .B(n5), .Y(n14) );
endmodule


module Async_fifo ( i_w_clk, i_w_rstn, i_w_inc, i_r_clk, i_r_rstn, i_r_inc, 
        i_w_data, o_r_data, o_full, o_empty );
  input [7:0] i_w_data;
  output [7:0] o_r_data;
  input i_w_clk, i_w_rstn, i_w_inc, i_r_clk, i_r_rstn, i_r_inc;
  output o_full, o_empty;
  wire   n1, n2;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  tri   i_w_clk;
  tri   i_w_rstn;
  tri   i_r_clk;
  tri   i_r_rstn;
  tri   [3:0] gray_w_ptr;
  tri   [3:0] w2r_ptr;
  tri   [3:0] r2w_ptr;
  tri   [3:0] gray_rd_ptr;

  fifo_mem u_fifo_mem ( .w_clk(i_w_clk), .w_rstn(n2), .w_full(o_full), .w_inc(
        i_w_inc), .w_addr(w_addr), .r_addr(r_addr), .w_data(i_w_data), 
        .r_data(o_r_data) );
  DF_Sync u_w2r_sync ( .sync_clk(i_r_clk), .sync_rstn(i_r_rstn), .unsync_ip(
        gray_w_ptr), .sync_op(w2r_ptr) );
  fifo_wr u_fifo_wr ( .w_clk(i_w_clk), .w_rstn(n2), .w_inc(i_w_inc), 
        .sync_rd_ptr(r2w_ptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), 
        .full(o_full) );
  fifo_rd u_fifo_rd ( .r_clk(i_r_clk), .r_rstn(i_r_rstn), .r_inc(i_r_inc), 
        .sync_wr_ptr(w2r_ptr), .rd_addr(r_addr), .empty(o_empty), 
        .gray_rd_ptr(gray_rd_ptr) );
  DF_Sync u_r2w_sync ( .sync_clk(i_w_clk), .sync_rstn(i_w_rstn), .unsync_ip(
        gray_rd_ptr), .sync_op(r2w_ptr) );
  INVXLM U1 ( .A(i_w_rstn), .Y(n1) );
  INVX6M U2 ( .A(n1), .Y(n2) );
endmodule


module PULSE_GEN ( RST, CLK, LVL_SIG, PULSE_SIG );
  input RST, CLK, LVL_SIG;
  output PULSE_SIG;
  wire   DFF2, DFF1;
  tri   RST;

  DFFRQX1M DFF1_reg ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(DFF1) );
  DFFRQX1M DFF2_reg ( .D(DFF1), .CK(CLK), .RN(RST), .Q(DFF2) );
  NOR2BX2M U3 ( .AN(DFF1), .B(DFF2), .Y(PULSE_SIG) );
endmodule


module serializer ( P_DATA, ser_en, clk, rst, busy, Data_Valid, ser_data, 
        ser_done );
  input [7:0] P_DATA;
  input ser_en, clk, rst, busy, Data_Valid;
  output ser_data, ser_done;
  wire   N24, N25, N26, N27, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3,
         n26;
  wire   [7:1] DATA_isolate;
  wire   [3:0] ser_count;
  tri   rst;

  DFFRQX2M \DATA_isolate_reg[6]  ( .D(n20), .CK(clk), .RN(rst), .Q(
        DATA_isolate[6]) );
  DFFRQX2M \DATA_isolate_reg[5]  ( .D(n21), .CK(clk), .RN(rst), .Q(
        DATA_isolate[5]) );
  DFFRQX2M \DATA_isolate_reg[4]  ( .D(n22), .CK(clk), .RN(rst), .Q(
        DATA_isolate[4]) );
  DFFRQX2M \DATA_isolate_reg[3]  ( .D(n23), .CK(clk), .RN(rst), .Q(
        DATA_isolate[3]) );
  DFFRQX2M \DATA_isolate_reg[2]  ( .D(n24), .CK(clk), .RN(rst), .Q(
        DATA_isolate[2]) );
  DFFRQX2M \DATA_isolate_reg[1]  ( .D(n25), .CK(clk), .RN(rst), .Q(
        DATA_isolate[1]) );
  DFFRQX2M \DATA_isolate_reg[7]  ( .D(n19), .CK(clk), .RN(rst), .Q(
        DATA_isolate[7]) );
  DFFRQX2M \DATA_isolate_reg[0]  ( .D(n18), .CK(clk), .RN(rst), .Q(ser_data)
         );
  DFFRQX1M \ser_count_reg[0]  ( .D(N24), .CK(clk), .RN(rst), .Q(ser_count[0])
         );
  DFFRQX1M \ser_count_reg[2]  ( .D(N26), .CK(clk), .RN(rst), .Q(ser_count[2])
         );
  DFFRQX1M \ser_count_reg[1]  ( .D(N25), .CK(clk), .RN(rst), .Q(ser_count[1])
         );
  DFFRQX1M \ser_count_reg[3]  ( .D(N27), .CK(clk), .RN(rst), .Q(ser_count[3])
         );
  NOR2X2M U3 ( .A(n2), .B(n1), .Y(n6) );
  NOR2X2M U4 ( .A(n1), .B(n6), .Y(n4) );
  BUFX2M U5 ( .A(n7), .Y(n1) );
  NOR2BX2M U6 ( .AN(Data_Valid), .B(busy), .Y(n7) );
  OAI2BB1X2M U7 ( .A0N(ser_data), .A1N(n4), .B0(n5), .Y(n18) );
  AOI22X1M U8 ( .A0(DATA_isolate[1]), .A1(n6), .B0(P_DATA[0]), .B1(n1), .Y(n5)
         );
  OAI2BB1X2M U9 ( .A0N(DATA_isolate[1]), .A1N(n4), .B0(n13), .Y(n25) );
  AOI22X1M U10 ( .A0(DATA_isolate[2]), .A1(n6), .B0(P_DATA[1]), .B1(n1), .Y(
        n13) );
  OAI2BB1X2M U11 ( .A0N(n4), .A1N(DATA_isolate[2]), .B0(n12), .Y(n24) );
  AOI22X1M U12 ( .A0(DATA_isolate[3]), .A1(n6), .B0(P_DATA[2]), .B1(n1), .Y(
        n12) );
  OAI2BB1X2M U13 ( .A0N(n4), .A1N(DATA_isolate[3]), .B0(n11), .Y(n23) );
  AOI22X1M U14 ( .A0(DATA_isolate[4]), .A1(n6), .B0(P_DATA[3]), .B1(n1), .Y(
        n11) );
  OAI2BB1X2M U15 ( .A0N(n4), .A1N(DATA_isolate[4]), .B0(n10), .Y(n22) );
  AOI22X1M U16 ( .A0(DATA_isolate[5]), .A1(n6), .B0(P_DATA[4]), .B1(n1), .Y(
        n10) );
  OAI2BB1X2M U17 ( .A0N(n4), .A1N(DATA_isolate[5]), .B0(n9), .Y(n21) );
  AOI22X1M U18 ( .A0(DATA_isolate[6]), .A1(n6), .B0(P_DATA[5]), .B1(n1), .Y(n9) );
  OAI2BB1X2M U19 ( .A0N(n4), .A1N(DATA_isolate[6]), .B0(n8), .Y(n20) );
  AOI22X1M U20 ( .A0(DATA_isolate[7]), .A1(n6), .B0(P_DATA[6]), .B1(n1), .Y(n8) );
  AO22X1M U21 ( .A0(n4), .A1(DATA_isolate[7]), .B0(P_DATA[7]), .B1(n1), .Y(n19) );
  NOR3X2M U22 ( .A(n15), .B(ser_count[3]), .C(n26), .Y(ser_done) );
  OAI2BB2X1M U23 ( .B0(n16), .B1(n2), .A0N(ser_count[2]), .A1N(N24), .Y(N26)
         );
  AOI32X1M U24 ( .A0(ser_count[0]), .A1(n26), .A2(ser_count[1]), .B0(
        ser_count[2]), .B1(n3), .Y(n16) );
  INVX2M U25 ( .A(ser_en), .Y(n2) );
  NAND2X2M U26 ( .A(ser_count[1]), .B(ser_count[0]), .Y(n15) );
  AOI2B1X1M U27 ( .A1N(ser_done), .A0(n14), .B0(n2), .Y(N27) );
  OAI21X2M U28 ( .A0(n15), .A1(n26), .B0(ser_count[3]), .Y(n14) );
  NOR2X2M U29 ( .A(n2), .B(ser_count[0]), .Y(N24) );
  NOR2X2M U30 ( .A(n17), .B(n2), .Y(N25) );
  CLKXOR2X2M U31 ( .A(ser_count[0]), .B(n3), .Y(n17) );
  INVX2M U32 ( .A(ser_count[2]), .Y(n26) );
  INVX2M U33 ( .A(ser_count[1]), .Y(n3) );
endmodule


module FSM ( Data_valid, ser_done, clk, rst, PAR_EN, busy, ser_en, mux_select
 );
  output [1:0] mux_select;
  input Data_valid, ser_done, clk, rst, PAR_EN;
  output busy, ser_en;
  wire   busy_comp, ser_en_comp, n4, n5, n6, n7, n8, n9, n1, n2, n3;
  wire   [2:0] cs;
  wire   [2:0] ns;
  tri   rst;

  DFFRQX1M ser_en_reg ( .D(ser_en_comp), .CK(clk), .RN(rst), .Q(ser_en) );
  DFFRQX1M \cs_reg[1]  ( .D(ns[1]), .CK(clk), .RN(rst), .Q(cs[1]) );
  DFFRQX1M \cs_reg[2]  ( .D(ns[2]), .CK(clk), .RN(rst), .Q(cs[2]) );
  DFFRQX1M busy_reg ( .D(busy_comp), .CK(clk), .RN(rst), .Q(busy) );
  DFFRQX1M \cs_reg[0]  ( .D(ns[0]), .CK(clk), .RN(rst), .Q(cs[0]) );
  OAI211X2M U3 ( .A0(ser_done), .A1(n4), .B0(n6), .C0(n7), .Y(ns[0]) );
  NAND2X2M U4 ( .A(Data_valid), .B(n8), .Y(n6) );
  OAI2BB1X2M U5 ( .A0N(n1), .A1N(n8), .B0(n9), .Y(mux_select[0]) );
  NAND2X2M U6 ( .A(n4), .B(n5), .Y(mux_select[1]) );
  NAND2BX2M U7 ( .AN(mux_select[1]), .B(n7), .Y(ns[1]) );
  NAND2BX2M U8 ( .AN(ns[1]), .B(n9), .Y(busy_comp) );
  OAI31X1M U9 ( .A0(n4), .A1(PAR_EN), .A2(n3), .B0(n5), .Y(ns[2]) );
  INVX2M U10 ( .A(ser_done), .Y(n3) );
  AOI211X2M U11 ( .A0(ser_done), .A1(cs[1]), .B0(n1), .C0(cs[2]), .Y(
        ser_en_comp) );
  NOR2X2M U12 ( .A(cs[1]), .B(cs[2]), .Y(n8) );
  NAND3X2M U13 ( .A(cs[1]), .B(n2), .C(cs[0]), .Y(n4) );
  NAND3X2M U14 ( .A(n1), .B(n2), .C(cs[1]), .Y(n5) );
  NAND2X2M U15 ( .A(cs[1]), .B(n1), .Y(n9) );
  NAND2X2M U16 ( .A(n8), .B(cs[0]), .Y(n7) );
  INVX2M U17 ( .A(cs[0]), .Y(n1) );
  INVX2M U18 ( .A(cs[2]), .Y(n2) );
endmodule


module parity_calc ( Data_valid, P_DATA, PAR_TYP, PAR_EN, busy, clk, rst, 
        par_bit );
  input [7:0] P_DATA;
  input Data_valid, PAR_TYP, PAR_EN, busy, clk, rst;
  output par_bit;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2
;
  wire   [7:0] P_DATA_ISO;
  tri   rst;

  DFFRQX2M \P_DATA_ISO_reg[5]  ( .D(n14), .CK(clk), .RN(rst), .Q(P_DATA_ISO[5]) );
  DFFRQX2M \P_DATA_ISO_reg[1]  ( .D(n10), .CK(clk), .RN(rst), .Q(P_DATA_ISO[1]) );
  DFFRQX2M \P_DATA_ISO_reg[4]  ( .D(n13), .CK(clk), .RN(rst), .Q(P_DATA_ISO[4]) );
  DFFRQX2M \P_DATA_ISO_reg[0]  ( .D(n9), .CK(clk), .RN(rst), .Q(P_DATA_ISO[0])
         );
  DFFRQX2M \P_DATA_ISO_reg[3]  ( .D(n12), .CK(clk), .RN(rst), .Q(P_DATA_ISO[3]) );
  DFFRQX2M \P_DATA_ISO_reg[6]  ( .D(n15), .CK(clk), .RN(rst), .Q(P_DATA_ISO[6]) );
  DFFRQX2M \P_DATA_ISO_reg[7]  ( .D(n16), .CK(clk), .RN(rst), .Q(P_DATA_ISO[7]) );
  DFFRQX1M parity_reg ( .D(n8), .CK(clk), .RN(rst), .Q(par_bit) );
  DFFRQX1M \P_DATA_ISO_reg[2]  ( .D(n11), .CK(clk), .RN(rst), .Q(P_DATA_ISO[2]) );
  NOR2BX2M U2 ( .AN(Data_valid), .B(busy), .Y(n7) );
  AO2B2X2M U3 ( .B0(P_DATA[0]), .B1(n7), .A0(P_DATA_ISO[0]), .A1N(n7), .Y(n9)
         );
  AO2B2X2M U4 ( .B0(P_DATA[1]), .B1(n7), .A0(P_DATA_ISO[1]), .A1N(n7), .Y(n10)
         );
  AO2B2X2M U5 ( .B0(P_DATA[2]), .B1(n7), .A0(P_DATA_ISO[2]), .A1N(n7), .Y(n11)
         );
  AO2B2X2M U6 ( .B0(P_DATA[3]), .B1(n7), .A0(P_DATA_ISO[3]), .A1N(n7), .Y(n12)
         );
  AO2B2X2M U7 ( .B0(P_DATA[4]), .B1(n7), .A0(P_DATA_ISO[4]), .A1N(n7), .Y(n13)
         );
  AO2B2X2M U8 ( .B0(P_DATA[5]), .B1(n7), .A0(P_DATA_ISO[5]), .A1N(n7), .Y(n14)
         );
  AO2B2X2M U9 ( .B0(P_DATA[6]), .B1(n7), .A0(P_DATA_ISO[6]), .A1N(n7), .Y(n15)
         );
  AO2B2X2M U10 ( .B0(P_DATA[7]), .B1(n7), .A0(P_DATA_ISO[7]), .A1N(n7), .Y(n16) );
  OAI2BB2X1M U11 ( .B0(n1), .B1(n2), .A0N(par_bit), .A1N(n2), .Y(n8) );
  INVX2M U12 ( .A(PAR_EN), .Y(n2) );
  XOR3XLM U13 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U14 ( .A(P_DATA_ISO[5]), .B(P_DATA_ISO[4]), .C(n6), .Y(n3) );
  XOR3XLM U15 ( .A(P_DATA_ISO[1]), .B(P_DATA_ISO[0]), .C(n5), .Y(n4) );
  XNOR2X2M U16 ( .A(P_DATA_ISO[2]), .B(P_DATA_ISO[3]), .Y(n5) );
  CLKXOR2X2M U17 ( .A(P_DATA_ISO[7]), .B(P_DATA_ISO[6]), .Y(n6) );
endmodule


module MUX ( ser_data, par_bit, clk, rst, mux_select, TX_OUT );
  input [1:0] mux_select;
  input ser_data, par_bit, clk, rst;
  output TX_OUT;
  wire   TX_OUT_comb, n2, n3, n1;
  tri   rst;

  DFFRQX2M TX_OUT_reg ( .D(TX_OUT_comb), .CK(clk), .RN(rst), .Q(TX_OUT) );
  OAI21X2M U3 ( .A0(n2), .A1(n1), .B0(n3), .Y(TX_OUT_comb) );
  NAND3X2M U4 ( .A(mux_select[1]), .B(n1), .C(ser_data), .Y(n3) );
  NOR2BX2M U5 ( .AN(mux_select[1]), .B(par_bit), .Y(n2) );
  INVX2M U6 ( .A(mux_select[0]), .Y(n1) );
endmodule


module UART_TX_TOP ( P_DATA, Data_valid, PAR_EN, PAR_TYP, clk, rst, TX_OUT, 
        BUSY );
  input [7:0] P_DATA;
  input Data_valid, PAR_EN, PAR_TYP, clk, rst;
  output TX_OUT, BUSY;
  wire   ser_done, ser_en, ser_data, par_bit;
  wire   [1:0] mux_select;
  tri   rst;

  serializer s1 ( .P_DATA(P_DATA), .ser_en(ser_en), .clk(clk), .rst(rst), 
        .busy(BUSY), .Data_Valid(Data_valid), .ser_data(ser_data), .ser_done(
        ser_done) );
  FSM f1 ( .Data_valid(Data_valid), .ser_done(ser_done), .clk(clk), .rst(rst), 
        .PAR_EN(PAR_EN), .busy(BUSY), .ser_en(ser_en), .mux_select(mux_select)
         );
  parity_calc p1 ( .Data_valid(Data_valid), .P_DATA(P_DATA), .PAR_TYP(PAR_TYP), 
        .PAR_EN(1'b0), .busy(BUSY), .clk(clk), .rst(rst), .par_bit(par_bit) );
  MUX m1 ( .ser_data(ser_data), .par_bit(par_bit), .clk(clk), .rst(rst), 
        .mux_select(mux_select), .TX_OUT(TX_OUT) );
endmodule


module RX_FSM ( RX_IN, PAR_EN, edge_cnt, bit_cnt, parity_error, strt_glitch, 
        stop_error, prescale, clk, rst, edge_bit_enable, data_sample_en, 
        par_chk_en, strt_chk_en, stp_chk_en, deser_en, data_valid );
  input [4:0] edge_cnt;
  input [3:0] bit_cnt;
  input [5:0] prescale;
  input RX_IN, PAR_EN, parity_error, strt_glitch, stop_error, clk, rst;
  output edge_bit_enable, data_sample_en, par_chk_en, strt_chk_en, stp_chk_en,
         deser_en, data_valid;
  wire   RX_IN_r, N34, N35, N36, N37, N38, N39, N40, N41, N70, N71, N72, N73,
         N74, N75, N77, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, \sub_164/carry[5] ,
         \sub_164/carry[4] , \sub_164/carry[3] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n45, n46, n47, n48, n49, n50;
  wire   [2:0] cs;
  wire   [2:0] ns;
  tri   clk;
  tri   rst;
  assign N70 = prescale[0];

  DFFSRHQX2M RX_IN_r_reg ( .D(RX_IN), .CK(clk), .SN(n1), .RN(n3), .Q(RX_IN_r)
         );
  DFFRQX1M \cs_reg[1]  ( .D(ns[1]), .CK(clk), .RN(rst), .Q(cs[1]) );
  DFFRQX1M \cs_reg[2]  ( .D(ns[2]), .CK(clk), .RN(rst), .Q(cs[2]) );
  DFFRQX1M \cs_reg[0]  ( .D(ns[0]), .CK(clk), .RN(rst), .Q(cs[0]) );
  NAND2X2M U3 ( .A(RX_IN), .B(n24), .Y(n1) );
  NOR2X2M U4 ( .A(prescale[5]), .B(\sub_164/carry[5] ), .Y(n2) );
  NOR3XLM U5 ( .A(n35), .B(stop_error), .C(parity_error), .Y(data_valid) );
  NAND4BX1M U6 ( .AN(stp_chk_en), .B(n44), .C(n31), .D(n25), .Y(
        edge_bit_enable) );
  NOR2X2M U7 ( .A(n36), .B(strt_chk_en), .Y(n44) );
  INVX2M U8 ( .A(n32), .Y(n45) );
  NOR4X1M U9 ( .A(n25), .B(n45), .C(n46), .D(n47), .Y(n29) );
  NAND2BX2M U10 ( .AN(edge_bit_enable), .B(n35), .Y(data_sample_en) );
  AOI2BB1X2M U11 ( .A0N(n34), .A1N(n35), .B0(stp_chk_en), .Y(n27) );
  NOR3BX2M U12 ( .AN(N41), .B(bit_cnt[1]), .C(bit_cnt[2]), .Y(n32) );
  NOR3X2M U13 ( .A(cs[1]), .B(cs[2]), .C(n48), .Y(strt_chk_en) );
  INVX2M U14 ( .A(n31), .Y(deser_en) );
  NOR4X1M U15 ( .A(RX_IN_r), .B(cs[0]), .C(cs[1]), .D(cs[2]), .Y(n36) );
  NAND4X2M U16 ( .A(strt_glitch), .B(n32), .C(n46), .D(n47), .Y(n40) );
  NOR3X2M U17 ( .A(n45), .B(bit_cnt[0]), .C(n47), .Y(n28) );
  NAND4X2M U18 ( .A(n27), .B(n30), .C(n31), .D(n25), .Y(ns[1]) );
  NAND3X2M U19 ( .A(strt_chk_en), .B(n32), .C(n33), .Y(n30) );
  NOR3X2M U20 ( .A(bit_cnt[0]), .B(strt_glitch), .C(bit_cnt[3]), .Y(n33) );
  NAND3X2M U21 ( .A(n48), .B(n49), .C(cs[1]), .Y(n25) );
  NAND3X2M U22 ( .A(cs[0]), .B(n49), .C(cs[1]), .Y(n31) );
  AND3X2M U23 ( .A(cs[1]), .B(n48), .C(cs[2]), .Y(stp_chk_en) );
  NAND4BX1M U24 ( .AN(n36), .B(n37), .C(n38), .D(n39), .Y(ns[0]) );
  AO21XLM U25 ( .A0(n34), .A1(RX_IN_r), .B0(n35), .Y(n38) );
  NAND4X2M U26 ( .A(N77), .B(stp_chk_en), .C(bit_cnt[1]), .D(n42), .Y(n37) );
  AOI2BB2XLM U27 ( .B0(strt_chk_en), .B1(n40), .A0N(n31), .A1N(n28), .Y(n39)
         );
  INVX2M U28 ( .A(cs[0]), .Y(n48) );
  INVX2M U29 ( .A(cs[2]), .Y(n49) );
  NAND2X2M U30 ( .A(n26), .B(n27), .Y(ns[2]) );
  AOI31X2M U31 ( .A0(deser_en), .A1(n50), .A2(n28), .B0(n29), .Y(n26) );
  INVX2M U32 ( .A(PAR_EN), .Y(n50) );
  INVX2M U33 ( .A(n25), .Y(par_chk_en) );
  OAI31X1M U34 ( .A0(n41), .A1(edge_cnt[1]), .A2(edge_cnt[0]), .B0(RX_IN_r), 
        .Y(n34) );
  OR3X2M U35 ( .A(edge_cnt[4]), .B(edge_cnt[3]), .C(edge_cnt[2]), .Y(n41) );
  NOR3X2M U36 ( .A(n47), .B(bit_cnt[2]), .C(n43), .Y(n42) );
  XNOR2X2M U37 ( .A(PAR_EN), .B(bit_cnt[0]), .Y(n43) );
  NAND3X2M U38 ( .A(cs[1]), .B(cs[0]), .C(cs[2]), .Y(n35) );
  INVX2M U39 ( .A(bit_cnt[3]), .Y(n47) );
  INVX2M U40 ( .A(bit_cnt[0]), .Y(n46) );
  OR2X2M U41 ( .A(prescale[1]), .B(N70), .Y(n4) );
  INVX2M U42 ( .A(prescale[1]), .Y(N71) );
  OR2X2M U43 ( .A(rst), .B(RX_IN), .Y(n3) );
  INVX2M U44 ( .A(rst), .Y(n24) );
  XNOR2X1M U45 ( .A(\sub_164/carry[5] ), .B(prescale[5]), .Y(N75) );
  OR2X1M U46 ( .A(prescale[4]), .B(\sub_164/carry[4] ), .Y(\sub_164/carry[5] )
         );
  XNOR2X1M U47 ( .A(\sub_164/carry[4] ), .B(prescale[4]), .Y(N74) );
  OR2X1M U48 ( .A(prescale[3]), .B(\sub_164/carry[3] ), .Y(\sub_164/carry[4] )
         );
  XNOR2X1M U49 ( .A(\sub_164/carry[3] ), .B(prescale[3]), .Y(N73) );
  OR2X1M U50 ( .A(prescale[2]), .B(prescale[1]), .Y(\sub_164/carry[3] ) );
  XNOR2X1M U51 ( .A(prescale[1]), .B(prescale[2]), .Y(N72) );
  CLKINVX1M U52 ( .A(N70), .Y(N34) );
  OAI2BB1X1M U53 ( .A0N(N70), .A1N(prescale[1]), .B0(n4), .Y(N35) );
  OR2X1M U54 ( .A(n4), .B(prescale[2]), .Y(n5) );
  OAI2BB1X1M U55 ( .A0N(n4), .A1N(prescale[2]), .B0(n5), .Y(N36) );
  OR2X1M U56 ( .A(n5), .B(prescale[3]), .Y(n6) );
  OAI2BB1X1M U57 ( .A0N(n5), .A1N(prescale[3]), .B0(n6), .Y(N37) );
  OR2X1M U58 ( .A(n6), .B(prescale[4]), .Y(n7) );
  OAI2BB1X1M U59 ( .A0N(n6), .A1N(prescale[4]), .B0(n7), .Y(N38) );
  NOR2X1M U60 ( .A(n7), .B(prescale[5]), .Y(N40) );
  AO21XLM U61 ( .A0(n7), .A1(prescale[5]), .B0(N40), .Y(N39) );
  NOR2BX1M U62 ( .AN(edge_cnt[0]), .B(N34), .Y(n8) );
  OAI2B2X1M U63 ( .A1N(N35), .A0(n8), .B0(edge_cnt[1]), .B1(n8), .Y(n11) );
  NOR2BX1M U64 ( .AN(N34), .B(edge_cnt[0]), .Y(n9) );
  OAI2B2X1M U65 ( .A1N(edge_cnt[1]), .A0(n9), .B0(N35), .B1(n9), .Y(n10) );
  NAND4BBX1M U66 ( .AN(N40), .BN(N39), .C(n11), .D(n10), .Y(n15) );
  CLKXOR2X2M U67 ( .A(N38), .B(edge_cnt[4]), .Y(n14) );
  CLKXOR2X2M U68 ( .A(N36), .B(edge_cnt[2]), .Y(n13) );
  CLKXOR2X2M U69 ( .A(N37), .B(edge_cnt[3]), .Y(n12) );
  NOR4X1M U70 ( .A(n15), .B(n14), .C(n13), .D(n12), .Y(N41) );
  NOR2BX1M U71 ( .AN(edge_cnt[0]), .B(N70), .Y(n16) );
  OAI2B2X1M U72 ( .A1N(N71), .A0(n16), .B0(edge_cnt[1]), .B1(n16), .Y(n19) );
  NOR2BX1M U73 ( .AN(N70), .B(edge_cnt[0]), .Y(n17) );
  OAI2B2X1M U74 ( .A1N(edge_cnt[1]), .A0(n17), .B0(N71), .B1(n17), .Y(n18) );
  NAND4BBX1M U75 ( .AN(n2), .BN(N75), .C(n19), .D(n18), .Y(n23) );
  CLKXOR2X2M U76 ( .A(N74), .B(edge_cnt[4]), .Y(n22) );
  CLKXOR2X2M U77 ( .A(N72), .B(edge_cnt[2]), .Y(n21) );
  CLKXOR2X2M U78 ( .A(N73), .B(edge_cnt[3]), .Y(n20) );
  NOR4X1M U79 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N77) );
endmodule


module edge_bit_counter ( edge_bit_enable, PAR_EN, clk, prescale, rst, 
        edge_cnt, bit_cnt );
  input [5:0] prescale;
  output [4:0] edge_cnt;
  output [3:0] bit_cnt;
  input edge_bit_enable, PAR_EN, clk, rst;
  wire   N7, N8, N9, N10, N11, N17, N18, N19, N20, N21, N22, N23, N24, N25,
         N26, N27, N28, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         \add_46/carry[4] , \add_46/carry[3] , \add_46/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30;
  tri   clk;
  tri   rst;

  DFFRQX2M \edge_cnt_reg[4]  ( .D(N21), .CK(clk), .RN(rst), .Q(edge_cnt[4]) );
  DFFRQX1M \edge_cnt_reg[3]  ( .D(N20), .CK(clk), .RN(rst), .Q(edge_cnt[3]) );
  DFFRQX1M \edge_cnt_reg[2]  ( .D(N19), .CK(clk), .RN(rst), .Q(edge_cnt[2]) );
  DFFRQX1M \edge_cnt_reg[1]  ( .D(N18), .CK(clk), .RN(rst), .Q(edge_cnt[1]) );
  DFFRQX1M \edge_cnt_reg[0]  ( .D(N17), .CK(clk), .RN(rst), .Q(edge_cnt[0]) );
  DFFRQX1M \bit_cnt_reg[3]  ( .D(n16), .CK(clk), .RN(rst), .Q(bit_cnt[3]) );
  DFFRQX1M \bit_cnt_reg[0]  ( .D(n19), .CK(clk), .RN(rst), .Q(bit_cnt[0]) );
  DFFRQX1M \bit_cnt_reg[1]  ( .D(n18), .CK(clk), .RN(rst), .Q(bit_cnt[1]) );
  DFFRQX1M \bit_cnt_reg[2]  ( .D(n17), .CK(clk), .RN(rst), .Q(bit_cnt[2]) );
  INVX2M U3 ( .A(edge_bit_enable), .Y(n30) );
  INVX2M U4 ( .A(n15), .Y(n24) );
  NOR2X2M U5 ( .A(n30), .B(N28), .Y(n15) );
  AOI21X2M U6 ( .A0(n26), .A1(edge_bit_enable), .B0(n15), .Y(n14) );
  AND2X2M U7 ( .A(N8), .B(n15), .Y(N18) );
  AND2X2M U8 ( .A(N9), .B(n15), .Y(N19) );
  AND2X2M U9 ( .A(N10), .B(n15), .Y(N20) );
  NOR3X2M U10 ( .A(n27), .B(n26), .C(n28), .Y(n11) );
  OAI32X1M U11 ( .A0(n30), .A1(bit_cnt[0]), .A2(n15), .B0(n26), .B1(n24), .Y(
        n19) );
  OAI32X1M U12 ( .A0(n12), .A1(bit_cnt[2]), .A2(n27), .B0(n13), .B1(n28), .Y(
        n17) );
  OA21X2M U13 ( .A0(n30), .A1(bit_cnt[1]), .B0(n14), .Y(n13) );
  OAI22X1M U14 ( .A0(n29), .A1(n24), .B0(n10), .B1(n30), .Y(n16) );
  AOI32X1M U15 ( .A0(n11), .A1(n29), .A2(N28), .B0(bit_cnt[3]), .B1(n25), .Y(
        n10) );
  INVX2M U16 ( .A(bit_cnt[3]), .Y(n29) );
  INVX2M U17 ( .A(n11), .Y(n25) );
  OAI22X1M U18 ( .A0(n14), .A1(n27), .B0(bit_cnt[1]), .B1(n12), .Y(n18) );
  NAND3X2M U19 ( .A(bit_cnt[0]), .B(n24), .C(edge_bit_enable), .Y(n12) );
  AND2X2M U20 ( .A(N11), .B(n15), .Y(N21) );
  AND2X2M U21 ( .A(N7), .B(n15), .Y(N17) );
  INVX2M U22 ( .A(bit_cnt[0]), .Y(n26) );
  INVX2M U23 ( .A(bit_cnt[1]), .Y(n27) );
  INVX2M U24 ( .A(bit_cnt[2]), .Y(n28) );
  ADDHX1M U25 ( .A(edge_cnt[2]), .B(\add_46/carry[2] ), .CO(\add_46/carry[3] ), 
        .S(N9) );
  ADDHX1M U26 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_46/carry[2] ), .S(
        N8) );
  ADDHX1M U27 ( .A(edge_cnt[3]), .B(\add_46/carry[3] ), .CO(\add_46/carry[4] ), 
        .S(N10) );
  OR2X2M U28 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  INVX2M U29 ( .A(prescale[3]), .Y(n5) );
  CLKINVX1M U30 ( .A(prescale[0]), .Y(N22) );
  OAI2BB1X1M U31 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N23) );
  NOR2X1M U32 ( .A(n1), .B(prescale[2]), .Y(n2) );
  AO21XLM U33 ( .A0(n1), .A1(prescale[2]), .B0(n2), .Y(N24) );
  CLKNAND2X2M U34 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U35 ( .A0(n2), .A1(n5), .B0(n3), .Y(N25) );
  XNOR2X1M U36 ( .A(prescale[4]), .B(n3), .Y(N26) );
  NOR2X1M U37 ( .A(prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U38 ( .A(prescale[5]), .B(n4), .Y(N27) );
  CLKINVX1M U39 ( .A(edge_cnt[0]), .Y(N7) );
  CLKXOR2X2M U40 ( .A(\add_46/carry[4] ), .B(edge_cnt[4]), .Y(N11) );
  NOR2BX1M U41 ( .AN(N22), .B(edge_cnt[0]), .Y(n6) );
  OAI2B2X1M U42 ( .A1N(edge_cnt[1]), .A0(n6), .B0(N23), .B1(n6), .Y(n9) );
  NOR2BX1M U43 ( .AN(edge_cnt[0]), .B(N22), .Y(n7) );
  OAI2B2X1M U44 ( .A1N(N23), .A0(n7), .B0(edge_cnt[1]), .B1(n7), .Y(n8) );
  NAND3BX1M U45 ( .AN(N27), .B(n9), .C(n8), .Y(n23) );
  CLKXOR2X2M U46 ( .A(N26), .B(edge_cnt[4]), .Y(n22) );
  CLKXOR2X2M U47 ( .A(N24), .B(edge_cnt[2]), .Y(n21) );
  CLKXOR2X2M U48 ( .A(N25), .B(edge_cnt[3]), .Y(n20) );
  NOR4X1M U49 ( .A(n23), .B(n22), .C(n21), .D(n20), .Y(N28) );
endmodule


module data_sampling ( prescale, RX_IN, edge_cnt, data_sample_en, clk, rst, 
        sampled_bit );
  input [5:0] prescale;
  input [4:0] edge_cnt;
  input RX_IN, data_sample_en, clk, rst;
  output sampled_bit;
  wire   RX_IN_r, data_1, data_2, data_3, n19, n20, \add_45/carry[4] ,
         \add_45/carry[3] , \add_45/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39;
  wire   [4:0] half_edge;
  wire   [4:0] half_edge_plus1;
  wire   [4:0] half_edge_minus1;
  tri   clk;
  tri   rst;

  DFFSQX2M RX_IN_r_reg ( .D(RX_IN), .CK(clk), .SN(rst), .Q(RX_IN_r) );
  DFFRQX2M data_3_reg ( .D(n39), .CK(clk), .RN(rst), .Q(data_3) );
  DFFRQX2M data_2_reg ( .D(n19), .CK(clk), .RN(rst), .Q(data_2) );
  DFFRQX1M data_1_reg ( .D(n20), .CK(clk), .RN(rst), .Q(data_1) );
  INVX2M U3 ( .A(half_edge[2]), .Y(n8) );
  ADDHX1M U4 ( .A(half_edge[2]), .B(\add_45/carry[2] ), .CO(\add_45/carry[3] ), 
        .S(half_edge_plus1[2]) );
  ADDHX1M U5 ( .A(half_edge[1]), .B(half_edge[0]), .CO(\add_45/carry[2] ), .S(
        half_edge_plus1[1]) );
  ADDHX1M U6 ( .A(half_edge[3]), .B(\add_45/carry[3] ), .CO(\add_45/carry[4] ), 
        .S(half_edge_plus1[3]) );
  INVX2M U7 ( .A(prescale[3]), .Y(n4) );
  CLKINVX1M U8 ( .A(prescale[1]), .Y(half_edge[0]) );
  NOR2X1M U9 ( .A(prescale[2]), .B(prescale[1]), .Y(n1) );
  AO21XLM U10 ( .A0(prescale[1]), .A1(prescale[2]), .B0(n1), .Y(half_edge[1])
         );
  CLKNAND2X2M U11 ( .A(n1), .B(n4), .Y(n2) );
  OAI21X1M U12 ( .A0(n1), .A1(n4), .B0(n2), .Y(half_edge[2]) );
  XNOR2X1M U13 ( .A(prescale[4]), .B(n2), .Y(half_edge[3]) );
  NOR2X1M U14 ( .A(prescale[4]), .B(n2), .Y(n3) );
  CLKXOR2X2M U15 ( .A(prescale[5]), .B(n3), .Y(half_edge[4]) );
  CLKXOR2X2M U16 ( .A(\add_45/carry[4] ), .B(half_edge[4]), .Y(
        half_edge_plus1[4]) );
  NOR2X1M U17 ( .A(half_edge[1]), .B(half_edge[0]), .Y(n5) );
  AO21XLM U18 ( .A0(half_edge[0]), .A1(half_edge[1]), .B0(n5), .Y(
        half_edge_minus1[1]) );
  CLKNAND2X2M U19 ( .A(n5), .B(n8), .Y(n6) );
  OAI21X1M U20 ( .A0(n5), .A1(n8), .B0(n6), .Y(half_edge_minus1[2]) );
  XNOR2X1M U21 ( .A(half_edge[3]), .B(n6), .Y(half_edge_minus1[3]) );
  NOR2X1M U22 ( .A(half_edge[3]), .B(n6), .Y(n7) );
  CLKXOR2X2M U23 ( .A(half_edge[4]), .B(n7), .Y(half_edge_minus1[4]) );
  OAI2BB1X1M U24 ( .A0N(data_1), .A1N(data_2), .B0(n9), .Y(sampled_bit) );
  OAI21X1M U25 ( .A0(data_1), .A1(data_2), .B0(data_3), .Y(n9) );
  MXI2X1M U26 ( .A(n10), .B(n11), .S0(n12), .Y(n39) );
  NOR4X1M U27 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n12) );
  CLKXOR2X2M U28 ( .A(half_edge_plus1[2]), .B(edge_cnt[2]), .Y(n16) );
  CLKXOR2X2M U29 ( .A(half_edge_plus1[4]), .B(edge_cnt[4]), .Y(n15) );
  CLKXOR2X2M U30 ( .A(half_edge_plus1[3]), .B(edge_cnt[3]), .Y(n14) );
  NAND4X1M U31 ( .A(n17), .B(n18), .C(n21), .D(n22), .Y(n13) );
  NAND4BBX1M U32 ( .AN(n23), .BN(n24), .C(n25), .D(n26), .Y(n21) );
  XNOR2X1M U33 ( .A(edge_cnt[0]), .B(prescale[1]), .Y(n18) );
  XNOR2X1M U34 ( .A(edge_cnt[1]), .B(half_edge_plus1[1]), .Y(n17) );
  CLKNAND2X2M U35 ( .A(data_sample_en), .B(data_3), .Y(n10) );
  MXI2X1M U36 ( .A(n11), .B(n27), .S0(n22), .Y(n20) );
  CLKNAND2X2M U37 ( .A(data_sample_en), .B(data_1), .Y(n27) );
  MXI2X1M U38 ( .A(n28), .B(n11), .S0(n29), .Y(n19) );
  NOR4BX1M U39 ( .AN(n22), .B(n30), .C(n23), .D(n24), .Y(n29) );
  CLKXOR2X2M U40 ( .A(edge_cnt[2]), .B(half_edge_minus1[2]), .Y(n24) );
  CLKXOR2X2M U41 ( .A(edge_cnt[4]), .B(half_edge_minus1[4]), .Y(n23) );
  CLKNAND2X2M U42 ( .A(n25), .B(n26), .Y(n30) );
  AND2X1M U43 ( .A(n31), .B(n32), .Y(n26) );
  XNOR2X1M U44 ( .A(edge_cnt[0]), .B(prescale[1]), .Y(n32) );
  XNOR2X1M U45 ( .A(edge_cnt[1]), .B(half_edge_minus1[1]), .Y(n31) );
  XNOR2X1M U46 ( .A(edge_cnt[3]), .B(half_edge_minus1[3]), .Y(n25) );
  NAND4X1M U47 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n22) );
  XNOR2X1M U48 ( .A(edge_cnt[0]), .B(half_edge[0]), .Y(n36) );
  NOR2X1M U49 ( .A(n37), .B(n38), .Y(n35) );
  CLKXOR2X2M U50 ( .A(half_edge[2]), .B(edge_cnt[2]), .Y(n38) );
  CLKXOR2X2M U51 ( .A(half_edge[1]), .B(edge_cnt[1]), .Y(n37) );
  XNOR2X1M U52 ( .A(edge_cnt[3]), .B(half_edge[3]), .Y(n34) );
  XNOR2X1M U53 ( .A(edge_cnt[4]), .B(half_edge[4]), .Y(n33) );
  CLKNAND2X2M U54 ( .A(data_sample_en), .B(RX_IN_r), .Y(n11) );
  CLKNAND2X2M U55 ( .A(data_sample_en), .B(data_2), .Y(n28) );
endmodule


module deserializer ( sampled_bit, deser_en, edge_cnt, clk, rst, prescale, 
        PAR_EN, P_DATA );
  input [4:0] edge_cnt;
  input [5:0] prescale;
  output [7:0] P_DATA;
  input sampled_bit, deser_en, clk, rst, PAR_EN;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, n5, n6, n7, n8, n9, n10, n11, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n1, n2, n3, n4, n12, n22, n23,
         n24, n25, n26, n27, n28, n29;
  tri   clk;
  tri   rst;

  DFFRX1M \P_DATA_reg[7]  ( .D(n21), .CK(clk), .RN(rst), .Q(P_DATA[7]), .QN(n5) );
  DFFRX1M \P_DATA_reg[3]  ( .D(n17), .CK(clk), .RN(rst), .Q(P_DATA[3]), .QN(n9) );
  DFFRX1M \P_DATA_reg[5]  ( .D(n19), .CK(clk), .RN(rst), .Q(P_DATA[5]), .QN(n7) );
  DFFRX1M \P_DATA_reg[1]  ( .D(n15), .CK(clk), .RN(rst), .Q(P_DATA[1]), .QN(
        n11) );
  DFFRX1M \P_DATA_reg[4]  ( .D(n18), .CK(clk), .RN(rst), .Q(P_DATA[4]), .QN(n8) );
  DFFRX1M \P_DATA_reg[6]  ( .D(n20), .CK(clk), .RN(rst), .Q(P_DATA[6]), .QN(n6) );
  DFFRX1M \P_DATA_reg[2]  ( .D(n16), .CK(clk), .RN(rst), .Q(P_DATA[2]), .QN(
        n10) );
  DFFRQX1M \P_DATA_reg[0]  ( .D(n14), .CK(clk), .RN(rst), .Q(P_DATA[0]) );
  INVX2M U3 ( .A(n13), .Y(n29) );
  NAND2X2M U4 ( .A(deser_en), .B(N12), .Y(n13) );
  OAI22X1M U5 ( .A0(n13), .A1(n10), .B0(n29), .B1(n11), .Y(n15) );
  OAI22X1M U6 ( .A0(n13), .A1(n9), .B0(n29), .B1(n10), .Y(n16) );
  OAI22X1M U7 ( .A0(n13), .A1(n8), .B0(n29), .B1(n9), .Y(n17) );
  OAI22X1M U8 ( .A0(n13), .A1(n7), .B0(n29), .B1(n8), .Y(n18) );
  OAI22X1M U9 ( .A0(n13), .A1(n6), .B0(n29), .B1(n7), .Y(n19) );
  OAI22X1M U10 ( .A0(n13), .A1(n5), .B0(n29), .B1(n6), .Y(n20) );
  OAI2BB2X1M U11 ( .B0(n13), .B1(n11), .A0N(P_DATA[0]), .A1N(n13), .Y(n14) );
  OAI2BB2X1M U12 ( .B0(n29), .B1(n5), .A0N(sampled_bit), .A1N(n29), .Y(n21) );
  OR2X2M U13 ( .A(prescale[1]), .B(prescale[0]), .Y(n1) );
  CLKINVX1M U14 ( .A(prescale[0]), .Y(N5) );
  OAI2BB1X1M U15 ( .A0N(prescale[0]), .A1N(prescale[1]), .B0(n1), .Y(N6) );
  OR2X1M U16 ( .A(n1), .B(prescale[2]), .Y(n2) );
  OAI2BB1X1M U17 ( .A0N(n1), .A1N(prescale[2]), .B0(n2), .Y(N7) );
  OR2X1M U18 ( .A(n2), .B(prescale[3]), .Y(n3) );
  OAI2BB1X1M U19 ( .A0N(n2), .A1N(prescale[3]), .B0(n3), .Y(N8) );
  OR2X1M U20 ( .A(n3), .B(prescale[4]), .Y(n4) );
  OAI2BB1X1M U21 ( .A0N(n3), .A1N(prescale[4]), .B0(n4), .Y(N9) );
  NOR2X1M U22 ( .A(n4), .B(prescale[5]), .Y(N11) );
  AO21XLM U23 ( .A0(n4), .A1(prescale[5]), .B0(N11), .Y(N10) );
  NOR2BX1M U24 ( .AN(edge_cnt[0]), .B(N5), .Y(n12) );
  OAI2B2X1M U25 ( .A1N(N6), .A0(n12), .B0(edge_cnt[1]), .B1(n12), .Y(n24) );
  NOR2BX1M U26 ( .AN(N5), .B(edge_cnt[0]), .Y(n22) );
  OAI2B2X1M U27 ( .A1N(edge_cnt[1]), .A0(n22), .B0(N6), .B1(n22), .Y(n23) );
  NAND4BBX1M U28 ( .AN(N11), .BN(N10), .C(n24), .D(n23), .Y(n28) );
  CLKXOR2X2M U29 ( .A(N9), .B(edge_cnt[4]), .Y(n27) );
  CLKXOR2X2M U30 ( .A(N7), .B(edge_cnt[2]), .Y(n26) );
  CLKXOR2X2M U31 ( .A(N8), .B(edge_cnt[3]), .Y(n25) );
  NOR4X1M U32 ( .A(n28), .B(n27), .C(n26), .D(n25), .Y(N12) );
endmodule


module parity_check ( par_chk_en, PAR_TYP, sampled_bit, clk, rst, P_DATA, 
        parity_error );
  input [7:0] P_DATA;
  input par_chk_en, PAR_TYP, sampled_bit, clk, rst;
  output parity_error;
  wire   N7, n1, n2, n3, n4, n5, n6;
  tri   clk;
  tri   rst;

  DFFRQX2M parity_error_reg ( .D(N7), .CK(clk), .RN(rst), .Q(parity_error) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n5), .Y(n3) );
  XNOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n5) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n6), .Y(n2) );
  XNOR2X2M U6 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n6) );
  NOR2BX2M U7 ( .AN(par_chk_en), .B(n1), .Y(N7) );
  XOR3XLM U8 ( .A(n2), .B(n3), .C(n4), .Y(n1) );
  XNOR2X2M U9 ( .A(sampled_bit), .B(PAR_TYP), .Y(n4) );
endmodule


module strt_check ( sampled_bit, strt_chk_en, clk, rst, strt_glitch );
  input sampled_bit, strt_chk_en, clk, rst;
  output strt_glitch;
  wire   N4;
  tri   clk;
  tri   rst;

  DFFRQX1M strt_glitch_reg ( .D(N4), .CK(clk), .RN(rst), .Q(strt_glitch) );
  AND2X2M U3 ( .A(strt_chk_en), .B(sampled_bit), .Y(N4) );
endmodule


module stop_check ( stp_chk_en, sampled_bit, clk, rst, stop_error );
  input stp_chk_en, sampled_bit, clk, rst;
  output stop_error;
  wire   N5;
  tri   clk;
  tri   rst;

  DFFRQX2M stop_error_reg ( .D(N5), .CK(clk), .RN(rst), .Q(stop_error) );
  NOR2BX2M U3 ( .AN(stp_chk_en), .B(sampled_bit), .Y(N5) );
endmodule


module UART_RX_TOP ( RX_IN, prescale, PAR_EN, PAR_TYP, clk, rst, P_DATA, 
        parity_error, stop_error, data_valid );
  input [5:0] prescale;
  output [7:0] P_DATA;
  input RX_IN, PAR_EN, PAR_TYP, clk, rst;
  output parity_error, stop_error, data_valid;
  wire   data_sample_en, edge_bit_enable, deser_en, stp_chk_en, strt_chk_en,
         par_chk_en, strt_glitch, sampled_bit;
  wire   [4:0] edge_cnt;
  wire   [3:0] bit_cnt;
  tri   clk;
  tri   rst;

  RX_FSM R1 ( .RX_IN(RX_IN), .PAR_EN(PAR_EN), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt), .parity_error(parity_error), .strt_glitch(strt_glitch), 
        .stop_error(stop_error), .prescale(prescale), .clk(clk), .rst(rst), 
        .edge_bit_enable(edge_bit_enable), .data_sample_en(data_sample_en), 
        .par_chk_en(par_chk_en), .strt_chk_en(strt_chk_en), .stp_chk_en(
        stp_chk_en), .deser_en(deser_en), .data_valid(data_valid) );
  edge_bit_counter e1 ( .edge_bit_enable(edge_bit_enable), .PAR_EN(PAR_EN), 
        .clk(clk), .prescale(prescale), .rst(rst), .edge_cnt(edge_cnt), 
        .bit_cnt(bit_cnt) );
  data_sampling d1 ( .prescale(prescale), .RX_IN(RX_IN), .edge_cnt(edge_cnt), 
        .data_sample_en(data_sample_en), .clk(clk), .rst(rst), .sampled_bit(
        sampled_bit) );
  deserializer DE1 ( .sampled_bit(sampled_bit), .deser_en(deser_en), 
        .edge_cnt(edge_cnt), .clk(clk), .rst(rst), .prescale(prescale), 
        .PAR_EN(PAR_EN), .P_DATA(P_DATA) );
  parity_check p1 ( .par_chk_en(par_chk_en), .PAR_TYP(PAR_TYP), .sampled_bit(
        sampled_bit), .clk(clk), .rst(rst), .P_DATA(P_DATA), .parity_error(
        parity_error) );
  strt_check s1 ( .sampled_bit(sampled_bit), .strt_chk_en(strt_chk_en), .clk(
        clk), .rst(rst), .strt_glitch(strt_glitch) );
  stop_check st1 ( .stp_chk_en(stp_chk_en), .sampled_bit(sampled_bit), .clk(
        clk), .rst(rst), .stop_error(stop_error) );
endmodule


module UART ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;

  tri   RST;
  tri   RX_CLK;

  UART_TX_TOP U0_UART_TX ( .P_DATA(TX_IN_P), .Data_valid(TX_IN_V), .PAR_EN(
        parity_enable), .PAR_TYP(parity_type), .clk(TX_CLK), .rst(RST), 
        .TX_OUT(TX_OUT_S), .BUSY(TX_OUT_V) );
  UART_RX_TOP U0_UART_RX ( .RX_IN(RX_IN_S), .prescale(Prescale), .PAR_EN(
        parity_enable), .PAR_TYP(parity_type), .clk(RX_CLK), .rst(RST), 
        .P_DATA(RX_OUT_P), .parity_error(parity_error), .stop_error(
        framing_error), .data_valid(RX_OUT_V) );
endmodule


module reset_sync_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[1] ;
  tri   CLK;
  tri   SYNC_RST;

  DFFRQX2M \sync_reg_reg[1]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[1] )
         );
  DFFRQX2M \sync_reg_reg[0]  ( .D(\sync_reg[1] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
endmodule


module reset_sync_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[1] ;
  tri   SYNC_RST;

  DFFRQX2M \sync_reg_reg[1]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[1] )
         );
  DFFRHQX8M \sync_reg_reg[0]  ( .D(\sync_reg[1] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
endmodule


module DATA_SYNC ( CLK, RST, unsync_bus, bus_enable, sync_bus, enable_pulse_d
 );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse_d;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;
  tri   CLK;
  tri   RST;

  DFFRHQX1M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  DFFRQX1M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX1M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        enable_flop) );
  DFFRQX1M enable_pulse_d_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse_d) );
  DFFRQX1M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX1M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX1M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX1M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX1M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX1M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX1M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX1M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  tri   i_rst;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX1M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFRQX1M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX1M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX1M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX1M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX1M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX1M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  DFFRQX1M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  NAND2BX2M U4 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  OR2X2M U5 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n25) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n24) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n23) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n22) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n21) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n20) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n19) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n18) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n17) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   N2, div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;
  tri   i_rst;
  tri   o_div_clk;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFSQX2M odd_edge_tog_reg ( .D(n51), .CK(i_ref_clk), .SN(i_rst), .Q(
        odd_edge_tog) );
  DFFRQX1M div_clk_reg ( .D(n50), .CK(i_ref_clk), .RN(i_rst), .Q(div_clk) );
  DFFRQX1M \count_reg[6]  ( .D(n49), .CK(i_ref_clk), .RN(i_rst), .Q(count[6])
         );
  DFFRQX1M \count_reg[5]  ( .D(n48), .CK(i_ref_clk), .RN(i_rst), .Q(count[5])
         );
  DFFRQX1M \count_reg[4]  ( .D(n47), .CK(i_ref_clk), .RN(i_rst), .Q(count[4])
         );
  DFFRQX1M \count_reg[3]  ( .D(n46), .CK(i_ref_clk), .RN(i_rst), .Q(count[3])
         );
  DFFRQX1M \count_reg[2]  ( .D(n45), .CK(i_ref_clk), .RN(i_rst), .Q(count[2])
         );
  DFFRQX1M \count_reg[1]  ( .D(n44), .CK(i_ref_clk), .RN(i_rst), .Q(count[1])
         );
  DFFRQX1M \count_reg[0]  ( .D(n43), .CK(i_ref_clk), .RN(i_rst), .Q(count[0])
         );
  MX2X2M U3 ( .A(i_ref_clk), .B(div_clk), .S0(N2), .Y(o_div_clk) );
  OR2X2M U4 ( .A(i_div_ratio[2]), .B(i_div_ratio[1]), .Y(n1) );
  NAND2BX2M U5 ( .AN(n41), .B(i_clk_en), .Y(n7) );
  INVX2M U6 ( .A(i_div_ratio[5]), .Y(n6) );
  CLKINVX1M U7 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  OAI2BB1X1M U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n1), .Y(
        edge_flip_half[1]) );
  OR2X1M U9 ( .A(n1), .B(i_div_ratio[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(i_div_ratio[3]), .B0(n2), .Y(
        edge_flip_half[2]) );
  NOR2X1M U11 ( .A(n2), .B(i_div_ratio[4]), .Y(n3) );
  AO21XLM U12 ( .A0(n2), .A1(i_div_ratio[4]), .B0(n3), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U13 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U14 ( .A0(n3), .A1(n6), .B0(n4), .Y(edge_flip_half[4]) );
  XNOR2X1M U15 ( .A(i_div_ratio[6]), .B(n4), .Y(edge_flip_half[5]) );
  NOR2X1M U16 ( .A(i_div_ratio[6]), .B(n4), .Y(n5) );
  CLKXOR2X2M U17 ( .A(i_div_ratio[7]), .B(n5), .Y(edge_flip_half[6]) );
  AO22X1M U18 ( .A0(n7), .A1(count[0]), .B0(N16), .B1(n8), .Y(n43) );
  AO22X1M U19 ( .A0(n7), .A1(count[1]), .B0(N17), .B1(n8), .Y(n44) );
  AO22X1M U20 ( .A0(n7), .A1(count[2]), .B0(N18), .B1(n8), .Y(n45) );
  AO22X1M U21 ( .A0(n7), .A1(count[3]), .B0(N19), .B1(n8), .Y(n46) );
  AO22X1M U22 ( .A0(n7), .A1(count[4]), .B0(N20), .B1(n8), .Y(n47) );
  AO22X1M U23 ( .A0(n7), .A1(count[5]), .B0(N21), .B1(n8), .Y(n48) );
  AO22X1M U24 ( .A0(n7), .A1(count[6]), .B0(N22), .B1(n8), .Y(n49) );
  AND3X1M U25 ( .A(n9), .B(n10), .C(N2), .Y(n8) );
  CLKXOR2X2M U26 ( .A(div_clk), .B(n11), .Y(n50) );
  AOI21X1M U27 ( .A0(n10), .A1(n9), .B0(n7), .Y(n11) );
  OR2X1M U28 ( .A(n12), .B(i_div_ratio[0]), .Y(n9) );
  XNOR2X1M U29 ( .A(odd_edge_tog), .B(n13), .Y(n51) );
  OR2X1M U30 ( .A(n10), .B(n7), .Y(n13) );
  CLKNAND2X2M U31 ( .A(n14), .B(i_div_ratio[0]), .Y(n10) );
  MXI2X1M U32 ( .A(n15), .B(n12), .S0(odd_edge_tog), .Y(n14) );
  NAND4X1M U33 ( .A(n16), .B(n26), .C(n27), .D(n28), .Y(n12) );
  NOR4X1M U34 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n28) );
  CLKXOR2X2M U35 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n32) );
  CLKXOR2X2M U36 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n31) );
  CLKXOR2X2M U37 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n29) );
  XNOR2X1M U39 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n27) );
  XNOR2X1M U40 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n26) );
  XNOR2X1M U41 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n16) );
  NAND4X1M U42 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n15) );
  NOR4X1M U43 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n36) );
  CLKXOR2X2M U44 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n40) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n38) );
  CLKXOR2X2M U47 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n37) );
  XNOR2X1M U48 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n34) );
  XNOR2X1M U50 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n33) );
  CLKINVX1M U51 ( .A(n7), .Y(N2) );
  NOR4BX1M U52 ( .AN(n42), .B(i_div_ratio[2]), .C(i_div_ratio[3]), .D(
        i_div_ratio[1]), .Y(n41) );
  NOR4X1M U53 ( .A(i_div_ratio[7]), .B(i_div_ratio[6]), .C(i_div_ratio[5]), 
        .D(i_div_ratio[4]), .Y(n42) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  NAND4BX1M U11 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U12 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U13 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR3X2M U14 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR4X1M U15 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U16 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  OAI211X2M U17 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U18 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U19 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  INVX2M U20 ( .A(IN[0]), .Y(n17) );
  INVX2M U21 ( .A(IN[1]), .Y(n16) );
  INVX2M U22 ( .A(IN[2]), .Y(n15) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   RdData_Valid_T, OUT_Valid_T, RX_D_VLD_T, FIFO_FULL_T, TX_D_VLD_T,
         clk_div_en_T, ALU_EN_T, CLK_EN_T, WrEn_T, RdEn_T, GATED_CLK_T,
         R_INC_T, EMPTY_T, TX_REF_CLK, BUSY, RX_OUT_V_T, n1, n2, n3;
  wire   [15:0] ALU_OUT_T;
  wire   [7:0] RdData_T;
  wire   [7:0] RX_P_DATA_T;
  wire   [7:0] TX_P_DATA_T;
  wire   [3:0] ALU_FUN_T;
  wire   [3:0] Adrress_T;
  wire   [7:0] Wr_Data_T;
  wire   [7:0] REG0_T;
  wire   [7:0] REG1_T;
  wire   [7:0] REG2_T;
  wire   [7:0] REG3_T;
  wire   [7:0] RD_DATA_T;
  wire   [7:0] RX_OUT_P_T;
  wire   [7:0] DIV_RATIO_RX;
  tri   REF_CLK;
  tri   SYNC_REF_RST;
  tri   RX_REF_CLK;
  tri   SYNC_UART_RST;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  SYS_CNTRL system_control ( .CLK(REF_CLK), .RST(SYNC_REF_RST), .RdData_Valid(
        RdData_Valid_T), .ALU_OUT(ALU_OUT_T), .OUT_Valid(OUT_Valid_T), 
        .RdData(RdData_T), .RX_P_DATA(RX_P_DATA_T), .RX_D_VLD(RX_D_VLD_T), 
        .FIFO_FULL(FIFO_FULL_T), .TX_P_DATA(TX_P_DATA_T), .TX_D_VLD(TX_D_VLD_T), .clk_div_en(clk_div_en_T), .ALU_FUN(ALU_FUN_T), .ALU_EN(ALU_EN_T), .CLK_EN(
        CLK_EN_T), .Adrress(Adrress_T), .WrEn(WrEn_T), .RdEn(RdEn_T), .WrData(
        Wr_Data_T) );
  RegFile RegFile_inst ( .CLK(REF_CLK), .RST(SYNC_REF_RST), .WrEn(WrEn_T), 
        .RdEn(RdEn_T), .Address({Adrress_T[3:2], n3, n2}), .WrData(Wr_Data_T), 
        .RdData(RdData_T), .RdData_VLD(RdData_Valid_T), .REG0(REG0_T), .REG1(
        REG1_T), .REG2(REG2_T), .REG3(REG3_T) );
  ALU ALU_inst ( .A(REG0_T), .B(REG1_T), .EN(ALU_EN_T), .ALU_FUN(ALU_FUN_T), 
        .CLK(GATED_CLK_T), .RST(SYNC_REF_RST), .ALU_OUT(ALU_OUT_T), 
        .OUT_VALID(OUT_Valid_T) );
  CLK_GATE CLK_GATE_inst ( .CLK_EN(CLK_EN_T), .CLK(REF_CLK), .GATED_CLK(
        GATED_CLK_T) );
  Async_fifo Async_fifo_inst ( .i_w_clk(REF_CLK), .i_w_rstn(SYNC_REF_RST), 
        .i_w_inc(TX_D_VLD_T), .i_r_clk(RX_REF_CLK), .i_r_rstn(SYNC_UART_RST), 
        .i_r_inc(R_INC_T), .i_w_data(TX_P_DATA_T), .o_r_data(RD_DATA_T), 
        .o_full(FIFO_FULL_T), .o_empty(EMPTY_T) );
  PULSE_GEN PULSE_GEN_inst ( .RST(SYNC_UART_RST), .CLK(TX_REF_CLK), .LVL_SIG(
        BUSY), .PULSE_SIG(R_INC_T) );
  UART UART_inst ( .RST(SYNC_UART_RST), .TX_CLK(TX_REF_CLK), .RX_CLK(
        RX_REF_CLK), .RX_IN_S(UART_RX_IN), .RX_OUT_P(RX_OUT_P_T), .RX_OUT_V(
        RX_OUT_V_T), .TX_IN_P(RD_DATA_T), .TX_IN_V(n1), .TX_OUT_S(UART_TX_O), 
        .TX_OUT_V(BUSY), .Prescale(REG2_T[7:2]), .parity_enable(REG2_T[0]), 
        .parity_type(REG2_T[1]), .parity_error(parity_error), .framing_error(
        framing_error) );
  reset_sync_0 reset_sync_inst1 ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_REF_RST) );
  reset_sync_1 reset_sync_inst2 ( .RST(RST_N), .CLK(UART_CLK), .SYNC_RST(
        SYNC_UART_RST) );
  DATA_SYNC DATA_SYNC_inst ( .CLK(REF_CLK), .RST(SYNC_REF_RST), .unsync_bus(
        RX_OUT_P_T), .bus_enable(RX_OUT_V_T), .sync_bus(RX_P_DATA_T), 
        .enable_pulse_d(RX_D_VLD_T) );
  ClkDiv_0 ClkDiv_inst_TX ( .i_ref_clk(UART_CLK), .i_rst(SYNC_UART_RST), 
        .i_clk_en(clk_div_en_T), .i_div_ratio(REG3_T), .o_div_clk(TX_REF_CLK)
         );
  ClkDiv_1 ClkDiv_inst_RX ( .i_ref_clk(UART_CLK), .i_rst(SYNC_UART_RST), 
        .i_clk_en(clk_div_en_T), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, 
        DIV_RATIO_RX[3:0]}), .o_div_clk(RX_REF_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(REG2_T[7:2]), .OUT({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]}) );
  INVX2M U2 ( .A(EMPTY_T), .Y(n1) );
  BUFX2M U3 ( .A(Adrress_T[0]), .Y(n2) );
  BUFX2M U4 ( .A(Adrress_T[1]), .Y(n3) );
endmodule

