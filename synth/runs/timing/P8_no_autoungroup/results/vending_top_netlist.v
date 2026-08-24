/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri Aug 21 14:49:29 2026
/////////////////////////////////////////////////////////////


module credit_reg ( clk, rst, cancel, clear, load, coin_value, credit );
  input [7:0] coin_value;
  output [7:0] credit;
  input clk, rst, cancel, clear, load;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n2, n3, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n51, n52;

  DFFSSRX1_RVT credit_reg_6_ ( .D(1'b0), .SETB(n5), .RSTB(1'b1), .CLK(clk), 
        .Q(n52), .QN(credit[6]) );
  DFFSSRX1_RVT credit_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n11), .CLK(clk), 
        .Q(credit[0]), .QN(n51) );
  AND2X1_RVT U3 ( .A1(n2), .A2(n3), .Y(n45) );
  AND2X1_RVT U4 ( .A1(load), .A2(n44), .Y(n2) );
  NAND2X0_RVT U5 ( .A1(n43), .A2(n52), .Y(n3) );
  NAND2X0_RVT U9 ( .A1(coin_value[3]), .A2(load), .Y(n12) );
  INVX0_RVT U10 ( .A(n12), .Y(n13) );
  NOR3X0_RVT U11 ( .A1(cancel), .A2(clear), .A3(rst), .Y(n47) );
  OA221X1_RVT U12 ( .A1(credit[0]), .A2(n13), .A3(n51), .A4(n12), .A5(n47), 
        .Y(n11) );
  NAND3X0_RVT U13 ( .A1(coin_value[3]), .A2(credit[0]), .A3(coin_value[1]), 
        .Y(n14) );
  AND2X1_RVT U14 ( .A1(n14), .A2(load), .Y(n16) );
  AND2X1_RVT U15 ( .A1(coin_value[3]), .A2(credit[0]), .Y(n19) );
  OR2X1_RVT U16 ( .A1(coin_value[1]), .A2(n19), .Y(n15) );
  AND2X1_RVT U17 ( .A1(n16), .A2(n15), .Y(n17) );
  HADDX1_RVT U18 ( .A0(credit[1]), .B0(n17), .SO(n18) );
  AND2X1_RVT U19 ( .A1(n47), .A2(n18), .Y(n10) );
  AO222X1_RVT U20 ( .A1(n19), .A2(coin_value[1]), .A3(n19), .A4(credit[1]), 
        .A5(coin_value[1]), .A6(credit[1]), .Y(n24) );
  INVX0_RVT U21 ( .A(coin_value[6]), .Y(n21) );
  INVX0_RVT U22 ( .A(n24), .Y(n20) );
  OA221X1_RVT U23 ( .A1(coin_value[6]), .A2(n24), .A3(n21), .A4(n20), .A5(load), .Y(n22) );
  HADDX1_RVT U24 ( .A0(credit[2]), .B0(n22), .SO(n23) );
  AND2X1_RVT U25 ( .A1(n47), .A2(n23), .Y(n9) );
  AO222X1_RVT U26 ( .A1(coin_value[6]), .A2(credit[2]), .A3(coin_value[6]), 
        .A4(n24), .A5(credit[2]), .A6(n24), .Y(n29) );
  INVX0_RVT U27 ( .A(coin_value[3]), .Y(n26) );
  INVX0_RVT U28 ( .A(n29), .Y(n25) );
  OA221X1_RVT U29 ( .A1(coin_value[3]), .A2(n29), .A3(n26), .A4(n25), .A5(load), .Y(n27) );
  HADDX1_RVT U30 ( .A0(credit[3]), .B0(n27), .SO(n28) );
  AND2X1_RVT U31 ( .A1(n47), .A2(n28), .Y(n8) );
  AO222X1_RVT U32 ( .A1(coin_value[3]), .A2(credit[3]), .A3(coin_value[3]), 
        .A4(n29), .A5(credit[3]), .A6(n29), .Y(n34) );
  INVX0_RVT U33 ( .A(n34), .Y(n31) );
  INVX0_RVT U34 ( .A(coin_value[4]), .Y(n30) );
  OA221X1_RVT U35 ( .A1(n31), .A2(n30), .A3(n34), .A4(coin_value[4]), .A5(load), .Y(n32) );
  HADDX1_RVT U36 ( .A0(credit[4]), .B0(n32), .SO(n33) );
  AND2X1_RVT U37 ( .A1(n47), .A2(n33), .Y(n7) );
  AO222X1_RVT U38 ( .A1(coin_value[4]), .A2(credit[4]), .A3(coin_value[4]), 
        .A4(n34), .A5(credit[4]), .A6(n34), .Y(n39) );
  INVX0_RVT U39 ( .A(n39), .Y(n36) );
  INVX0_RVT U40 ( .A(coin_value[5]), .Y(n35) );
  OA221X1_RVT U41 ( .A1(n36), .A2(n35), .A3(n39), .A4(coin_value[5]), .A5(load), .Y(n37) );
  HADDX1_RVT U42 ( .A0(credit[5]), .B0(n37), .SO(n38) );
  AND2X1_RVT U43 ( .A1(n47), .A2(n38), .Y(n6) );
  AO222X1_RVT U44 ( .A1(coin_value[5]), .A2(credit[5]), .A3(coin_value[5]), 
        .A4(n39), .A5(credit[5]), .A6(n39), .Y(n40) );
  OR2X1_RVT U45 ( .A1(coin_value[6]), .A2(n40), .Y(n44) );
  NAND2X0_RVT U46 ( .A1(coin_value[6]), .A2(n40), .Y(n43) );
  NAND3X0_RVT U47 ( .A1(load), .A2(n44), .A3(n43), .Y(n41) );
  INVX0_RVT U48 ( .A(n41), .Y(n42) );
  OA221X1_RVT U49 ( .A1(credit[6]), .A2(n42), .A3(n52), .A4(n41), .A5(n47), 
        .Y(n5) );
  HADDX1_RVT U50 ( .A0(credit[7]), .B0(n45), .SO(n46) );
  AND2X1_RVT U51 ( .A1(n47), .A2(n46), .Y(n4) );
  DFFSSRX1_RVT credit_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n10), .CLK(clk), 
        .Q(credit[1]) );
  DFFSSRX1_RVT credit_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n9), .CLK(clk), 
        .Q(credit[2]) );
  DFFSSRX1_RVT credit_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n8), .CLK(clk), 
        .Q(credit[3]) );
  DFFSSRX1_RVT credit_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n7), .CLK(clk), 
        .Q(credit[4]) );
  DFFSSRX1_RVT credit_reg_5_ ( .D(1'b0), .SETB(1'b0), .RSTB(n6), .CLK(clk), 
        .Q(credit[5]) );
  DFFSSRX1_RVT credit_reg_7_ ( .D(1'b0), .SETB(1'b0), .RSTB(n4), .CLK(clk), 
        .Q(credit[7]) );
endmodule


module memory ( clk, rst, mem_read, mem_write, addr, price, stock );
  input [1:0] addr;
  output [7:0] price;
  output [7:0] stock;
  input clk, rst, mem_read, mem_write;
  wire   n30, n31, n32, n33, n34, n38, n39, n40, n41, n42, n43, n44, n48, n49,
         n50, n51, n52, n56, n57, n58, n59, n60, n64, n65, n66, n67, n68, n72,
         n73, n74, n75, n76, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n35, n36, n37, n45, n46, n47, n53, n54, n55, n61, n62,
         n63, n69, n70;
  wire   [19:0] mem;

  NAND2X0_RVT U3 ( .A1(addr[1]), .A2(addr[0]), .Y(n36) );
  MUX41X1_RVT U4 ( .A1(mem[19]), .A3(mem[9]), .A2(mem[14]), .A4(mem[4]), .S0(
        addr[1]), .S1(addr[0]), .Y(n54) );
  MUX41X1_RVT U5 ( .A1(mem[18]), .A3(mem[8]), .A2(mem[13]), .A4(mem[3]), .S0(
        addr[1]), .S1(addr[0]), .Y(n55) );
  MUX41X1_RVT U6 ( .A1(mem[17]), .A3(mem[7]), .A2(mem[12]), .A4(mem[2]), .S0(
        addr[1]), .S1(addr[0]), .Y(n61) );
  MUX41X1_RVT U7 ( .A1(mem[15]), .A3(mem[5]), .A2(mem[10]), .A4(mem[0]), .S0(
        addr[1]), .S1(addr[0]), .Y(n63) );
  MUX41X1_RVT U8 ( .A1(mem[16]), .A3(mem[6]), .A2(mem[11]), .A4(mem[1]), .S0(
        addr[1]), .S1(addr[0]), .Y(n62) );
  OR2X1_RVT U9 ( .A1(n63), .A2(n62), .Y(n6) );
  OR2X1_RVT U10 ( .A1(n61), .A2(n6), .Y(n8) );
  OR2X1_RVT U11 ( .A1(n55), .A2(n8), .Y(n10) );
  OR2X1_RVT U12 ( .A1(n54), .A2(n10), .Y(n1) );
  NAND2X0_RVT U13 ( .A1(n1), .A2(mem_write), .Y(n19) );
  INVX0_RVT U14 ( .A(rst), .Y(n29) );
  OA21X1_RVT U15 ( .A1(n36), .A2(n19), .A3(n29), .Y(n12) );
  INVX0_RVT U16 ( .A(n63), .Y(n2) );
  INVX0_RVT U17 ( .A(n12), .Y(n4) );
  AND2X1_RVT U18 ( .A1(n29), .A2(n4), .Y(n11) );
  AO22X1_RVT U19 ( .A1(mem[0]), .A2(n12), .A3(n2), .A4(n11), .Y(n76) );
  INVX0_RVT U20 ( .A(n6), .Y(n3) );
  AO21X1_RVT U21 ( .A1(n63), .A2(n62), .A3(n3), .Y(n22) );
  AO221X1_RVT U22 ( .A1(n22), .A2(n4), .A3(n12), .A4(mem[1]), .A5(rst), .Y(n75) );
  INVX0_RVT U23 ( .A(n8), .Y(n5) );
  AO21X1_RVT U24 ( .A1(n61), .A2(n6), .A3(n5), .Y(n24) );
  AO22X1_RVT U25 ( .A1(mem[2]), .A2(n12), .A3(n11), .A4(n24), .Y(n74) );
  INVX0_RVT U26 ( .A(n10), .Y(n7) );
  AO21X1_RVT U27 ( .A1(n55), .A2(n8), .A3(n7), .Y(n25) );
  AO22X1_RVT U28 ( .A1(mem[3]), .A2(n12), .A3(n11), .A4(n25), .Y(n73) );
  INVX0_RVT U29 ( .A(n1), .Y(n9) );
  AO21X1_RVT U30 ( .A1(n54), .A2(n10), .A3(n9), .Y(n26) );
  AO22X1_RVT U31 ( .A1(mem[4]), .A2(n12), .A3(n11), .A4(n26), .Y(n72) );
  INVX0_RVT U32 ( .A(addr[0]), .Y(n53) );
  NAND2X0_RVT U33 ( .A1(addr[1]), .A2(n53), .Y(n45) );
  OA21X1_RVT U34 ( .A1(n45), .A2(n19), .A3(n29), .Y(n15) );
  INVX0_RVT U35 ( .A(n15), .Y(n13) );
  NAND2X0_RVT U36 ( .A1(n63), .A2(n29), .Y(n21) );
  AO22X1_RVT U37 ( .A1(n15), .A2(mem[5]), .A3(n13), .A4(n21), .Y(n68) );
  AO221X1_RVT U38 ( .A1(n22), .A2(n13), .A3(n15), .A4(mem[6]), .A5(rst), .Y(
        n67) );
  AND2X1_RVT U39 ( .A1(n29), .A2(n13), .Y(n14) );
  AO22X1_RVT U40 ( .A1(mem[7]), .A2(n15), .A3(n14), .A4(n24), .Y(n66) );
  AO22X1_RVT U41 ( .A1(mem[8]), .A2(n15), .A3(n14), .A4(n25), .Y(n65) );
  AO22X1_RVT U42 ( .A1(mem[9]), .A2(n15), .A3(n14), .A4(n26), .Y(n64) );
  INVX0_RVT U43 ( .A(addr[1]), .Y(n35) );
  NAND2X0_RVT U44 ( .A1(addr[0]), .A2(n35), .Y(n46) );
  OA21X1_RVT U45 ( .A1(n46), .A2(n19), .A3(n29), .Y(n18) );
  INVX0_RVT U46 ( .A(n18), .Y(n16) );
  AO22X1_RVT U47 ( .A1(n18), .A2(mem[10]), .A3(n16), .A4(n21), .Y(n60) );
  AND2X1_RVT U48 ( .A1(n29), .A2(n16), .Y(n17) );
  AO22X1_RVT U49 ( .A1(mem[11]), .A2(n18), .A3(n17), .A4(n22), .Y(n59) );
  AO221X1_RVT U50 ( .A1(n24), .A2(n16), .A3(n18), .A4(mem[12]), .A5(rst), .Y(
        n58) );
  AO22X1_RVT U51 ( .A1(mem[13]), .A2(n18), .A3(n17), .A4(n25), .Y(n57) );
  AO22X1_RVT U52 ( .A1(mem[14]), .A2(n18), .A3(n17), .A4(n26), .Y(n56) );
  NAND2X0_RVT U53 ( .A1(n35), .A2(n53), .Y(n20) );
  OA21X1_RVT U54 ( .A1(n20), .A2(n19), .A3(n29), .Y(n28) );
  INVX0_RVT U55 ( .A(n28), .Y(n23) );
  AO22X1_RVT U56 ( .A1(n28), .A2(mem[15]), .A3(n23), .A4(n21), .Y(n52) );
  AND2X1_RVT U57 ( .A1(n29), .A2(n23), .Y(n27) );
  AO22X1_RVT U58 ( .A1(mem[16]), .A2(n28), .A3(n27), .A4(n22), .Y(n51) );
  AO221X1_RVT U59 ( .A1(n24), .A2(n23), .A3(n28), .A4(mem[17]), .A5(rst), .Y(
        n50) );
  AO22X1_RVT U60 ( .A1(mem[18]), .A2(n28), .A3(n27), .A4(n25), .Y(n49) );
  AO22X1_RVT U61 ( .A1(mem[19]), .A2(n28), .A3(n27), .A4(n26), .Y(n48) );
  AND2X1_RVT U62 ( .A1(mem_read), .A2(n29), .Y(n69) );
  NOR2X0_RVT U63 ( .A1(rst), .A2(mem_read), .Y(n70) );
  AO22X1_RVT U64 ( .A1(addr[1]), .A2(n69), .A3(n70), .A4(price[6]), .Y(n44) );
  AO22X1_RVT U65 ( .A1(addr[0]), .A2(n69), .A3(n70), .A4(price[5]), .Y(n43) );
  AO22X1_RVT U66 ( .A1(price[4]), .A2(n70), .A3(n69), .A4(n35), .Y(n42) );
  AO22X1_RVT U67 ( .A1(price[3]), .A2(n70), .A3(n69), .A4(n53), .Y(n41) );
  INVX0_RVT U68 ( .A(n36), .Y(n37) );
  AO22X1_RVT U69 ( .A1(n37), .A2(n69), .A3(n70), .A4(price[2]), .Y(n40) );
  NAND2X0_RVT U70 ( .A1(n46), .A2(n45), .Y(n47) );
  AO22X1_RVT U71 ( .A1(n69), .A2(n47), .A3(n70), .A4(price[1]), .Y(n39) );
  AO22X1_RVT U72 ( .A1(price[0]), .A2(n70), .A3(n69), .A4(n53), .Y(n38) );
  AO22X1_RVT U73 ( .A1(stock[4]), .A2(n70), .A3(n69), .A4(n54), .Y(n34) );
  AO22X1_RVT U74 ( .A1(stock[3]), .A2(n70), .A3(n69), .A4(n55), .Y(n33) );
  AO22X1_RVT U75 ( .A1(stock[2]), .A2(n70), .A3(n69), .A4(n61), .Y(n32) );
  AO22X1_RVT U76 ( .A1(stock[1]), .A2(n70), .A3(n69), .A4(n62), .Y(n31) );
  AO22X1_RVT U77 ( .A1(stock[0]), .A2(n70), .A3(n69), .A4(n63), .Y(n30) );
  DFFSSRX1_RVT price_reg_6_ ( .D(1'b0), .SETB(1'b0), .RSTB(n44), .CLK(clk), 
        .Q(price[6]) );
  DFFSSRX1_RVT price_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n40), .CLK(clk), 
        .Q(price[2]) );
  DFFSSRX1_RVT price_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n39), .CLK(clk), 
        .Q(price[1]) );
  DFFSSRX1_RVT price_reg_5_ ( .D(1'b0), .SETB(1'b0), .RSTB(n43), .CLK(clk), 
        .Q(price[5]) );
  DFFSSRX1_RVT stock_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n34), .CLK(clk), 
        .Q(stock[4]) );
  DFFSSRX1_RVT stock_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n33), .CLK(clk), 
        .Q(stock[3]) );
  DFFSSRX1_RVT stock_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n32), .CLK(clk), 
        .Q(stock[2]) );
  DFFSSRX1_RVT stock_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n31), .CLK(clk), 
        .Q(stock[1]) );
  DFFSSRX1_RVT stock_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n30), .CLK(clk), 
        .Q(stock[0]) );
  DFFSSRX1_RVT price_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n42), .CLK(clk), 
        .Q(price[4]) );
  DFFSSRX1_RVT price_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n41), .CLK(clk), 
        .Q(price[3]) );
  DFFSSRX1_RVT price_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n38), .CLK(clk), 
        .Q(price[0]) );
  DFFSSRX1_RVT mem_reg_2__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n68), .CLK(clk), 
        .Q(mem[5]) );
  DFFSSRX1_RVT mem_reg_1__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n60), .CLK(clk), 
        .Q(mem[10]) );
  DFFSSRX1_RVT mem_reg_0__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n52), .CLK(clk), 
        .Q(mem[15]) );
  DFFSSRX1_RVT mem_reg_3__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n75), .CLK(clk), 
        .Q(mem[1]) );
  DFFSSRX1_RVT mem_reg_2__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n67), .CLK(clk), 
        .Q(mem[6]) );
  DFFSSRX1_RVT mem_reg_1__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n58), .CLK(clk), 
        .Q(mem[12]) );
  DFFSSRX1_RVT mem_reg_0__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n50), .CLK(clk), 
        .Q(mem[17]) );
  DFFSSRX1_RVT mem_reg_3__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n72), .CLK(clk), 
        .Q(mem[4]) );
  DFFSSRX1_RVT mem_reg_3__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n73), .CLK(clk), 
        .Q(mem[3]) );
  DFFSSRX1_RVT mem_reg_3__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n74), .CLK(clk), 
        .Q(mem[2]) );
  DFFSSRX1_RVT mem_reg_2__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n64), .CLK(clk), 
        .Q(mem[9]) );
  DFFSSRX1_RVT mem_reg_2__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n65), .CLK(clk), 
        .Q(mem[8]) );
  DFFSSRX1_RVT mem_reg_2__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n66), .CLK(clk), 
        .Q(mem[7]) );
  DFFSSRX1_RVT mem_reg_1__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n56), .CLK(clk), 
        .Q(mem[14]) );
  DFFSSRX1_RVT mem_reg_1__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n57), .CLK(clk), 
        .Q(mem[13]) );
  DFFSSRX1_RVT mem_reg_1__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n59), .CLK(clk), 
        .Q(mem[11]) );
  DFFSSRX1_RVT mem_reg_0__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n48), .CLK(clk), 
        .Q(mem[19]) );
  DFFSSRX1_RVT mem_reg_0__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n49), .CLK(clk), 
        .Q(mem[18]) );
  DFFSSRX1_RVT mem_reg_0__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n51), .CLK(clk), 
        .Q(mem[16]) );
  DFFSSRX1_RVT mem_reg_3__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n76), .CLK(clk), 
        .Q(mem[0]) );
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
  wire   intadd_6_B_5_, intadd_6_B_4_, intadd_6_B_3_, intadd_6_B_2_,
         intadd_6_B_1_, intadd_6_B_0_, intadd_6_CI, intadd_6_SUM_5_,
         intadd_6_SUM_4_, intadd_6_SUM_3_, intadd_6_SUM_2_, intadd_6_SUM_1_,
         intadd_6_SUM_0_, intadd_6_n6, intadd_6_n5, intadd_6_n4, intadd_6_n3,
         intadd_6_n2, intadd_6_n1, n1;

  FADDX1_RVT intadd_6_U7 ( .A(intadd_6_B_0_), .B(price[1]), .CI(intadd_6_CI), 
        .CO(intadd_6_n6), .S(intadd_6_SUM_0_) );
  FADDX1_RVT intadd_6_U6 ( .A(intadd_6_B_1_), .B(price[2]), .CI(intadd_6_n6), 
        .CO(intadd_6_n5), .S(intadd_6_SUM_1_) );
  FADDX1_RVT intadd_6_U5 ( .A(intadd_6_B_2_), .B(price[3]), .CI(intadd_6_n5), 
        .CO(intadd_6_n4), .S(intadd_6_SUM_2_) );
  FADDX1_RVT intadd_6_U4 ( .A(intadd_6_B_3_), .B(price[4]), .CI(intadd_6_n4), 
        .CO(intadd_6_n3), .S(intadd_6_SUM_3_) );
  FADDX1_RVT intadd_6_U3 ( .A(intadd_6_B_4_), .B(price[5]), .CI(intadd_6_n3), 
        .CO(intadd_6_n2), .S(intadd_6_SUM_4_) );
  FADDX1_RVT intadd_6_U2 ( .A(intadd_6_B_5_), .B(price[6]), .CI(intadd_6_n2), 
        .CO(intadd_6_n1), .S(intadd_6_SUM_5_) );
  INVX0_RVT U1 ( .A(intadd_6_SUM_5_), .Y(change[6]) );
  INVX0_RVT U2 ( .A(intadd_6_SUM_2_), .Y(change[3]) );
  INVX0_RVT U3 ( .A(intadd_6_SUM_4_), .Y(change[5]) );
  XOR2X1_RVT U4 ( .A1(intadd_6_n1), .A2(credit[7]), .Y(change[7]) );
  INVX0_RVT U5 ( .A(intadd_6_SUM_0_), .Y(change[1]) );
  INVX0_RVT U6 ( .A(intadd_6_SUM_1_), .Y(change[2]) );
  INVX0_RVT U7 ( .A(intadd_6_SUM_3_), .Y(change[4]) );
  INVX0_RVT U8 ( .A(price[0]), .Y(n1) );
  NOR2X0_RVT U9 ( .A1(n1), .A2(credit[0]), .Y(intadd_6_CI) );
  INVX0_RVT U10 ( .A(credit[5]), .Y(intadd_6_B_4_) );
  INVX0_RVT U11 ( .A(credit[1]), .Y(intadd_6_B_0_) );
  INVX0_RVT U12 ( .A(credit[2]), .Y(intadd_6_B_1_) );
  INVX0_RVT U13 ( .A(credit[3]), .Y(intadd_6_B_2_) );
  INVX0_RVT U14 ( .A(credit[4]), .Y(intadd_6_B_3_) );
  INVX0_RVT U15 ( .A(credit[6]), .Y(intadd_6_B_5_) );
  AO21X1_RVT U16 ( .A1(credit[0]), .A2(n1), .A3(intadd_6_CI), .Y(change[0]) );
endmodule


module control_unit ( clk, rst, cancel, coin_in, confirm, can_sell, state, 
        credit_load, credit_clear, mem_read, mem_write, dispense, error, 
        change_load );
  input [1:0] coin_in;
  output [2:0] state;
  input clk, rst, cancel, confirm, can_sell;
  output credit_load, credit_clear, mem_read, mem_write, dispense, error,
         change_load;
  wire   check_wait, N22, n1, n4, n5, n6, n7, n8, n10, n11, n12, n13, n14, n21,
         n22, n23, n24, n25, n28;

  DFFSSRX1_RVT check_wait_reg ( .D(n25), .SETB(1'b1), .RSTB(n24), .CLK(clk), 
        .Q(check_wait), .QN(n23) );
  INVX0_RVT U3 ( .A(n13), .Y(n4) );
  AND2X1_RVT U5 ( .A1(n25), .A2(n28), .Y(n1) );
  AND3X1_RVT U12 ( .A1(state[1]), .A2(state[0]), .A3(n28), .Y(dispense) );
  NBUFFX2_RVT U13 ( .A(dispense), .Y(mem_write) );
  NOR2X0_RVT U14 ( .A1(rst), .A2(cancel), .Y(n25) );
  AND2X1_RVT U15 ( .A1(n28), .A2(n21), .Y(n6) );
  OR2X1_RVT U16 ( .A1(coin_in[0]), .A2(coin_in[1]), .Y(n5) );
  AND2X1_RVT U17 ( .A1(n6), .A2(n5), .Y(credit_load) );
  AO222X1_RVT U18 ( .A1(n28), .A2(state[1]), .A3(n28), .A4(coin_in[1]), .A5(
        n28), .A6(coin_in[0]), .Y(n7) );
  OA222X1_RVT U19 ( .A1(n21), .A2(check_wait), .A3(n21), .A4(n22), .A5(
        state[0]), .A6(n7), .Y(n8) );
  AND2X1_RVT U20 ( .A1(n8), .A2(n25), .Y(n10) );
  NAND2X0_RVT U21 ( .A1(state[0]), .A2(confirm), .Y(n11) );
  AND2X1_RVT U24 ( .A1(state[2]), .A2(n21), .Y(change_load) );
  AND2X1_RVT U25 ( .A1(change_load), .A2(n22), .Y(credit_clear) );
  AND4X1_RVT U26 ( .A1(state[1]), .A2(n22), .A3(n28), .A4(n23), .Y(mem_read)
         );
  INVX0_RVT U27 ( .A(n11), .Y(n12) );
  OA222X1_RVT U28 ( .A1(n21), .A2(can_sell), .A3(n21), .A4(n22), .A5(state[1]), 
        .A6(n12), .Y(n13) );
  AND2X1_RVT U29 ( .A1(state[0]), .A2(change_load), .Y(error) );
  NOR4X1_RVT U30 ( .A1(state[2]), .A2(can_sell), .A3(n21), .A4(n23), .Y(n14)
         );
  AO222X1_RVT U31 ( .A1(n25), .A2(n14), .A3(n25), .A4(dispense), .A5(n25), 
        .A6(error), .Y(N22) );
  AO221X1_RVT U32 ( .A1(check_wait), .A2(change_load), .A3(check_wait), .A4(
        dispense), .A5(mem_read), .Y(n24) );
  DFFSSRX1_RVT current_state_reg_0_ ( .D(n11), .SETB(n28), .RSTB(n10), .CLK(
        clk), .Q(state[0]), .QN(n22) );
  DFFSSRX1_RVT current_state_reg_1_ ( .D(mem_read), .SETB(n4), .RSTB(n1), 
        .CLK(clk), .Q(state[1]), .QN(n21) );
  DFFSSRX1_RVT current_state_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(N22), .CLK(
        clk), .Q(state[2]), .QN(n28) );
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
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9,
         SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11,
         SYNOPSYS_UNCONNECTED_12;
  wire   [6:1] coin_value;
  wire   [6:0] price;
  wire   [4:0] stock;
  wire   [7:0] change;

  DFFSSRX1_RVT change_out_reg_5_ ( .D(1'b0), .SETB(n15), .RSTB(1'b1), .CLK(clk), .QN(change_out[5]) );
  INVX0_RVT U25 ( .A(sel_item[1]), .Y(n19) );
  INVX2_RVT U26 ( .A(n19), .Y(n20) );
  INVX0_RVT U27 ( .A(sel_item[0]), .Y(n21) );
  INVX2_RVT U28 ( .A(n21), .Y(n22) );
  INVX0_RVT U35 ( .A(coin_in[1]), .Y(n27) );
  NOR2X0_RVT U36 ( .A1(n27), .A2(coin_in[0]), .Y(coin_value[1]) );
  AND2X1_RVT U37 ( .A1(coin_in[0]), .A2(n27), .Y(coin_value[3]) );
  OR2X1_RVT U38 ( .A1(coin_value[1]), .A2(coin_value[3]), .Y(n18) );
  AND2X1_RVT U39 ( .A1(coin_in[0]), .A2(coin_in[1]), .Y(coin_value[6]) );
  INVX0_RVT U42 ( .A(state_out[1]), .Y(n28) );
  NAND3X0_RVT U43 ( .A1(state_out[0]), .A2(state_out[2]), .A3(n28), .Y(n30) );
  INVX0_RVT U44 ( .A(n30), .Y(n29) );
  INVX0_RVT U45 ( .A(rst), .Y(n32) );
  OA221X1_RVT U46 ( .A1(cancel), .A2(change_load), .A3(cancel), .A4(n29), .A5(
        n32), .Y(n35) );
  NOR3X0_RVT U47 ( .A1(rst), .A2(cancel), .A3(change_load), .Y(n33) );
  INVX0_RVT U48 ( .A(cancel), .Y(n31) );
  AND4X1_RVT U49 ( .A1(change_load), .A2(n32), .A3(n31), .A4(n30), .Y(n34) );
  AO222X1_RVT U50 ( .A1(n35), .A2(display[7]), .A3(n33), .A4(change_out[7]), 
        .A5(n34), .A6(change[7]), .Y(n17) );
  AO222X1_RVT U51 ( .A1(n35), .A2(display[6]), .A3(n34), .A4(change[6]), .A5(
        change_out[6]), .A6(n33), .Y(n16) );
  AO222X1_RVT U52 ( .A1(n35), .A2(display[5]), .A3(n34), .A4(change[5]), .A5(
        change_out[5]), .A6(n33), .Y(n15) );
  AO222X1_RVT U53 ( .A1(n35), .A2(display[4]), .A3(n34), .A4(change[4]), .A5(
        change_out[4]), .A6(n33), .Y(n14) );
  AO222X1_RVT U54 ( .A1(n35), .A2(display[3]), .A3(n34), .A4(change[3]), .A5(
        change_out[3]), .A6(n33), .Y(n13) );
  AO222X1_RVT U55 ( .A1(n35), .A2(display[2]), .A3(n34), .A4(change[2]), .A5(
        change_out[2]), .A6(n33), .Y(n12) );
  AO222X1_RVT U56 ( .A1(n35), .A2(display[1]), .A3(n34), .A4(change[1]), .A5(
        change_out[1]), .A6(n33), .Y(n11) );
  AO222X1_RVT U57 ( .A1(n35), .A2(display[0]), .A3(n34), .A4(change[0]), .A5(
        change_out[0]), .A6(n33), .Y(n10) );
  credit_reg u_credit_reg ( .clk(clk), .rst(rst), .cancel(cancel), .clear(
        credit_clear), .load(credit_load), .coin_value({SYNOPSYS_UNCONNECTED_1, 
        coin_value[6], coin_in[1], n18, coin_value[3], SYNOPSYS_UNCONNECTED_2, 
        coin_value[1], SYNOPSYS_UNCONNECTED_3}), .credit(display) );
  memory u_memory ( .clk(clk), .rst(rst), .mem_read(mem_read), .mem_write(
        mem_write), .addr({n20, n22}), .price({SYNOPSYS_UNCONNECTED_4, price}), 
        .stock({SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, 
        SYNOPSYS_UNCONNECTED_7, stock}) );
  comparator u_comparator ( .credit(display), .price({SYNOPSYS_UNCONNECTED_8, 
        price}), .stock({SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11, stock}), .can_sell(can_sell) );
  subtractor u_subtractor ( .credit(display), .price({SYNOPSYS_UNCONNECTED_12, 
        price}), .change(change) );
  control_unit u_control_unit ( .clk(clk), .rst(rst), .cancel(cancel), 
        .coin_in(coin_in), .confirm(confirm), .can_sell(can_sell), .state(
        state_out), .credit_load(credit_load), .credit_clear(credit_clear), 
        .mem_read(mem_read), .mem_write(mem_write), .dispense(dispense), 
        .error(error), .change_load(change_load) );
  DFFSSRX1_RVT change_out_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n10), .CLK(clk), .Q(change_out[0]) );
  DFFSSRX1_RVT change_out_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n11), .CLK(clk), .Q(change_out[1]) );
  DFFSSRX1_RVT change_out_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n12), .CLK(clk), .Q(change_out[2]) );
  DFFSSRX1_RVT change_out_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n13), .CLK(clk), .Q(change_out[3]) );
  DFFSSRX1_RVT change_out_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n14), .CLK(clk), .Q(change_out[4]) );
  DFFSSRX1_RVT change_out_reg_7_ ( .D(1'b0), .SETB(1'b0), .RSTB(n17), .CLK(clk), .Q(change_out[7]) );
  DFFSSRX1_RVT change_out_reg_6_ ( .D(1'b0), .SETB(1'b0), .RSTB(n16), .CLK(clk), .Q(change_out[6]) );
endmodule

