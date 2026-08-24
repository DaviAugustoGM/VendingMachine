/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri Aug 21 14:49:52 2026
/////////////////////////////////////////////////////////////


module credit_reg ( clk, rst, cancel, clear, load, coin_value, credit );
  input [7:0] coin_value;
  output [7:0] credit;
  input clk, rst, cancel, clear, load;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, add_x_1_n9, n2, n12, n13, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n31,
         n33, n35, n36, n37, n39, n41, n42, n43, n44, n45, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n60, n61, n63, n64, n65, n66,
         n67, n68, n69, n70, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103;

  DFFX1_RVT credit_reg_4_ ( .D(n7), .CLK(clk), .Q(credit[4]), .QN(n70) );
  DFFX1_RVT credit_reg_3_ ( .D(n8), .CLK(clk), .Q(credit[3]) );
  DFFX1_RVT credit_reg_2_ ( .D(n9), .CLK(clk), .Q(credit[2]), .QN(n72) );
  DFFX1_RVT credit_reg_1_ ( .D(n10), .CLK(clk), .Q(credit[1]), .QN(n73) );
  DFFX1_RVT credit_reg_0_ ( .D(n11), .CLK(clk), .Q(credit[0]), .QN(n67) );
  DFFX1_RVT credit_reg_7_ ( .D(n4), .CLK(clk), .Q(credit[7]), .QN(add_x_1_n9)
         );
  DFFX1_RVT credit_reg_6_ ( .D(n5), .CLK(clk), .Q(credit[6]), .QN(n68) );
  DFFX1_RVT credit_reg_5_ ( .D(n6), .CLK(clk), .Q(credit[5]), .QN(n69) );
  XNOR2X1_RVT U4 ( .A1(n64), .A2(n63), .Y(n2) );
  INVX0_RVT U7 ( .A(n21), .Y(n11) );
  INVX0_RVT U8 ( .A(n16), .Y(n17) );
  INVX0_RVT U10 ( .A(n42), .Y(n44) );
  INVX0_RVT U12 ( .A(n26), .Y(n22) );
  OAI22X1_RVT U13 ( .A1(n66), .A2(n72), .A3(n65), .A4(n2), .Y(n9) );
  OA21X1_RVT U17 ( .A1(n51), .A2(n83), .A3(n37), .Y(n13) );
  OAI22X1_RVT U19 ( .A1(n66), .A2(n70), .A3(n65), .A4(n15), .Y(n7) );
  OAI22X1_RVT U21 ( .A1(n66), .A2(n68), .A3(n65), .A4(n12), .Y(n5) );
  NOR2X0_RVT U22 ( .A1(credit[1]), .A2(coin_value[1]), .Y(n26) );
  NOR2X0_RVT U24 ( .A1(coin_value[5]), .A2(credit[5]), .Y(n42) );
  XNOR2X1_RVT U25 ( .A1(n50), .A2(n51), .Y(n15) );
  NOR2X0_RVT U26 ( .A1(credit[2]), .A2(coin_value[2]), .Y(n60) );
  NOR2X0_RVT U29 ( .A1(coin_value[0]), .A2(credit[0]), .Y(n16) );
  NAND2X0_RVT U30 ( .A1(credit[0]), .A2(coin_value[0]), .Y(n27) );
  NAND2X0_RVT U31 ( .A1(n17), .A2(n103), .Y(n20) );
  OA22X1_RVT U34 ( .A1(n20), .A2(n65), .A3(n67), .A4(n66), .Y(n21) );
  NAND2X0_RVT U35 ( .A1(credit[1]), .A2(coin_value[1]), .Y(n25) );
  NAND2X0_RVT U36 ( .A1(n22), .A2(n25), .Y(n23) );
  XNOR2X1_RVT U37 ( .A1(n23), .A2(n103), .Y(n24) );
  OAI22X1_RVT U38 ( .A1(n66), .A2(n73), .A3(n65), .A4(n24), .Y(n10) );
  OAI21X2_RVT U39 ( .A1(n27), .A2(n26), .A3(n25), .Y(n52) );
  NOR2X0_RVT U40 ( .A1(n53), .A2(n60), .Y(n29) );
  NAND2X0_RVT U41 ( .A1(credit[2]), .A2(coin_value[2]), .Y(n61) );
  NAND2X0_RVT U42 ( .A1(credit[3]), .A2(coin_value[3]), .Y(n54) );
  AOI21X2_RVT U44 ( .A1(n29), .A2(n52), .A3(n28), .Y(n51) );
  NOR2X0_RVT U45 ( .A1(n42), .A2(n47), .Y(n35) );
  NAND2X0_RVT U48 ( .A1(n35), .A2(n74), .Y(n33) );
  NAND2X0_RVT U49 ( .A1(credit[4]), .A2(coin_value[4]), .Y(n48) );
  NAND2X0_RVT U50 ( .A1(credit[5]), .A2(coin_value[5]), .Y(n43) );
  OAI21X2_RVT U51 ( .A1(n42), .A2(n48), .A3(n43), .Y(n36) );
  NAND2X0_RVT U52 ( .A1(credit[6]), .A2(coin_value[6]), .Y(n39) );
  INVX0_RVT U53 ( .A(n39), .Y(n31) );
  INVX0_RVT U55 ( .A(n36), .Y(n37) );
  NAND2X0_RVT U56 ( .A1(n74), .A2(n39), .Y(n41) );
  NAND2X0_RVT U58 ( .A1(n44), .A2(n43), .Y(n45) );
  INVX1_RVT U59 ( .A(n47), .Y(n49) );
  NAND2X0_RVT U60 ( .A1(n49), .A2(n48), .Y(n50) );
  INVX0_RVT U63 ( .A(n53), .Y(n55) );
  NAND2X0_RVT U64 ( .A1(n55), .A2(n54), .Y(n56) );
  XNOR2X1_RVT U65 ( .A1(n57), .A2(n56), .Y(n58) );
  NAND2X0_RVT U67 ( .A1(n88), .A2(n61), .Y(n63) );
  OAI21X2_RVT U43 ( .A1(n61), .A2(n53), .A3(n54), .Y(n28) );
  XNOR2X1_RVT U16 ( .A1(n13), .A2(n41), .Y(n12) );
  NOR2X2_RVT U11 ( .A1(credit[4]), .A2(coin_value[4]), .Y(n47) );
  INVX0_RVT U3 ( .A(n65), .Y(n85) );
  INVX0_RVT U5 ( .A(n52), .Y(n64) );
  OR3X1_RVT U6 ( .A1(n51), .A2(n65), .A3(n92), .Y(n78) );
  OR3X1_RVT U9 ( .A1(clear), .A2(rst), .A3(cancel), .Y(n19) );
  OR2X1_RVT U14 ( .A1(coin_value[6]), .A2(credit[6]), .Y(n74) );
  INVX0_RVT U15 ( .A(n60), .Y(n88) );
  INVX1_RVT U18 ( .A(n66), .Y(n102) );
  NOR2X2_RVT U20 ( .A1(coin_value[3]), .A2(credit[3]), .Y(n53) );
  INVX0_RVT U23 ( .A(n19), .Y(n76) );
  OR2X1_RVT U27 ( .A1(add_x_1_n9), .A2(n19), .Y(n75) );
  NAND2X4_RVT U28 ( .A1(load), .A2(n76), .Y(n65) );
  INVX0_RVT U32 ( .A(load), .Y(n18) );
  OR2X2_RVT U33 ( .A1(load), .A2(n19), .Y(n66) );
  OR2X1_RVT U46 ( .A1(credit[7]), .A2(n65), .Y(n101) );
  OR3X1_RVT U47 ( .A1(n65), .A2(n90), .A3(n84), .Y(n80) );
  OR2X1_RVT U54 ( .A1(n65), .A2(n89), .Y(n81) );
  NBUFFX2_RVT U57 ( .A(n27), .Y(n103) );
  AND2X1_RVT U61 ( .A1(n78), .A2(n77), .Y(n79) );
  OR2X1_RVT U62 ( .A1(n69), .A2(n66), .Y(n77) );
  NAND3X0_RVT U66 ( .A1(n79), .A2(n80), .A3(n81), .Y(n6) );
  INVX0_RVT U68 ( .A(n48), .Y(n91) );
  AND2X1_RVT U69 ( .A1(n82), .A2(n95), .Y(n96) );
  NOR2X0_RVT U70 ( .A1(n97), .A2(n99), .Y(n82) );
  OR2X1_RVT U71 ( .A1(n42), .A2(n47), .Y(n83) );
  AO21X1_RVT U72 ( .A1(n29), .A2(n52), .A3(n28), .Y(n84) );
  OR2X1_RVT U73 ( .A1(n51), .A2(n33), .Y(n95) );
  AO22X1_RVT U74 ( .A1(n102), .A2(credit[3]), .A3(n85), .A4(n58), .Y(n8) );
  INVX0_RVT U75 ( .A(n61), .Y(n87) );
  AO21X1_RVT U76 ( .A1(n88), .A2(n52), .A3(n87), .Y(n57) );
  OA22X1_RVT U77 ( .A1(n93), .A2(n48), .A3(n49), .A4(n90), .Y(n89) );
  OR2X1_RVT U78 ( .A1(n91), .A2(n45), .Y(n90) );
  OR2X1_RVT U79 ( .A1(n47), .A2(n93), .Y(n92) );
  INVX1_RVT U80 ( .A(n45), .Y(n93) );
  AO21X1_RVT U81 ( .A1(n36), .A2(n74), .A3(n31), .Y(n99) );
  OR3X1_RVT U82 ( .A1(n98), .A2(n96), .A3(n94), .Y(n4) );
  NOR2X0_RVT U83 ( .A1(n101), .A2(n95), .Y(n94) );
  OR2X1_RVT U84 ( .A1(n18), .A2(n75), .Y(n97) );
  AO22X1_RVT U85 ( .A1(credit[7]), .A2(n102), .A3(n100), .A4(n99), .Y(n98) );
  INVX1_RVT U86 ( .A(n101), .Y(n100) );
endmodule


module memory ( clk, rst, mem_read, mem_write, addr, price, stock );
  input [1:0] addr;
  output [7:0] price;
  output [7:0] stock;
  input clk, rst, mem_read, mem_write;
  wire   n30, n31, n32, n33, n34, n39, n40, n42, n43, n44, n48, n49, n50, n51,
         n52, n56, n57, n58, n59, n60, n64, n65, n66, n67, n68, n72, n73, n74,
         n75, n76, n1, n6, n9, n10, n12, n14, n16, n18, n19, n21, n22, n23,
         n24, n27, n28, n29, n37, n45, n53, n54, n61, n62, n69, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n95, n96, n97, n98,
         n99, n100, n106, n107, n108, n109, n110, n111, n112, n114, n115, n116,
         n117, n118, n119, n120, n121, n123, n125, n126, n127, n129, n130,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n171, n172, n173, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198;
  wire   [16:0] mem;

  DFFX1_RVT mem_reg_3__0_ ( .D(n76), .CLK(clk), .QN(n165) );
  DFFX1_RVT mem_reg_3__1_ ( .D(n75), .CLK(clk), .Q(n1), .QN(n177) );
  DFFX1_RVT mem_reg_3__2_ ( .D(n74), .CLK(clk), .Q(mem[0]), .QN(n179) );
  DFFX1_RVT mem_reg_3__3_ ( .D(n73), .CLK(clk), .Q(mem[1]), .QN(n181) );
  DFFX1_RVT mem_reg_3__4_ ( .D(n72), .CLK(clk), .Q(mem[2]), .QN(n168) );
  DFFX1_RVT mem_reg_2__0_ ( .D(n68), .CLK(clk), .Q(mem[3]), .QN(n166) );
  DFFX1_RVT mem_reg_2__1_ ( .D(n67), .CLK(clk), .Q(mem[4]), .QN(n176) );
  DFFX1_RVT mem_reg_2__2_ ( .D(n66), .CLK(clk), .Q(mem[5]), .QN(n178) );
  DFFX1_RVT mem_reg_2__3_ ( .D(n65), .CLK(clk), .Q(mem[6]), .QN(n180) );
  DFFX1_RVT mem_reg_2__4_ ( .D(n64), .CLK(clk), .Q(mem[7]), .QN(n167) );
  DFFX1_RVT mem_reg_0__0_ ( .D(n52), .CLK(clk), .Q(mem[12]), .QN(n171) );
  DFFX1_RVT mem_reg_0__2_ ( .D(n50), .CLK(clk), .Q(mem[14]), .QN(n184) );
  DFFX1_RVT mem_reg_0__1_ ( .D(n51), .CLK(clk), .Q(mem[13]), .QN(n182) );
  DFFX1_RVT mem_reg_0__3_ ( .D(n49), .CLK(clk), .Q(mem[15]), .QN(n186) );
  DFFX1_RVT mem_reg_0__4_ ( .D(n48), .CLK(clk), .Q(mem[16]), .QN(n172) );
  DFFX1_RVT price_reg_6_ ( .D(n44), .CLK(clk), .Q(price[6]) );
  DFFX1_RVT price_reg_5_ ( .D(n43), .CLK(clk), .Q(price[5]) );
  DFFX1_RVT price_reg_4_ ( .D(n42), .CLK(clk), .Q(price[4]) );
  DFFX1_RVT price_reg_3_ ( .D(n196), .CLK(clk), .Q(price[3]) );
  DFFX1_RVT price_reg_2_ ( .D(n40), .CLK(clk), .Q(price[2]) );
  DFFX1_RVT price_reg_1_ ( .D(n39), .CLK(clk), .Q(price[1]) );
  DFFX1_RVT price_reg_0_ ( .D(n197), .CLK(clk), .Q(price[0]) );
  DFFX1_RVT stock_reg_4_ ( .D(n34), .CLK(clk), .Q(stock[4]) );
  DFFX1_RVT stock_reg_3_ ( .D(n33), .CLK(clk), .Q(stock[3]) );
  DFFX1_RVT stock_reg_2_ ( .D(n32), .CLK(clk), .Q(stock[2]) );
  DFFX1_RVT stock_reg_1_ ( .D(n31), .CLK(clk), .Q(stock[1]) );
  DFFX1_RVT stock_reg_0_ ( .D(n30), .CLK(clk), .Q(stock[0]) );
  DFFX1_RVT mem_reg_1__4_ ( .D(n56), .CLK(clk), .Q(mem[11]), .QN(n173) );
  DFFX1_RVT mem_reg_1__3_ ( .D(n57), .CLK(clk), .Q(mem[10]), .QN(n187) );
  DFFX1_RVT mem_reg_1__1_ ( .D(n59), .CLK(clk), .QN(n183) );
  DFFX1_RVT mem_reg_1__2_ ( .D(n58), .CLK(clk), .Q(mem[9]), .QN(n185) );
  DFFX1_RVT mem_reg_1__0_ ( .D(n60), .CLK(clk), .Q(mem[8]), .QN(n169) );
  OR2X1_RVT U3 ( .A1(n136), .A2(n88), .Y(n154) );
  NAND2X0_RVT U4 ( .A1(n142), .A2(n143), .Y(n146) );
  MUX21X1_RVT U7 ( .A1(n151), .A2(mem[2]), .S0(n9), .Y(n72) );
  OR3X1_RVT U8 ( .A1(n109), .A2(n107), .A3(n106), .Y(n117) );
  AO22X1_RVT U11 ( .A1(n112), .A2(n6), .A3(n198), .A4(n146), .Y(n75) );
  AND2X1_RVT U15 ( .A1(n1), .A2(n12), .Y(n6) );
  OR2X1_RVT U21 ( .A1(n168), .A2(n132), .Y(n95) );
  MUX21X1_RVT U22 ( .A1(n148), .A2(mem[1]), .S0(n9), .Y(n73) );
  MUX21X1_RVT U23 ( .A1(n147), .A2(mem[0]), .S0(n9), .Y(n74) );
  AND2X1_RVT U24 ( .A1(n12), .A2(n112), .Y(n9) );
  OR2X2_RVT U25 ( .A1(n54), .A2(n10), .Y(n112) );
  OR2X1_RVT U31 ( .A1(n14), .A2(n112), .Y(n62) );
  INVX1_RVT U32 ( .A(n152), .Y(n14) );
  OAI22X1_RVT U33 ( .A1(n92), .A2(n89), .A3(n91), .A4(n126), .Y(n16) );
  OAI22X1_RVT U34 ( .A1(n92), .A2(n89), .A3(n91), .A4(n126), .Y(n155) );
  NOR2X0_RVT U35 ( .A1(n61), .A2(n16), .Y(n152) );
  OR2X2_RVT U36 ( .A1(addr[1]), .A2(addr[0]), .Y(n100) );
  INVX0_RVT U37 ( .A(mem_write), .Y(n115) );
  NOR2X0_RVT U38 ( .A1(n100), .A2(n172), .Y(n99) );
  AOI21X1_RVT U41 ( .A1(n107), .A2(n193), .A3(n135), .Y(n144) );
  AOI21X1_RVT U42 ( .A1(n156), .A2(n16), .A3(n140), .Y(n142) );
  NOR2X0_RVT U43 ( .A1(n88), .A2(n142), .Y(n149) );
  INVX1_RVT U44 ( .A(rst), .Y(n143) );
  NOR2X0_RVT U45 ( .A1(n195), .A2(n144), .Y(n147) );
  NOR2X0_RVT U51 ( .A1(n126), .A2(n111), .Y(n18) );
  NAND2X0_RVT U52 ( .A1(n152), .A2(n61), .Y(n19) );
  OAI22X1_RVT U53 ( .A1(n176), .A2(n159), .A3(n183), .A4(n158), .Y(n21) );
  OR4X2_RVT U54 ( .A1(n84), .A2(n82), .A3(n85), .A4(n83), .Y(n110) );
  AND2X1_RVT U55 ( .A1(n143), .A2(n22), .Y(n151) );
  AO21X1_RVT U56 ( .A1(n117), .A2(n108), .A3(n138), .Y(n22) );
  OR2X2_RVT U57 ( .A1(n85), .A2(n84), .Y(n107) );
  NAND2X0_RVT U58 ( .A1(addr[0]), .A2(n161), .Y(n23) );
  NAND2X0_RVT U59 ( .A1(addr[0]), .A2(n53), .Y(n158) );
  OR2X2_RVT U60 ( .A1(n88), .A2(n86), .Y(n24) );
  NAND2X0_RVT U64 ( .A1(addr[0]), .A2(addr[1]), .Y(n132) );
  OR2X1_RVT U65 ( .A1(n87), .A2(n89), .Y(n27) );
  OR2X2_RVT U67 ( .A1(n61), .A2(n114), .Y(n28) );
  OR2X2_RVT U70 ( .A1(n83), .A2(n82), .Y(n106) );
  INVX0_RVT U71 ( .A(addr[1]), .Y(n53) );
  OR2X1_RVT U77 ( .A1(n126), .A2(n87), .Y(n37) );
  OAI22X1_RVT U81 ( .A1(n187), .A2(n23), .A3(n180), .A4(n159), .Y(n83) );
  OAI22X1_RVT U82 ( .A1(n158), .A2(n185), .A3(n178), .A4(n159), .Y(n85) );
  OR2X1_RVT U84 ( .A1(n21), .A2(n90), .Y(n156) );
  NAND3X0_RVT U85 ( .A1(n62), .A2(n69), .A3(n19), .Y(n76) );
  OR2X1_RVT U90 ( .A1(n193), .A2(n107), .Y(n116) );
  INVX0_RVT U91 ( .A(n137), .Y(n138) );
  AO22X1_RVT U96 ( .A1(n81), .A2(n80), .A3(n194), .A4(n149), .Y(n59) );
  INVX0_RVT U97 ( .A(n86), .Y(n80) );
  NOR2X0_RVT U98 ( .A1(n88), .A2(n183), .Y(n81) );
  OAI22X1_RVT U99 ( .A1(n181), .A2(n132), .A3(n186), .A4(n100), .Y(n82) );
  OAI22X1_RVT U100 ( .A1(n179), .A2(n132), .A3(n184), .A4(n100), .Y(n84) );
  OR2X1_RVT U101 ( .A1(n189), .A2(n115), .Y(n87) );
  NBUFFX2_RVT U102 ( .A(addr[0]), .Y(n89) );
  OAI22X1_RVT U103 ( .A1(n177), .A2(n132), .A3(n182), .A4(n100), .Y(n90) );
  OA22X1_RVT U104 ( .A1(n53), .A2(n165), .A3(n169), .A4(n163), .Y(n91) );
  OA22X1_RVT U105 ( .A1(n166), .A2(n161), .A3(n171), .A4(n163), .Y(n92) );
  NOR2X0_RVT U107 ( .A1(n141), .A2(n121), .Y(n120) );
  AOI21X1_RVT U108 ( .A1(n116), .A2(n106), .A3(n118), .Y(n119) );
  NOR2X0_RVT U110 ( .A1(n173), .A2(n23), .Y(n98) );
  NBUFFX2_RVT U111 ( .A(addr[1]), .Y(n163) );
  NAND2X0_RVT U113 ( .A1(n95), .A2(n96), .Y(n97) );
  INVX0_RVT U114 ( .A(addr[1]), .Y(n161) );
  INVX0_RVT U115 ( .A(n89), .Y(n126) );
  OR2X1_RVT U118 ( .A1(n53), .A2(n115), .Y(n111) );
  AND2X1_RVT U120 ( .A1(n143), .A2(n123), .Y(n121) );
  INVX0_RVT U121 ( .A(n117), .Y(n118) );
  AO21X1_RVT U122 ( .A1(n121), .A2(mem[15]), .A3(n120), .Y(n49) );
  INVX0_RVT U123 ( .A(mem_read), .Y(n125) );
  AND2X1_RVT U125 ( .A1(n162), .A2(n126), .Y(n130) );
  NOR2X2_RVT U126 ( .A1(mem_read), .A2(rst), .Y(n164) );
  AND2X1_RVT U127 ( .A1(n164), .A2(price[0]), .Y(n127) );
  AND2X1_RVT U129 ( .A1(n164), .A2(price[3]), .Y(n129) );
  NOR2X0_RVT U132 ( .A1(n132), .A2(n133), .Y(n134) );
  AO21X1_RVT U133 ( .A1(price[2]), .A2(n164), .A3(n134), .Y(n40) );
  INVX0_RVT U134 ( .A(n116), .Y(n135) );
  MUX21X1_RVT U135 ( .A1(mem[5]), .A2(n147), .S0(n139), .Y(n66) );
  INVX0_RVT U136 ( .A(n16), .Y(n136) );
  MUX21X1_RVT U137 ( .A1(mem[3]), .A2(n154), .S0(n28), .Y(n68) );
  MUX21X1_RVT U138 ( .A1(mem[7]), .A2(n151), .S0(n29), .Y(n64) );
  MUX21X1_RVT U140 ( .A1(mem[4]), .A2(n146), .S0(n28), .Y(n67) );
  MUX21X1_RVT U142 ( .A1(mem[6]), .A2(n148), .S0(n29), .Y(n65) );
  MUX21X1_RVT U143 ( .A1(mem[8]), .A2(n154), .S0(n24), .Y(n60) );
  NAND2X0_RVT U144 ( .A1(n144), .A2(n143), .Y(n150) );
  MUX21X1_RVT U145 ( .A1(mem[9]), .A2(n150), .S0(n145), .Y(n58) );
  MUX21X1_RVT U146 ( .A1(mem[10]), .A2(n148), .S0(n24), .Y(n57) );
  MUX21X1_RVT U147 ( .A1(mem[11]), .A2(n151), .S0(n194), .Y(n56) );
  MUX21X1_RVT U148 ( .A1(mem[13]), .A2(n149), .S0(n153), .Y(n51) );
  MUX21X1_RVT U149 ( .A1(mem[14]), .A2(n150), .S0(n153), .Y(n50) );
  MUX21X1_RVT U150 ( .A1(mem[16]), .A2(n151), .S0(n153), .Y(n48) );
  MUX21X1_RVT U151 ( .A1(mem[12]), .A2(n154), .S0(n153), .Y(n52) );
  AO22X1_RVT U152 ( .A1(stock[0]), .A2(n164), .A3(n16), .A4(n162), .Y(n30) );
  AO22X1_RVT U153 ( .A1(stock[1]), .A2(n164), .A3(n156), .A4(n162), .Y(n31) );
  AO22X1_RVT U154 ( .A1(stock[2]), .A2(n164), .A3(n107), .A4(n162), .Y(n32) );
  AO22X1_RVT U155 ( .A1(stock[3]), .A2(n164), .A3(n106), .A4(n162), .Y(n33) );
  AO22X1_RVT U156 ( .A1(stock[4]), .A2(n164), .A3(n108), .A4(n162), .Y(n34) );
  NAND2X0_RVT U159 ( .A1(n159), .A2(n23), .Y(n160) );
  AO22X1_RVT U160 ( .A1(n164), .A2(price[1]), .A3(n160), .A4(n162), .Y(n39) );
  AO22X1_RVT U161 ( .A1(n164), .A2(price[4]), .A3(n161), .A4(n162), .Y(n42) );
  AO22X1_RVT U162 ( .A1(n164), .A2(price[5]), .A3(n89), .A4(n162), .Y(n43) );
  AO22X1_RVT U163 ( .A1(n164), .A2(price[6]), .A3(n189), .A4(n162), .Y(n44) );
  OR3X1_RVT U5 ( .A1(n99), .A2(n98), .A3(n97), .Y(n108) );
  INVX0_RVT U6 ( .A(n162), .Y(n133) );
  INVX0_RVT U9 ( .A(n61), .Y(n12) );
  INVX0_RVT U10 ( .A(n193), .Y(n140) );
  NAND2X2_RVT U12 ( .A1(n143), .A2(n123), .Y(n153) );
  INVX0_RVT U13 ( .A(n141), .Y(n148) );
  INVX0_RVT U14 ( .A(addr[1]), .Y(n190) );
  INVX0_RVT U16 ( .A(n18), .Y(n54) );
  NAND2X0_RVT U17 ( .A1(addr[1]), .A2(n191), .Y(n188) );
  NOR4X1_RVT U18 ( .A1(n108), .A2(1'b0), .A3(n109), .A4(n110), .Y(n10) );
  NOR4X1_RVT U19 ( .A1(n108), .A2(1'b0), .A3(n110), .A4(n109), .Y(n45) );
  OR2X2_RVT U20 ( .A1(n88), .A2(n114), .Y(n29) );
  NOR3X0_RVT U26 ( .A1(n89), .A2(n111), .A3(n10), .Y(n114) );
  OR2X2_RVT U27 ( .A1(n27), .A2(n45), .Y(n123) );
  NBUFFX2_RVT U28 ( .A(n163), .Y(n189) );
  OR2X2_RVT U29 ( .A1(n190), .A2(addr[0]), .Y(n159) );
  OR2X1_RVT U30 ( .A1(addr[0]), .A2(n188), .Y(n96) );
  INVX0_RVT U39 ( .A(n167), .Y(n191) );
  NOR2X2_RVT U40 ( .A1(n125), .A2(n61), .Y(n162) );
  INVX1_RVT U46 ( .A(n143), .Y(n61) );
  NAND2X0_RVT U47 ( .A1(n112), .A2(n192), .Y(n69) );
  NOR2X0_RVT U48 ( .A1(n195), .A2(n165), .Y(n192) );
  OR2X1_RVT U49 ( .A1(n61), .A2(n114), .Y(n139) );
  OR2X2_RVT U50 ( .A1(n88), .A2(n119), .Y(n141) );
  OR2X1_RVT U61 ( .A1(n88), .A2(n86), .Y(n145) );
  OR4X1_RVT U62 ( .A1(n193), .A2(n108), .A3(n106), .A4(n107), .Y(n137) );
  OR3X2_RVT U63 ( .A1(n155), .A2(n21), .A3(n90), .Y(n193) );
  OR2X2_RVT U66 ( .A1(n88), .A2(n86), .Y(n194) );
  OR3X1_RVT U68 ( .A1(n90), .A2(n21), .A3(n155), .Y(n109) );
  NOR2X2_RVT U69 ( .A1(n37), .A2(n45), .Y(n86) );
  IBUFFX4_RVT U72 ( .A(n143), .Y(n88) );
  NBUFFX2_RVT U73 ( .A(rst), .Y(n195) );
  OR2X1_RVT U75 ( .A1(n130), .A2(n129), .Y(n196) );
  OR2X1_RVT U76 ( .A1(n130), .A2(n127), .Y(n197) );
  NAND2X0_RVT U78 ( .A1(n112), .A2(n12), .Y(n198) );
endmodule


module comparator ( credit, price, stock, can_sell );
  input [7:0] credit;
  input [7:0] price;
  input [7:0] stock;
  output can_sell;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n17, n19;

  INVX0_RVT U2 ( .A(credit[0]), .Y(n1) );
  INVX0_RVT U3 ( .A(price[1]), .Y(n3) );
  NAND2X0_RVT U4 ( .A1(price[0]), .A2(n1), .Y(n2) );
  AO222X1_RVT U5 ( .A1(credit[1]), .A2(n3), .A3(credit[1]), .A4(n2), .A5(n3), 
        .A6(n2), .Y(n5) );
  INVX0_RVT U6 ( .A(price[2]), .Y(n4) );
  AO222X1_RVT U7 ( .A1(credit[2]), .A2(n5), .A3(credit[2]), .A4(n4), .A5(n5), 
        .A6(n4), .Y(n7) );
  INVX0_RVT U8 ( .A(price[3]), .Y(n6) );
  AO222X1_RVT U9 ( .A1(credit[3]), .A2(n7), .A3(credit[3]), .A4(n6), .A5(n7), 
        .A6(n6), .Y(n9) );
  INVX0_RVT U10 ( .A(price[4]), .Y(n8) );
  AO222X1_RVT U11 ( .A1(credit[4]), .A2(n9), .A3(credit[4]), .A4(n8), .A5(n9), 
        .A6(n8), .Y(n11) );
  INVX0_RVT U12 ( .A(price[5]), .Y(n10) );
  AO222X1_RVT U13 ( .A1(credit[5]), .A2(n11), .A3(credit[5]), .A4(n10), .A5(
        n11), .A6(n10), .Y(n13) );
  INVX0_RVT U14 ( .A(price[6]), .Y(n12) );
  AO222X1_RVT U15 ( .A1(credit[6]), .A2(n13), .A3(credit[6]), .A4(n12), .A5(
        n13), .A6(n12), .Y(n19) );
  OR4X1_RVT U20 ( .A1(stock[3]), .A2(stock[2]), .A3(stock[1]), .A4(stock[0]), 
        .Y(n17) );
  OA22X1_RVT U21 ( .A1(credit[7]), .A2(n19), .A3(stock[4]), .A4(n17), .Y(
        can_sell) );
endmodule


module subtractor ( credit, price, change );
  input [7:0] credit;
  input [7:0] price;
  output [7:0] change;
  wire   intadd_9_B_5_, intadd_9_B_4_, intadd_9_B_3_, intadd_9_B_2_,
         intadd_9_B_1_, intadd_9_B_0_, intadd_9_CI, intadd_9_SUM_5_,
         intadd_9_SUM_4_, intadd_9_SUM_3_, intadd_9_SUM_2_, intadd_9_SUM_1_,
         intadd_9_SUM_0_, intadd_9_n6, intadd_9_n5, intadd_9_n4, intadd_9_n3,
         intadd_9_n2, intadd_9_n1, n1;

  FADDX1_RVT intadd_9_U7 ( .A(intadd_9_B_0_), .B(price[1]), .CI(intadd_9_CI), 
        .CO(intadd_9_n6), .S(intadd_9_SUM_0_) );
  FADDX1_RVT intadd_9_U6 ( .A(intadd_9_B_1_), .B(price[2]), .CI(intadd_9_n6), 
        .CO(intadd_9_n5), .S(intadd_9_SUM_1_) );
  FADDX1_RVT intadd_9_U5 ( .A(intadd_9_B_2_), .B(price[3]), .CI(intadd_9_n5), 
        .CO(intadd_9_n4), .S(intadd_9_SUM_2_) );
  FADDX1_RVT intadd_9_U4 ( .A(intadd_9_B_3_), .B(price[4]), .CI(intadd_9_n4), 
        .CO(intadd_9_n3), .S(intadd_9_SUM_3_) );
  FADDX1_RVT intadd_9_U3 ( .A(intadd_9_B_4_), .B(price[5]), .CI(intadd_9_n3), 
        .CO(intadd_9_n2), .S(intadd_9_SUM_4_) );
  FADDX1_RVT intadd_9_U2 ( .A(intadd_9_B_5_), .B(price[6]), .CI(intadd_9_n2), 
        .CO(intadd_9_n1), .S(intadd_9_SUM_5_) );
  INVX0_RVT U1 ( .A(credit[4]), .Y(intadd_9_B_3_) );
  INVX0_RVT U2 ( .A(credit[1]), .Y(intadd_9_B_0_) );
  INVX0_RVT U3 ( .A(credit[5]), .Y(intadd_9_B_4_) );
  INVX0_RVT U4 ( .A(credit[2]), .Y(intadd_9_B_1_) );
  INVX0_RVT U5 ( .A(credit[6]), .Y(intadd_9_B_5_) );
  INVX0_RVT U6 ( .A(intadd_9_SUM_2_), .Y(change[3]) );
  INVX0_RVT U7 ( .A(intadd_9_SUM_4_), .Y(change[5]) );
  INVX0_RVT U8 ( .A(intadd_9_SUM_3_), .Y(change[4]) );
  INVX0_RVT U9 ( .A(intadd_9_SUM_5_), .Y(change[6]) );
  INVX0_RVT U10 ( .A(intadd_9_SUM_1_), .Y(change[2]) );
  INVX0_RVT U11 ( .A(intadd_9_SUM_0_), .Y(change[1]) );
  INVX0_RVT U12 ( .A(price[0]), .Y(n1) );
  NOR2X0_RVT U13 ( .A1(n1), .A2(credit[0]), .Y(intadd_9_CI) );
  INVX0_RVT U14 ( .A(credit[3]), .Y(intadd_9_B_2_) );
  XOR2X1_RVT U15 ( .A1(intadd_9_n1), .A2(credit[7]), .Y(change[7]) );
  AO21X1_RVT U16 ( .A1(credit[0]), .A2(n1), .A3(intadd_9_CI), .Y(change[0]) );
endmodule


module control_unit ( clk, rst, cancel, coin_in, confirm, can_sell, state, 
        credit_load, credit_clear, mem_read, mem_write, dispense, error, 
        change_load );
  input [1:0] coin_in;
  output [2:0] state;
  input clk, rst, cancel, confirm, can_sell;
  output credit_load, credit_clear, mem_read, mem_write, dispense, error,
         change_load;
  wire   check_wait, N20, N21, N22, n16, n1, n2, n3, n4, n5, n6, n7, n10, n11,
         n12, n13, n14, n17, n20, n22, n23, n24, n27, n28, n30, n31, n32, n33,
         n34, n35, n36, n37;

  DFFX1_RVT current_state_reg_0_ ( .D(N20), .CLK(clk), .Q(state[0]), .QN(n27)
         );
  DFFX1_RVT check_wait_reg ( .D(n16), .CLK(clk), .Q(check_wait), .QN(n28) );
  DFFX1_RVT current_state_reg_1_ ( .D(N21), .CLK(clk), .Q(state[1]), .QN(n33)
         );
  DFFX1_RVT current_state_reg_2_ ( .D(N22), .CLK(clk), .Q(state[2]), .QN(n36)
         );
  INVX0_RVT U3 ( .A(change_load), .Y(n24) );
  NOR2X0_RVT U6 ( .A1(n11), .A2(n27), .Y(dispense) );
  INVX0_RVT U7 ( .A(dispense), .Y(n5) );
  OR2X1_RVT U8 ( .A1(n33), .A2(state[2]), .Y(n11) );
  NBUFFX2_RVT U9 ( .A(dispense), .Y(mem_write) );
  NOR3X0_RVT U10 ( .A1(state[0]), .A2(check_wait), .A3(n11), .Y(mem_read) );
  AND2X1_RVT U11 ( .A1(state[2]), .A2(n33), .Y(change_load) );
  NOR2X0_RVT U12 ( .A1(n24), .A2(n27), .Y(error) );
  INVX0_RVT U13 ( .A(mem_read), .Y(n3) );
  OR2X1_RVT U14 ( .A1(dispense), .A2(change_load), .Y(n1) );
  NAND2X0_RVT U15 ( .A1(check_wait), .A2(n1), .Y(n2) );
  OR2X2_RVT U16 ( .A1(rst), .A2(cancel), .Y(n22) );
  AOI21X1_RVT U17 ( .A1(n3), .A2(n2), .A3(n22), .Y(n16) );
  INVX0_RVT U18 ( .A(error), .Y(n4) );
  AND2X1_RVT U19 ( .A1(n5), .A2(n4), .Y(n7) );
  OR3X1_RVT U20 ( .A1(n11), .A2(n28), .A3(can_sell), .Y(n6) );
  AOI21X1_RVT U21 ( .A1(n7), .A2(n6), .A3(n22), .Y(N22) );
  OR2X1_RVT U23 ( .A1(n28), .A2(state[0]), .Y(n10) );
  OR2X1_RVT U25 ( .A1(n27), .A2(state[1]), .Y(n14) );
  NOR2X0_RVT U27 ( .A1(n31), .A2(state[2]), .Y(n12) );
  OR2X1_RVT U28 ( .A1(n12), .A2(n22), .Y(n13) );
  NAND2X0_RVT U30 ( .A1(can_sell), .A2(n27), .Y(n17) );
  NOR2X0_RVT U35 ( .A1(state[1]), .A2(n23), .Y(credit_load) );
  NOR2X0_RVT U36 ( .A1(state[0]), .A2(n24), .Y(credit_clear) );
  AND2X1_RVT U4 ( .A1(confirm), .A2(state[0]), .Y(n32) );
  NOR2X1_RVT U5 ( .A1(n22), .A2(n30), .Y(N21) );
  NOR2X0_RVT U22 ( .A1(mem_read), .A2(n20), .Y(n30) );
  OAI21X2_RVT U24 ( .A1(coin_in[1]), .A2(coin_in[0]), .A3(n36), .Y(n23) );
  NAND2X0_RVT U26 ( .A1(confirm), .A2(state[0]), .Y(n31) );
  OA21X1_RVT U29 ( .A1(state[1]), .A2(n32), .A3(n35), .Y(n20) );
  AOI21X1_RVT U31 ( .A1(n34), .A2(n14), .A3(n13), .Y(N20) );
  AO22X1_RVT U32 ( .A1(state[1]), .A2(n10), .A3(n23), .A4(n11), .Y(n34) );
  OA21X1_RVT U33 ( .A1(n37), .A2(n33), .A3(n36), .Y(n35) );
  INVX0_RVT U34 ( .A(n17), .Y(n37) );
endmodule


module vending_top ( clk, rst, coin_in, sel_item, confirm, cancel, dispense, 
        change_out, error, display, state_out );
  input [1:0] coin_in;
  input [1:0] sel_item;
  output [7:0] change_out;
  output [7:0] display;
  output [2:0] state_out;
  input clk, rst, confirm, cancel;
  output dispense, error;
  wire   credit_clear, credit_load, mem_read, mem_write, can_sell, change_load,
         n10, n11, n12, n13, n14, n15, n16, n17, n20, n21, n22, n25, n26, n27,
         n29, n30, n31, n32, n33, n36, n37, n38, n39, n40, n41, n42, n44, n45,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10;
  wire   [6:3] coin_value;
  wire   [6:0] price;
  wire   [4:0] stock;
  wire   [7:0] change;

  DFFX1_RVT change_out_reg_7_ ( .D(n17), .CLK(clk), .Q(change_out[7]), .QN(n50) );
  DFFX1_RVT change_out_reg_6_ ( .D(n16), .CLK(clk), .Q(change_out[6]) );
  DFFX1_RVT change_out_reg_5_ ( .D(n15), .CLK(clk), .Q(change_out[5]) );
  DFFX1_RVT change_out_reg_4_ ( .D(n14), .CLK(clk), .Q(change_out[4]) );
  DFFX1_RVT change_out_reg_3_ ( .D(n13), .CLK(clk), .Q(change_out[3]) );
  DFFX1_RVT change_out_reg_2_ ( .D(n12), .CLK(clk), .Q(change_out[2]) );
  DFFX1_RVT change_out_reg_1_ ( .D(n11), .CLK(clk), .Q(change_out[1]) );
  DFFX1_RVT change_out_reg_0_ ( .D(n10), .CLK(clk), .Q(change_out[0]), .QN(n42) );
  INVX0_RVT U27 ( .A(n53), .Y(n30) );
  INVX0_RVT U28 ( .A(state_out[2]), .Y(n21) );
  INVX0_RVT U29 ( .A(display[0]), .Y(n31) );
  INVX0_RVT U31 ( .A(change[0]), .Y(n25) );
  INVX0_RVT U32 ( .A(state_out[0]), .Y(n20) );
  OR2X1_RVT U33 ( .A1(n20), .A2(state_out[1]), .Y(n22) );
  NOR2X0_RVT U34 ( .A1(n22), .A2(n21), .Y(n26) );
  OAI22X1_RVT U38 ( .A1(n42), .A2(n38), .A3(n25), .A4(n37), .Y(n33) );
  INVX0_RVT U40 ( .A(n26), .Y(n27) );
  OR2X1_RVT U41 ( .A1(n55), .A2(n27), .Y(n29) );
  AO21X1_RVT U42 ( .A1(n29), .A2(n30), .A3(rst), .Y(n36) );
  OR2X1_RVT U44 ( .A1(n33), .A2(n32), .Y(n10) );
  AO222X1_RVT U54 ( .A1(n41), .A2(display[1]), .A3(n40), .A4(change[1]), .A5(
        change_out[1]), .A6(n39), .Y(n11) );
  AO222X1_RVT U55 ( .A1(n41), .A2(display[2]), .A3(n40), .A4(change[2]), .A5(
        change_out[2]), .A6(n39), .Y(n12) );
  AO222X1_RVT U56 ( .A1(n47), .A2(display[3]), .A3(n40), .A4(change[3]), .A5(
        change_out[3]), .A6(n39), .Y(n13) );
  AO222X1_RVT U57 ( .A1(n41), .A2(display[4]), .A3(n40), .A4(change[4]), .A5(
        change_out[4]), .A6(n39), .Y(n14) );
  AO222X1_RVT U58 ( .A1(n47), .A2(display[5]), .A3(n40), .A4(change[5]), .A5(
        change_out[5]), .A6(n39), .Y(n15) );
  AO222X1_RVT U59 ( .A1(n47), .A2(display[6]), .A3(n40), .A4(change[6]), .A5(
        change_out[6]), .A6(n39), .Y(n16) );
  credit_reg u_credit_reg ( .clk(clk), .rst(rst), .cancel(cancel), .clear(
        credit_clear), .load(credit_load), .coin_value({SYNOPSYS_UNCONNECTED_1, 
        coin_value[6], coin_in[1], n44, coin_value[3], coin_value[6], n45, 
        coin_value[3]}), .credit(display) );
  memory u_memory ( .clk(clk), .rst(rst), .mem_read(mem_read), .mem_write(
        mem_write), .addr(sel_item), .price({SYNOPSYS_UNCONNECTED_2, price}), 
        .stock({SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, stock}) );
  comparator u_comparator ( .credit(display), .price({SYNOPSYS_UNCONNECTED_6, 
        price}), .stock({SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, 
        SYNOPSYS_UNCONNECTED_9, stock}), .can_sell(can_sell) );
  subtractor u_subtractor ( .credit(display), .price({SYNOPSYS_UNCONNECTED_10, 
        price}), .change(change) );
  control_unit u_control_unit ( .clk(clk), .rst(rst), .cancel(n53), .coin_in(
        coin_in), .confirm(confirm), .can_sell(can_sell), .state(state_out), 
        .credit_load(credit_load), .credit_clear(credit_clear), .mem_read(
        mem_read), .mem_write(mem_write), .dispense(dispense), .error(error), 
        .change_load(change_load) );
  OR2X1_RVT U50 ( .A1(coin_value[3]), .A2(n45), .Y(n44) );
  OR3X1_RVT U25 ( .A1(rst), .A2(change_load), .A3(n53), .Y(n38) );
  NOR2X4_RVT U26 ( .A1(n36), .A2(n31), .Y(n32) );
  INVX0_RVT U30 ( .A(n36), .Y(n47) );
  OAI222X1_RVT U35 ( .A1(n36), .A2(n48), .A3(n37), .A4(n49), .A5(n50), .A6(n38), .Y(n17) );
  INVX0_RVT U36 ( .A(display[7]), .Y(n48) );
  INVX0_RVT U37 ( .A(change[7]), .Y(n49) );
  INVX0_RVT U39 ( .A(n36), .Y(n41) );
  INVX1_RVT U43 ( .A(n37), .Y(n40) );
  INVX1_RVT U45 ( .A(n38), .Y(n39) );
  INVX0_RVT U46 ( .A(coin_in[0]), .Y(n51) );
  OR3X1_RVT U47 ( .A1(n52), .A2(rst), .A3(n53), .Y(n37) );
  INVX0_RVT U48 ( .A(coin_in[1]), .Y(n54) );
  AND2X1_RVT U49 ( .A1(coin_in[1]), .A2(coin_in[0]), .Y(coin_value[6]) );
  AND2X1_RVT U51 ( .A1(coin_in[1]), .A2(n51), .Y(n45) );
  OR2X1_RVT U52 ( .A1(n26), .A2(n55), .Y(n52) );
  NBUFFX2_RVT U53 ( .A(cancel), .Y(n53) );
  AND2X1_RVT U60 ( .A1(coin_in[0]), .A2(n54), .Y(coin_value[3]) );
  INVX0_RVT U61 ( .A(change_load), .Y(n55) );
endmodule

