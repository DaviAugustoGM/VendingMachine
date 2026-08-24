/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri Aug 21 14:49:40 2026
/////////////////////////////////////////////////////////////


module credit_reg ( clk, rst, cancel, clear, load, coin_value, credit );
  input [7:0] coin_value;
  output [7:0] credit;
  input clk, rst, cancel, clear, load;
  wire   n4, n5, n6, n7, n8, n9, n10, n2, n3, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n65, n66, n67, n68, n69, n70, n71, n72, n73;

  DFFX1_RVT credit_reg_7_ ( .D(n4), .CLK(clk), .Q(credit[7]), .QN(n73) );
  DFFX1_RVT credit_reg_6_ ( .D(n5), .CLK(clk), .Q(credit[6]), .QN(n67) );
  DFFX1_RVT credit_reg_5_ ( .D(n6), .CLK(clk), .Q(credit[5]), .QN(n68) );
  DFFX1_RVT credit_reg_4_ ( .D(n7), .CLK(clk), .Q(credit[4]), .QN(n69) );
  DFFX1_RVT credit_reg_3_ ( .D(n8), .CLK(clk), .Q(credit[3]), .QN(n70) );
  DFFARX1_RVT credit_reg_2_ ( .D(n9), .CLK(clk), .RSTB(1'b1), .Q(credit[2]), 
        .QN(n71) );
  DFFARX1_RVT credit_reg_1_ ( .D(n10), .CLK(clk), .RSTB(1'b1), .Q(credit[1]), 
        .QN(n72) );
  DFFARX1_RVT credit_reg_0_ ( .D(n65), .CLK(clk), .RSTB(1'b1), .Q(credit[0]), 
        .QN(n66) );
  XOR2X1_RVT U4 ( .A1(n22), .A2(n20), .Y(n13) );
  XNOR2X1_RVT U6 ( .A1(n53), .A2(n52), .Y(n2) );
  NBUFFX2_RVT U7 ( .A(n57), .Y(n3) );
  OR3X1_RVT U8 ( .A1(clear), .A2(rst), .A3(cancel), .Y(n30) );
  INVX0_RVT U9 ( .A(load), .Y(n29) );
  INVX0_RVT U11 ( .A(n73), .Y(n25) );
  INVX0_RVT U12 ( .A(n61), .Y(n26) );
  INVX0_RVT U13 ( .A(n60), .Y(n23) );
  OR2X1_RVT U14 ( .A1(credit[4]), .A2(coin_value[4]), .Y(n11) );
  XNOR2X2_RVT U15 ( .A1(n39), .A2(n38), .Y(n12) );
  XOR2X2_RVT U16 ( .A1(n48), .A2(n47), .Y(n14) );
  OR2X1_RVT U17 ( .A1(credit[5]), .A2(coin_value[5]), .Y(n15) );
  AO21X1_RVT U18 ( .A1(n16), .A2(n17), .A3(n18), .Y(n22) );
  AND2X1_RVT U19 ( .A1(n11), .A2(n15), .Y(n16) );
  AO21X1_RVT U20 ( .A1(n33), .A2(n43), .A3(n32), .Y(n17) );
  AO21X1_RVT U21 ( .A1(n36), .A2(n15), .A3(n34), .Y(n18) );
  NOR2X0_RVT U22 ( .A1(n44), .A2(n49), .Y(n33) );
  NOR2X0_RVT U23 ( .A1(credit[0]), .A2(coin_value[0]), .Y(n27) );
  AO21X1_RVT U24 ( .A1(n33), .A2(n43), .A3(n32), .Y(n19) );
  NOR2X0_RVT U25 ( .A1(credit[1]), .A2(coin_value[1]), .Y(n54) );
  AO22X1_RVT U26 ( .A1(coin_value[6]), .A2(credit[6]), .A3(n22), .A4(n21), .Y(
        n35) );
  OR2X1_RVT U27 ( .A1(credit[6]), .A2(coin_value[6]), .Y(n21) );
  XNOR2X1_RVT U28 ( .A1(n35), .A2(n73), .Y(n24) );
  AO22X1_RVT U29 ( .A1(n26), .A2(n25), .A3(n24), .A4(n23), .Y(n4) );
  OAI22X1_RVT U30 ( .A1(n61), .A2(n71), .A3(n60), .A4(n2), .Y(n9) );
  INVX0_RVT U34 ( .A(n27), .Y(n28) );
  NAND2X0_RVT U35 ( .A1(coin_value[0]), .A2(credit[0]), .Y(n57) );
  NAND2X0_RVT U36 ( .A1(n28), .A2(n3), .Y(n31) );
  OR2X1_RVT U37 ( .A1(n29), .A2(n30), .Y(n60) );
  OR2X1_RVT U38 ( .A1(load), .A2(n30), .Y(n61) );
  OAI22X1_RVT U39 ( .A1(n31), .A2(n60), .A3(n66), .A4(n61), .Y(n65) );
  NAND2X0_RVT U40 ( .A1(credit[1]), .A2(coin_value[1]), .Y(n55) );
  OAI21X2_RVT U41 ( .A1(n57), .A2(n54), .A3(n55), .Y(n43) );
  NOR2X0_RVT U42 ( .A1(credit[3]), .A2(coin_value[3]), .Y(n44) );
  NOR2X0_RVT U43 ( .A1(credit[2]), .A2(coin_value[2]), .Y(n49) );
  NAND2X0_RVT U44 ( .A1(coin_value[2]), .A2(credit[2]), .Y(n50) );
  NAND2X0_RVT U45 ( .A1(credit[3]), .A2(coin_value[3]), .Y(n45) );
  NAND2X0_RVT U46 ( .A1(coin_value[4]), .A2(credit[4]), .Y(n40) );
  INVX0_RVT U47 ( .A(n40), .Y(n36) );
  NAND2X0_RVT U48 ( .A1(coin_value[5]), .A2(credit[5]), .Y(n37) );
  INVX0_RVT U49 ( .A(n37), .Y(n34) );
  OAI22X1_RVT U50 ( .A1(n61), .A2(n67), .A3(n60), .A4(n13), .Y(n5) );
  AOI21X1_RVT U51 ( .A1(n19), .A2(n11), .A3(n36), .Y(n39) );
  NAND2X0_RVT U52 ( .A1(n15), .A2(n37), .Y(n38) );
  OAI22X1_RVT U53 ( .A1(n61), .A2(n68), .A3(n60), .A4(n12), .Y(n6) );
  NAND2X0_RVT U54 ( .A1(n11), .A2(n40), .Y(n41) );
  XOR2X1_RVT U55 ( .A1(n19), .A2(n41), .Y(n42) );
  OAI22X1_RVT U56 ( .A1(n61), .A2(n69), .A3(n60), .A4(n42), .Y(n7) );
  OAI21X2_RVT U57 ( .A1(n49), .A2(n53), .A3(n50), .Y(n48) );
  INVX0_RVT U58 ( .A(n44), .Y(n46) );
  NAND2X0_RVT U59 ( .A1(n46), .A2(n45), .Y(n47) );
  OAI22X1_RVT U60 ( .A1(n61), .A2(n70), .A3(n60), .A4(n14), .Y(n8) );
  INVX0_RVT U61 ( .A(n49), .Y(n51) );
  NAND2X0_RVT U62 ( .A1(n51), .A2(n50), .Y(n52) );
  NAND2X0_RVT U64 ( .A1(n56), .A2(n55), .Y(n58) );
  XNOR2X1_RVT U65 ( .A1(n58), .A2(n3), .Y(n59) );
  OAI22X1_RVT U66 ( .A1(n61), .A2(n72), .A3(n60), .A4(n59), .Y(n10) );
  XNOR2X1_RVT U3 ( .A1(coin_value[6]), .A2(credit[6]), .Y(n20) );
  INVX0_RVT U5 ( .A(n43), .Y(n53) );
  OAI21X2_RVT U10 ( .A1(n50), .A2(n44), .A3(n45), .Y(n32) );
  IBUFFX2_RVT U63 ( .A(n54), .Y(n56) );
endmodule


module memory ( clk, rst, mem_read, mem_write, addr, price, stock );
  input [1:0] addr;
  output [7:0] price;
  output [7:0] stock;
  input clk, rst, mem_read, mem_write;
  wire   n30, n31, n32, n33, n34, n38, n39, n40, n41, n42, n43, n44, n48, n49,
         n50, n51, n52, n56, n57, n58, n59, n60, n64, n65, n66, n67, n68, n72,
         n73, n74, n75, n76, n1, n2, n4, n5, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n35, n36, n37, n45, n46, n47, n53, n54, n55, n61, n62, n63,
         n69, n70, n71, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160;
  wire   [16:0] mem;

  DFFX1_RVT mem_reg_3__0_ ( .D(n76), .CLK(clk), .Q(mem[0]), .QN(n154) );
  DFFX1_RVT mem_reg_3__1_ ( .D(n75), .CLK(clk), .Q(mem[1]) );
  DFFX1_RVT mem_reg_3__2_ ( .D(n74), .CLK(clk), .Q(mem[2]), .QN(n156) );
  DFFX1_RVT mem_reg_3__3_ ( .D(n73), .CLK(clk), .Q(mem[3]), .QN(n159) );
  DFFX1_RVT mem_reg_3__4_ ( .D(n72), .CLK(clk), .Q(mem[4]), .QN(n160) );
  DFFX1_RVT mem_reg_2__0_ ( .D(n68), .CLK(clk), .Q(mem[5]) );
  DFFX1_RVT mem_reg_1__2_ ( .D(n58), .CLK(clk), .Q(mem[12]), .QN(n149) );
  DFFX1_RVT mem_reg_1__1_ ( .D(n59), .CLK(clk), .Q(mem[11]), .QN(n148) );
  DFFX1_RVT mem_reg_1__3_ ( .D(n57), .CLK(clk), .Q(mem[13]), .QN(n150) );
  DFFX1_RVT mem_reg_1__4_ ( .D(n56), .CLK(clk), .Q(mem[14]), .QN(n151) );
  DFFX1_RVT mem_reg_0__0_ ( .D(n52), .CLK(clk), .Q(mem[15]), .QN(n152) );
  DFFX1_RVT mem_reg_0__2_ ( .D(n50), .CLK(clk), .Q(mem[16]), .QN(n155) );
  DFFX1_RVT price_reg_6_ ( .D(n44), .CLK(clk), .Q(price[6]) );
  DFFX1_RVT price_reg_5_ ( .D(n43), .CLK(clk), .Q(price[5]) );
  DFFX1_RVT price_reg_4_ ( .D(n42), .CLK(clk), .Q(price[4]) );
  DFFX1_RVT price_reg_2_ ( .D(n40), .CLK(clk), .Q(price[2]) );
  DFFX1_RVT price_reg_1_ ( .D(n39), .CLK(clk), .Q(price[1]) );
  DFFX1_RVT price_reg_0_ ( .D(n38), .CLK(clk), .Q(price[0]) );
  DFFX1_RVT stock_reg_4_ ( .D(n34), .CLK(clk), .Q(stock[4]) );
  DFFX1_RVT stock_reg_3_ ( .D(n33), .CLK(clk), .Q(stock[3]) );
  DFFX1_RVT stock_reg_2_ ( .D(n32), .CLK(clk), .Q(stock[2]) );
  DFFX1_RVT stock_reg_1_ ( .D(n31), .CLK(clk), .Q(stock[1]) );
  DFFX1_RVT stock_reg_0_ ( .D(n30), .CLK(clk), .Q(stock[0]) );
  DFFX1_RVT mem_reg_2__2_ ( .D(n66), .CLK(clk), .Q(mem[7]) );
  DFFX1_RVT mem_reg_0__4_ ( .D(n48), .CLK(clk), .QN(n158) );
  DFFX1_RVT mem_reg_0__3_ ( .D(n49), .CLK(clk), .QN(n157) );
  DFFX1_RVT mem_reg_0__1_ ( .D(n51), .CLK(clk), .QN(n153) );
  DFFSSRX1_RVT price_reg_3_ ( .D(1'b0), .SETB(n41), .RSTB(1'b1), .CLK(clk), 
        .QN(price[3]) );
  DFFX1_RVT mem_reg_1__0_ ( .D(n60), .CLK(clk), .Q(mem[10]) );
  DFFX1_RVT mem_reg_2__3_ ( .D(n65), .CLK(clk), .Q(mem[8]), .QN(n10) );
  DFFX1_RVT mem_reg_2__4_ ( .D(n64), .CLK(clk), .Q(mem[9]) );
  DFFX1_RVT mem_reg_2__1_ ( .D(n67), .CLK(clk), .Q(mem[6]) );
  NOR2X4_RVT U3 ( .A1(n87), .A2(n29), .Y(n28) );
  OAI22X1_RVT U4 ( .A1(n148), .A2(n82), .A3(n153), .A4(n87), .Y(n85) );
  OR2X2_RVT U6 ( .A1(n5), .A2(n23), .Y(n124) );
  NOR4X1_RVT U7 ( .A1(n53), .A2(rst), .A3(n61), .A4(n55), .Y(n23) );
  INVX0_RVT U8 ( .A(n154), .Y(n1) );
  AND2X1_RVT U9 ( .A1(n1), .A2(n105), .Y(n92) );
  NBUFFX2_RVT U11 ( .A(n139), .Y(n2) );
  AO21X1_RVT U12 ( .A1(n109), .A2(n26), .A3(n100), .Y(n49) );
  OR2X2_RVT U13 ( .A1(n12), .A2(n23), .Y(n132) );
  OA22X1_RVT U14 ( .A1(n150), .A2(n139), .A3(n157), .A4(n87), .Y(n70) );
  AND2X1_RVT U15 ( .A1(n144), .A2(n97), .Y(n120) );
  INVX1_RVT U16 ( .A(n105), .Y(n86) );
  NOR2X0_RVT U17 ( .A1(n152), .A2(n87), .Y(n88) );
  OR3X1_RVT U18 ( .A1(n91), .A2(n92), .A3(n90), .Y(n94) );
  INVX0_RVT U20 ( .A(n124), .Y(n7) );
  INVX0_RVT U21 ( .A(n124), .Y(n130) );
  OR2X2_RVT U22 ( .A1(addr[1]), .A2(addr[0]), .Y(n87) );
  AND2X1_RVT U24 ( .A1(n35), .A2(n24), .Y(n131) );
  AO21X1_RVT U25 ( .A1(n102), .A2(n142), .A3(n101), .Y(n24) );
  AND2X1_RVT U26 ( .A1(n2), .A2(n35), .Y(n113) );
  MUX21X1_RVT U27 ( .A1(n9), .A2(mem[10]), .S0(n132), .Y(n60) );
  NOR3X0_RVT U28 ( .A1(n25), .A2(n108), .A3(n23), .Y(n4) );
  OR2X1_RVT U29 ( .A1(n106), .A2(n25), .Y(n5) );
  NOR2X0_RVT U30 ( .A1(mem_write), .A2(rst), .Y(n25) );
  INVX0_RVT U31 ( .A(n80), .Y(n19) );
  INVX0_RVT U32 ( .A(mem_write), .Y(n29) );
  INVX0_RVT U33 ( .A(rst), .Y(n35) );
  INVX0_RVT U34 ( .A(n102), .Y(n27) );
  OR3X1_RVT U35 ( .A1(n85), .A2(n84), .A3(n83), .Y(n96) );
  INVX0_RVT U36 ( .A(n143), .Y(n136) );
  INVX0_RVT U37 ( .A(n63), .Y(n45) );
  NOR2X0_RVT U38 ( .A1(rst), .A2(mem_read), .Y(n145) );
  INVX0_RVT U39 ( .A(n81), .Y(n18) );
  OR2X1_RVT U40 ( .A1(n120), .A2(n119), .Y(n122) );
  INVX1_RVT U41 ( .A(n95), .Y(n133) );
  INVX0_RVT U42 ( .A(n77), .Y(n16) );
  INVX0_RVT U44 ( .A(n132), .Y(n114) );
  INVX0_RVT U45 ( .A(n110), .Y(n116) );
  INVX0_RVT U46 ( .A(n111), .Y(n115) );
  NOR2X0_RVT U47 ( .A1(n110), .A2(rst), .Y(n111) );
  INVX0_RVT U48 ( .A(n96), .Y(n135) );
  INVX0_RVT U49 ( .A(n138), .Y(n11) );
  NOR2X0_RVT U50 ( .A1(rst), .A2(n116), .Y(n117) );
  NAND3X1_RVT U51 ( .A1(n20), .A2(n70), .A3(n16), .Y(n8) );
  OR2X1_RVT U52 ( .A1(n133), .A2(rst), .Y(n9) );
  OR2X1_RVT U53 ( .A1(n25), .A2(n113), .Y(n12) );
  AO21X1_RVT U54 ( .A1(n28), .A2(n93), .A3(rst), .Y(n13) );
  AO21X1_RVT U55 ( .A1(n28), .A2(n93), .A3(rst), .Y(n14) );
  OR2X2_RVT U56 ( .A1(n94), .A2(n96), .Y(n97) );
  NOR2X0_RVT U57 ( .A1(n95), .A2(rst), .Y(n107) );
  NOR2X0_RVT U58 ( .A1(n105), .A2(rst), .Y(n106) );
  NOR2X0_RVT U59 ( .A1(n157), .A2(n13), .Y(n100) );
  OR3X1_RVT U60 ( .A1(n55), .A2(n61), .A3(n53), .Y(n93) );
  OR3X1_RVT U61 ( .A1(n96), .A2(n37), .A3(n94), .Y(n55) );
  OR3X2_RVT U62 ( .A1(n25), .A2(n108), .A3(n23), .Y(n128) );
  AND2X1_RVT U63 ( .A1(mem[1]), .A2(n105), .Y(n84) );
  INVX0_RVT U64 ( .A(n79), .Y(n36) );
  INVX0_RVT U65 ( .A(addr[0]), .Y(n46) );
  NBUFFX2_RVT U66 ( .A(addr[0]), .Y(n15) );
  AND2X1_RVT U67 ( .A1(n46), .A2(addr[1]), .Y(n71) );
  NAND3X0_RVT U68 ( .A1(n20), .A2(n19), .A3(n18), .Y(n17) );
  OR2X1_RVT U69 ( .A1(n144), .A2(n97), .Y(n99) );
  OR3X1_RVT U70 ( .A1(n81), .A2(n80), .A3(n79), .Y(n144) );
  OR3X1_RVT U71 ( .A1(n22), .A2(n17), .A3(n97), .Y(n102) );
  OR2X1_RVT U72 ( .A1(n21), .A2(n10), .Y(n20) );
  OR3X1_RVT U73 ( .A1(n79), .A2(n77), .A3(n78), .Y(n22) );
  OA22X1_RVT U74 ( .A1(n158), .A2(n87), .A3(n151), .A4(n139), .Y(n63) );
  MUX21X1_RVT U75 ( .A1(mem[14]), .A2(n131), .S0(n114), .Y(n56) );
  NBUFFX2_RVT U77 ( .A(n82), .Y(n139) );
  AO21X1_RVT U78 ( .A1(n121), .A2(n117), .A3(n98), .Y(n51) );
  AND2X1_RVT U79 ( .A1(n14), .A2(n35), .Y(n26) );
  INVX0_RVT U80 ( .A(n13), .Y(n112) );
  AO21X1_RVT U81 ( .A1(n8), .A2(n99), .A3(n27), .Y(n109) );
  AND2X1_RVT U82 ( .A1(mem[5]), .A2(n71), .Y(n91) );
  AND2X1_RVT U83 ( .A1(mem[6]), .A2(n71), .Y(n83) );
  AO21X1_RVT U84 ( .A1(n28), .A2(n93), .A3(rst), .Y(n121) );
  OR2X1_RVT U85 ( .A1(n45), .A2(n69), .Y(n47) );
  NAND2X0_RVT U86 ( .A1(n36), .A2(n63), .Y(n37) );
  INVX0_RVT U87 ( .A(addr[1]), .Y(n138) );
  AO21X1_RVT U88 ( .A1(mem[9]), .A2(n71), .A3(n47), .Y(n142) );
  AO21X1_RVT U89 ( .A1(n71), .A2(n54), .A3(n78), .Y(n53) );
  OR2X1_RVT U90 ( .A1(mem[8]), .A2(mem[9]), .Y(n54) );
  NOR2X0_RVT U92 ( .A1(n160), .A2(n86), .Y(n69) );
  AND2X1_RVT U95 ( .A1(addr[0]), .A2(addr[1]), .Y(n105) );
  INVX0_RVT U96 ( .A(addr[1]), .Y(n62) );
  NAND2X0_RVT U97 ( .A1(addr[0]), .A2(n62), .Y(n82) );
  INVX0_RVT U98 ( .A(n82), .Y(n89) );
  INVX0_RVT U99 ( .A(n70), .Y(n78) );
  NOR2X0_RVT U100 ( .A1(n159), .A2(n86), .Y(n77) );
  OAI22X1_RVT U101 ( .A1(n149), .A2(n139), .A3(n155), .A4(n87), .Y(n81) );
  NOR2X0_RVT U102 ( .A1(n156), .A2(n86), .Y(n80) );
  AND2X1_RVT U103 ( .A1(n71), .A2(mem[7]), .Y(n79) );
  AO21X1_RVT U104 ( .A1(mem[10]), .A2(n89), .A3(n88), .Y(n90) );
  NOR2X0_RVT U105 ( .A1(n153), .A2(n121), .Y(n98) );
  NBUFFX2_RVT U106 ( .A(n94), .Y(n95) );
  AO21X1_RVT U108 ( .A1(n95), .A2(n96), .A3(n118), .Y(n110) );
  NOR2X0_RVT U109 ( .A1(n158), .A2(n121), .Y(n104) );
  INVX0_RVT U110 ( .A(n93), .Y(n101) );
  MUX21X1_RVT U111 ( .A1(mem[0]), .A2(n107), .S0(n130), .Y(n76) );
  AND2X1_RVT U112 ( .A1(n35), .A2(n21), .Y(n108) );
  AND2X1_RVT U113 ( .A1(n35), .A2(n109), .Y(n129) );
  MUX21X1_RVT U114 ( .A1(mem[8]), .A2(n129), .S0(n4), .Y(n65) );
  MUX21X1_RVT U115 ( .A1(mem[6]), .A2(n115), .S0(n4), .Y(n67) );
  MUX21X1_RVT U116 ( .A1(mem[9]), .A2(n131), .S0(n4), .Y(n64) );
  MUX21X1_RVT U117 ( .A1(n9), .A2(mem[5]), .S0(n128), .Y(n68) );
  MUX21X1_RVT U118 ( .A1(n9), .A2(mem[15]), .S0(n112), .Y(n52) );
  MUX21X1_RVT U119 ( .A1(n115), .A2(mem[1]), .S0(n124), .Y(n75) );
  MUX21X1_RVT U120 ( .A1(n117), .A2(mem[11]), .S0(n132), .Y(n59) );
  INVX0_RVT U121 ( .A(n99), .Y(n119) );
  OR2X1_RVT U122 ( .A1(n122), .A2(rst), .Y(n125) );
  MUX21X1_RVT U123 ( .A1(mem[16]), .A2(n125), .S0(n121), .Y(n50) );
  NAND2X0_RVT U124 ( .A1(n122), .A2(n35), .Y(n127) );
  NAND2X0_RVT U125 ( .A1(mem[2]), .A2(n124), .Y(n123) );
  OAI21X2_RVT U126 ( .A1(n124), .A2(n127), .A3(n123), .Y(n74) );
  MUX21X1_RVT U127 ( .A1(n125), .A2(mem[12]), .S0(n132), .Y(n58) );
  NAND2X0_RVT U128 ( .A1(mem[7]), .A2(n128), .Y(n126) );
  MUX21X1_RVT U130 ( .A1(n129), .A2(mem[13]), .S0(n132), .Y(n57) );
  MUX21X1_RVT U131 ( .A1(mem[4]), .A2(n131), .S0(n7), .Y(n72) );
  AND2X1_RVT U132 ( .A1(mem_read), .A2(n35), .Y(n143) );
  NOR2X0_RVT U133 ( .A1(n136), .A2(n133), .Y(n134) );
  AO21X1_RVT U134 ( .A1(n145), .A2(stock[0]), .A3(n134), .Y(n30) );
  NOR2X0_RVT U135 ( .A1(n136), .A2(n135), .Y(n137) );
  AO21X1_RVT U136 ( .A1(n145), .A2(stock[1]), .A3(n137), .Y(n31) );
  AO22X1_RVT U137 ( .A1(n11), .A2(n143), .A3(n145), .A4(price[6]), .Y(n44) );
  AO22X1_RVT U138 ( .A1(n15), .A2(n143), .A3(n145), .A4(price[5]), .Y(n43) );
  AO22X1_RVT U139 ( .A1(price[4]), .A2(n145), .A3(n138), .A4(n143), .Y(n42) );
  INVX0_RVT U140 ( .A(n15), .Y(n141) );
  AO22X1_RVT U141 ( .A1(price[3]), .A2(n145), .A3(n143), .A4(n141), .Y(n41) );
  AO22X1_RVT U142 ( .A1(n105), .A2(n143), .A3(n145), .A4(price[2]), .Y(n40) );
  NAND2X0_RVT U143 ( .A1(n2), .A2(n21), .Y(n140) );
  AO22X1_RVT U144 ( .A1(n143), .A2(n140), .A3(n145), .A4(price[1]), .Y(n39) );
  AO22X1_RVT U145 ( .A1(price[0]), .A2(n145), .A3(n143), .A4(n141), .Y(n38) );
  AO22X1_RVT U146 ( .A1(stock[4]), .A2(n145), .A3(n143), .A4(n142), .Y(n34) );
  AO22X1_RVT U147 ( .A1(stock[3]), .A2(n145), .A3(n143), .A4(n8), .Y(n33) );
  AO22X1_RVT U148 ( .A1(stock[2]), .A2(n145), .A3(n144), .A4(n143), .Y(n32) );
  OR4X2_RVT U5 ( .A1(n77), .A2(n69), .A3(n80), .A4(n81), .Y(n61) );
  INVX0_RVT U10 ( .A(n97), .Y(n118) );
  INVX1_RVT U19 ( .A(n71), .Y(n21) );
  OAI21X2_RVT U23 ( .A1(n128), .A2(n127), .A3(n126), .Y(n66) );
  MUX21X1_RVT U43 ( .A1(n129), .A2(mem[3]), .S0(n124), .Y(n73) );
  AO21X1_RVT U76 ( .A1(n26), .A2(n24), .A3(n104), .Y(n48) );
endmodule


module comparator ( credit, price, stock, can_sell );
  input [7:0] credit;
  input [7:0] price;
  input [7:0] stock;
  output can_sell;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;

  INVX0_RVT U2 ( .A(price[1]), .Y(n3) );
  INVX0_RVT U3 ( .A(credit[0]), .Y(n1) );
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
        n13), .A6(n12), .Y(n15) );
  OR4X1_RVT U16 ( .A1(stock[3]), .A2(stock[2]), .A3(stock[1]), .A4(stock[0]), 
        .Y(n14) );
  OA22X1_RVT U17 ( .A1(credit[7]), .A2(n15), .A3(stock[4]), .A4(n14), .Y(
        can_sell) );
endmodule


module subtractor ( credit, price, change );
  input [7:0] credit;
  input [7:0] price;
  output [7:0] change;
  wire   intadd_8_B_5_, intadd_8_B_4_, intadd_8_B_3_, intadd_8_B_2_,
         intadd_8_B_1_, intadd_8_B_0_, intadd_8_CI, intadd_8_SUM_5_,
         intadd_8_SUM_4_, intadd_8_SUM_3_, intadd_8_SUM_2_, intadd_8_SUM_1_,
         intadd_8_SUM_0_, intadd_8_n6, intadd_8_n5, intadd_8_n4, intadd_8_n3,
         intadd_8_n2, intadd_8_n1, n1;

  FADDX1_RVT intadd_8_U7 ( .A(intadd_8_B_0_), .B(price[1]), .CI(intadd_8_CI), 
        .CO(intadd_8_n6), .S(intadd_8_SUM_0_) );
  FADDX1_RVT intadd_8_U6 ( .A(intadd_8_B_1_), .B(price[2]), .CI(intadd_8_n6), 
        .CO(intadd_8_n5), .S(intadd_8_SUM_1_) );
  FADDX1_RVT intadd_8_U5 ( .A(intadd_8_B_2_), .B(price[3]), .CI(intadd_8_n5), 
        .CO(intadd_8_n4), .S(intadd_8_SUM_2_) );
  FADDX1_RVT intadd_8_U4 ( .A(intadd_8_B_3_), .B(price[4]), .CI(intadd_8_n4), 
        .CO(intadd_8_n3), .S(intadd_8_SUM_3_) );
  FADDX1_RVT intadd_8_U3 ( .A(intadd_8_B_4_), .B(price[5]), .CI(intadd_8_n3), 
        .CO(intadd_8_n2), .S(intadd_8_SUM_4_) );
  FADDX1_RVT intadd_8_U2 ( .A(intadd_8_B_5_), .B(price[6]), .CI(intadd_8_n2), 
        .CO(intadd_8_n1), .S(intadd_8_SUM_5_) );
  INVX0_RVT U1 ( .A(intadd_8_SUM_0_), .Y(change[1]) );
  INVX0_RVT U2 ( .A(intadd_8_SUM_5_), .Y(change[6]) );
  XOR2X1_RVT U3 ( .A1(intadd_8_n1), .A2(credit[7]), .Y(change[7]) );
  INVX0_RVT U4 ( .A(intadd_8_SUM_4_), .Y(change[5]) );
  INVX0_RVT U5 ( .A(intadd_8_SUM_3_), .Y(change[4]) );
  INVX0_RVT U6 ( .A(intadd_8_SUM_2_), .Y(change[3]) );
  INVX0_RVT U7 ( .A(intadd_8_SUM_1_), .Y(change[2]) );
  INVX0_RVT U8 ( .A(price[0]), .Y(n1) );
  NOR2X0_RVT U9 ( .A1(n1), .A2(credit[0]), .Y(intadd_8_CI) );
  INVX0_RVT U10 ( .A(credit[6]), .Y(intadd_8_B_5_) );
  INVX0_RVT U11 ( .A(credit[5]), .Y(intadd_8_B_4_) );
  INVX0_RVT U12 ( .A(credit[4]), .Y(intadd_8_B_3_) );
  INVX0_RVT U13 ( .A(credit[3]), .Y(intadd_8_B_2_) );
  INVX0_RVT U14 ( .A(credit[1]), .Y(intadd_8_B_0_) );
  INVX0_RVT U15 ( .A(credit[2]), .Y(intadd_8_B_1_) );
  AO21X1_RVT U16 ( .A1(credit[0]), .A2(n1), .A3(intadd_8_CI), .Y(change[0]) );
endmodule


module control_unit ( clk, rst, cancel, coin_in, confirm, can_sell, state, 
        credit_load, credit_clear, mem_read, mem_write, dispense, error, 
        change_load );
  input [1:0] coin_in;
  output [2:0] state;
  input clk, rst, cancel, confirm, can_sell;
  output credit_load, credit_clear, mem_read, mem_write, dispense, error,
         change_load;
  wire   check_wait, N22, n1, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15,
         n22, n23, n24, n25, n26, n29;

  DFFSSRX1_RVT check_wait_reg ( .D(n26), .SETB(1'b1), .RSTB(n25), .CLK(clk), 
        .Q(check_wait), .QN(n23) );
  INVX0_RVT U3 ( .A(n5), .Y(mem_write) );
  INVX0_RVT U4 ( .A(dispense), .Y(n5) );
  INVX0_RVT U5 ( .A(n14), .Y(n4) );
  NOR2X0_RVT U6 ( .A1(rst), .A2(cancel), .Y(n26) );
  AND2X1_RVT U8 ( .A1(n26), .A2(n29), .Y(n1) );
  AND3X1_RVT U15 ( .A1(state[1]), .A2(state[0]), .A3(n29), .Y(dispense) );
  AO222X1_RVT U16 ( .A1(n29), .A2(state[1]), .A3(n29), .A4(coin_in[1]), .A5(
        n29), .A6(coin_in[0]), .Y(n6) );
  OA222X1_RVT U17 ( .A1(n24), .A2(check_wait), .A3(n24), .A4(n22), .A5(
        state[0]), .A6(n6), .Y(n7) );
  AND2X1_RVT U18 ( .A1(n7), .A2(n26), .Y(n9) );
  NAND2X0_RVT U19 ( .A1(state[0]), .A2(confirm), .Y(n12) );
  AND2X1_RVT U22 ( .A1(n29), .A2(n24), .Y(n11) );
  OR2X1_RVT U23 ( .A1(coin_in[0]), .A2(coin_in[1]), .Y(n10) );
  AND2X1_RVT U24 ( .A1(n11), .A2(n10), .Y(credit_load) );
  AND2X1_RVT U25 ( .A1(state[2]), .A2(n24), .Y(change_load) );
  AND2X1_RVT U26 ( .A1(change_load), .A2(n22), .Y(credit_clear) );
  AND4X1_RVT U27 ( .A1(state[1]), .A2(n22), .A3(n29), .A4(n23), .Y(mem_read)
         );
  INVX0_RVT U28 ( .A(n12), .Y(n13) );
  OA222X1_RVT U29 ( .A1(n24), .A2(can_sell), .A3(n24), .A4(n22), .A5(state[1]), 
        .A6(n13), .Y(n14) );
  AND2X1_RVT U30 ( .A1(state[0]), .A2(change_load), .Y(error) );
  NOR4X1_RVT U31 ( .A1(state[2]), .A2(can_sell), .A3(n24), .A4(n23), .Y(n15)
         );
  AO222X1_RVT U32 ( .A1(n26), .A2(n15), .A3(n26), .A4(dispense), .A5(n26), 
        .A6(error), .Y(N22) );
  AO221X1_RVT U33 ( .A1(check_wait), .A2(change_load), .A3(check_wait), .A4(
        dispense), .A5(mem_read), .Y(n25) );
  DFFSSRX1_RVT current_state_reg_0_ ( .D(n12), .SETB(n29), .RSTB(n9), .CLK(clk), .Q(state[0]), .QN(n22) );
  DFFSSRX1_RVT current_state_reg_1_ ( .D(mem_read), .SETB(n4), .RSTB(n1), 
        .CLK(clk), .Q(state[1]), .QN(n24) );
  DFFSSRX1_RVT current_state_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(N22), .CLK(
        clk), .Q(state[2]), .QN(n29) );
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
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n21, n22, n23, n24,
         n27, n28, n29, n30, n31, n32, n33, n34, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10;
  wire   [6:1] coin_value;
  wire   [6:0] price;
  wire   [4:0] stock;
  wire   [7:0] change;

  INVX0_RVT U25 ( .A(n21), .Y(n31) );
  INVX0_RVT U27 ( .A(cancel), .Y(n30) );
  NOR3X0_RVT U28 ( .A1(n21), .A2(cancel), .A3(change_load), .Y(n32) );
  NBUFFX2_RVT U29 ( .A(coin_in[0]), .Y(n19) );
  NBUFFX2_RVT U30 ( .A(rst), .Y(n21) );
  INVX0_RVT U31 ( .A(coin_in[1]), .Y(n23) );
  NBUFFX2_RVT U32 ( .A(coin_in[1]), .Y(n22) );
  INVX0_RVT U33 ( .A(coin_in[0]), .Y(n24) );
  AND2X1_RVT U35 ( .A1(n23), .A2(coin_in[0]), .Y(coin_value[3]) );
  AND2X1_RVT U36 ( .A1(coin_in[1]), .A2(n24), .Y(coin_value[1]) );
  AND2X1_RVT U41 ( .A1(coin_in[0]), .A2(coin_in[1]), .Y(coin_value[6]) );
  INVX0_RVT U42 ( .A(state_out[1]), .Y(n27) );
  NAND3X0_RVT U43 ( .A1(state_out[0]), .A2(state_out[2]), .A3(n27), .Y(n29) );
  INVX0_RVT U44 ( .A(n29), .Y(n28) );
  OA221X1_RVT U45 ( .A1(cancel), .A2(change_load), .A3(cancel), .A4(n28), .A5(
        n31), .Y(n34) );
  AND4X1_RVT U46 ( .A1(change_load), .A2(n31), .A3(n30), .A4(n29), .Y(n33) );
  AO222X1_RVT U47 ( .A1(n34), .A2(display[7]), .A3(n32), .A4(change_out[7]), 
        .A5(n33), .A6(change[7]), .Y(n17) );
  AO222X1_RVT U48 ( .A1(n34), .A2(display[6]), .A3(n33), .A4(change[6]), .A5(
        change_out[6]), .A6(n32), .Y(n16) );
  AO222X1_RVT U49 ( .A1(n34), .A2(display[5]), .A3(n33), .A4(change[5]), .A5(
        change_out[5]), .A6(n32), .Y(n15) );
  AO222X1_RVT U50 ( .A1(n34), .A2(display[4]), .A3(n33), .A4(change[4]), .A5(
        change_out[4]), .A6(n32), .Y(n14) );
  AO222X1_RVT U51 ( .A1(n34), .A2(display[3]), .A3(n33), .A4(change[3]), .A5(
        change_out[3]), .A6(n32), .Y(n13) );
  AO222X1_RVT U52 ( .A1(n34), .A2(display[2]), .A3(n33), .A4(change[2]), .A5(
        change_out[2]), .A6(n32), .Y(n12) );
  AO222X1_RVT U53 ( .A1(n34), .A2(display[1]), .A3(n33), .A4(change[1]), .A5(
        change_out[1]), .A6(n32), .Y(n11) );
  AO222X1_RVT U54 ( .A1(n34), .A2(display[0]), .A3(n33), .A4(change[0]), .A5(
        change_out[0]), .A6(n32), .Y(n10) );
  credit_reg u_credit_reg ( .clk(clk), .rst(n21), .cancel(cancel), .clear(
        credit_clear), .load(credit_load), .coin_value({SYNOPSYS_UNCONNECTED_1, 
        coin_value[6], n22, n18, coin_value[3], coin_value[6], coin_value[1], 
        coin_value[3]}), .credit(display) );
  memory u_memory ( .clk(clk), .rst(n21), .mem_read(mem_read), .mem_write(
        mem_write), .addr(sel_item), .price({SYNOPSYS_UNCONNECTED_2, price}), 
        .stock({SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, stock}) );
  comparator u_comparator ( .credit(display), .price({SYNOPSYS_UNCONNECTED_6, 
        price}), .stock({SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, 
        SYNOPSYS_UNCONNECTED_9, stock}), .can_sell(can_sell) );
  subtractor u_subtractor ( .credit(display), .price({SYNOPSYS_UNCONNECTED_10, 
        price}), .change(change) );
  control_unit u_control_unit ( .clk(clk), .rst(n21), .cancel(cancel), 
        .coin_in({n22, n19}), .confirm(confirm), .can_sell(can_sell), .state(
        state_out), .credit_load(credit_load), .credit_clear(credit_clear), 
        .mem_read(mem_read), .mem_write(mem_write), .dispense(dispense), 
        .error(error), .change_load(change_load) );
  DFFSSRX1_RVT change_out_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n10), .CLK(clk), .Q(change_out[0]) );
  DFFSSRX1_RVT change_out_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n11), .CLK(clk), .Q(change_out[1]) );
  DFFSSRX1_RVT change_out_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n12), .CLK(clk), .Q(change_out[2]) );
  DFFSSRX1_RVT change_out_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n13), .CLK(clk), .Q(change_out[3]) );
  DFFSSRX1_RVT change_out_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n14), .CLK(clk), .Q(change_out[4]) );
  DFFSSRX1_RVT change_out_reg_5_ ( .D(1'b0), .SETB(1'b0), .RSTB(n15), .CLK(clk), .Q(change_out[5]) );
  DFFSSRX1_RVT change_out_reg_7_ ( .D(1'b0), .SETB(1'b0), .RSTB(n17), .CLK(clk), .Q(change_out[7]) );
  DFFSSRX1_RVT change_out_reg_6_ ( .D(1'b0), .SETB(1'b0), .RSTB(n16), .CLK(clk), .Q(change_out[6]) );
  OR2X2_RVT U26 ( .A1(coin_value[1]), .A2(coin_value[3]), .Y(n18) );
endmodule

