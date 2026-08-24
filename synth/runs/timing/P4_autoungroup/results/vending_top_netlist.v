/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri Aug 21 14:55:58 2026
/////////////////////////////////////////////////////////////


module vending_top ( clk, rst, coin_in, sel_item, confirm, cancel, dispense, 
        change_out, error, display, state_out );
  input [1:0] coin_in;
  input [1:0] sel_item;
  output [7:0] change_out;
  output [7:0] display;
  output [2:0] state_out;
  input clk, rst, confirm, cancel;
  output dispense, error;
  wire   u_control_unit_N21, u_control_unit_N20, u_control_unit_check_wait,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n91, n92, n93, n94, n95, n96, n97, n98, n99, n101, n102,
         n106, n107, n108, n109, n110, n111, n114, n115, n116, n117, n118,
         n119, n122, n123, n124, n126, n127, n130, n131, n132, n133, n134,
         n135, n136, intadd_8_CI, intadd_8_SUM_4_, intadd_8_SUM_3_,
         intadd_8_SUM_2_, intadd_8_SUM_1_, intadd_8_SUM_0_, intadd_8_n5,
         intadd_8_n4, intadd_8_n3, intadd_8_n2, intadd_8_n1, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n162, n163, n164, n165, n166, n167, n172, n173, n174, n175, n177,
         n178, n180, n181, n183, n184, n185, n186, n187, n188, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n274, n275, n277, n278, n279, n280, n281, n282, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n300, n301, n302, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n335, n337, n338, n339, n340, n341, n342, n343, n344, n345,
         n346, n347, n348, n349, n350, n351, n352, n353, n354, n355, n358,
         n359, n360, n361, n362, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n459, n460, n461, n462, n463, n464, n465, n466, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488;
  wire   [6:1] price;
  wire   [5:0] stock;
  wire   [14:0] u_memory_mem;

  DFFX1_RVT u_memory_mem_reg_3__1_ ( .D(n134), .CLK(clk), .Q(u_memory_mem[0]), 
        .QN(n444) );
  DFFX1_RVT u_memory_mem_reg_3__0_ ( .D(n135), .CLK(clk), .Q(n198), .QN(n440)
         );
  DFFX1_RVT u_memory_mem_reg_3__2_ ( .D(n133), .CLK(clk), .Q(n235) );
  DFFX1_RVT u_memory_mem_reg_3__3_ ( .D(n132), .CLK(clk), .QN(n443) );
  DFFX1_RVT u_memory_mem_reg_3__4_ ( .D(n131), .CLK(clk), .QN(n446) );
  DFFX1_RVT u_memory_mem_reg_3__5_ ( .D(n130), .CLK(clk), .QN(n448) );
  DFFX1_RVT u_memory_mem_reg_2__0_ ( .D(n127), .CLK(clk), .Q(u_memory_mem[1]), 
        .QN(n426) );
  DFFX1_RVT u_memory_mem_reg_2__1_ ( .D(n126), .CLK(clk), .Q(u_memory_mem[2]), 
        .QN(n430) );
  DFFX1_RVT u_memory_mem_reg_1__0_ ( .D(n119), .CLK(clk), .Q(u_memory_mem[5])
         );
  DFFX1_RVT u_memory_mem_reg_0__0_ ( .D(n111), .CLK(clk), .Q(u_memory_mem[11]), 
        .QN(n425) );
  DFFX1_RVT u_credit_reg_credit_reg_1_ ( .D(n88), .CLK(clk), .Q(display[1]) );
  DFFX1_RVT u_credit_reg_credit_reg_0_ ( .D(n87), .CLK(clk), .Q(display[0]) );
  DFFX1_RVT u_credit_reg_credit_reg_2_ ( .D(n86), .CLK(clk), .Q(display[2]) );
  DFFX1_RVT u_credit_reg_credit_reg_3_ ( .D(n85), .CLK(clk), .Q(display[3]) );
  DFFX1_RVT u_credit_reg_credit_reg_4_ ( .D(n84), .CLK(clk), .Q(display[4]) );
  DFFX1_RVT u_credit_reg_credit_reg_5_ ( .D(n83), .CLK(clk), .Q(display[5]) );
  DFFX1_RVT u_credit_reg_credit_reg_6_ ( .D(n82), .CLK(clk), .Q(display[6]), 
        .QN(n455) );
  DFFX1_RVT u_credit_reg_credit_reg_7_ ( .D(n81), .CLK(clk), .Q(display[7]), 
        .QN(n456) );
  DFFX1_RVT change_out_reg_0_ ( .D(n80), .CLK(clk), .Q(change_out[0]) );
  DFFX1_RVT change_out_reg_1_ ( .D(n79), .CLK(clk), .Q(change_out[1]) );
  DFFX1_RVT change_out_reg_2_ ( .D(n78), .CLK(clk), .Q(change_out[2]) );
  DFFX1_RVT change_out_reg_3_ ( .D(n77), .CLK(clk), .Q(change_out[3]) );
  DFFX1_RVT change_out_reg_4_ ( .D(n76), .CLK(clk), .Q(change_out[4]) );
  DFFX1_RVT change_out_reg_5_ ( .D(n75), .CLK(clk), .Q(change_out[5]) );
  DFFX1_RVT change_out_reg_6_ ( .D(n74), .CLK(clk), .Q(change_out[6]) );
  DFFX1_RVT change_out_reg_7_ ( .D(n73), .CLK(clk), .Q(change_out[7]) );
  DFFX1_RVT u_memory_stock_reg_2_ ( .D(n94), .CLK(clk), .Q(stock[2]) );
  FADDX1_RVT intadd_8_U6 ( .A(display[2]), .B(n437), .CI(intadd_8_CI), .CO(
        intadd_8_n5), .S(intadd_8_SUM_0_) );
  FADDX1_RVT intadd_8_U5 ( .A(display[3]), .B(n445), .CI(intadd_8_n5), .CO(
        intadd_8_n4), .S(intadd_8_SUM_1_) );
  FADDX1_RVT intadd_8_U4 ( .A(display[4]), .B(n447), .CI(intadd_8_n4), .CO(
        intadd_8_n3), .S(intadd_8_SUM_2_) );
  FADDX1_RVT intadd_8_U3 ( .A(display[5]), .B(n449), .CI(intadd_8_n3), .CO(
        intadd_8_n2), .S(intadd_8_SUM_3_) );
  FADDX1_RVT intadd_8_U2 ( .A(display[6]), .B(n451), .CI(intadd_8_n2), .CO(
        intadd_8_n1), .S(intadd_8_SUM_4_) );
  DFFSSRX1_RVT u_memory_price_reg_3_ ( .D(1'b0), .SETB(n465), .RSTB(n232), 
        .CLK(clk), .Q(n445) );
  DFFSSRX1_RVT u_memory_price_reg_0_ ( .D(1'b0), .SETB(n465), .RSTB(n233), 
        .CLK(clk), .Q(n435) );
  DFFSSRX1_RVT u_memory_stock_reg_3_ ( .D(1'b0), .SETB(n93), .RSTB(1'b1), 
        .CLK(clk), .QN(stock[3]) );
  DFFSSRX1_RVT u_control_unit_current_state_reg_2_ ( .D(n466), .SETB(n463), 
        .RSTB(1'b1), .CLK(clk), .Q(n450), .QN(state_out[2]) );
  DFFARX1_RVT u_memory_stock_reg_0_ ( .D(n96), .CLK(clk), .RSTB(1'b1), .Q(
        stock[0]), .QN(n434) );
  DFFARX1_RVT u_memory_stock_reg_5_ ( .D(n91), .CLK(clk), .RSTB(1'b1), .Q(
        stock[5]), .QN(n433) );
  DFFARX1_RVT u_memory_stock_reg_4_ ( .D(n92), .CLK(clk), .RSTB(1'b1), .Q(
        stock[4]), .QN(n453) );
  DFFARX1_RVT u_memory_stock_reg_1_ ( .D(n95), .CLK(clk), .RSTB(1'b1), .Q(
        stock[1]), .QN(n454) );
  DFFARX1_RVT u_memory_price_reg_2_ ( .D(n101), .CLK(clk), .RSTB(1'b1), .Q(
        price[2]), .QN(n437) );
  DFFARX1_RVT u_memory_price_reg_5_ ( .D(n98), .CLK(clk), .RSTB(1'b1), .Q(
        price[5]), .QN(n449) );
  DFFARX1_RVT u_memory_price_reg_6_ ( .D(n97), .CLK(clk), .RSTB(1'b1), .Q(
        price[6]), .QN(n451) );
  DFFARX1_RVT u_memory_price_reg_4_ ( .D(n99), .CLK(clk), .RSTB(1'b1), .Q(
        price[4]), .QN(n447) );
  DFFARX1_RVT u_memory_price_reg_1_ ( .D(n102), .CLK(clk), .RSTB(1'b1), .Q(
        price[1]), .QN(n436) );
  DFFARX1_RVT u_control_unit_current_state_reg_0_ ( .D(u_control_unit_N20), 
        .CLK(clk), .RSTB(1'b1), .Q(state_out[0]), .QN(n432) );
  DFFARX1_RVT u_control_unit_check_wait_reg ( .D(n136), .CLK(clk), .RSTB(1'b1), 
        .Q(u_control_unit_check_wait), .QN(n452) );
  DFFARX1_RVT u_control_unit_current_state_reg_1_ ( .D(u_control_unit_N21), 
        .CLK(clk), .RSTB(1'b1), .Q(state_out[1]), .QN(n431) );
  DFFX1_RVT u_memory_mem_reg_2__2_ ( .D(n464), .CLK(clk), .Q(n442) );
  DFFX1_RVT u_memory_mem_reg_0__4_ ( .D(n107), .CLK(clk), .Q(u_memory_mem[13]), 
        .QN(n461) );
  DFFX1_RVT u_memory_mem_reg_0__3_ ( .D(n108), .CLK(clk), .QN(n427) );
  DFFX1_RVT u_memory_mem_reg_0__1_ ( .D(n110), .CLK(clk), .QN(n429) );
  DFFX1_RVT u_memory_mem_reg_0__5_ ( .D(n106), .CLK(clk), .Q(u_memory_mem[14]), 
        .QN(n462) );
  DFFX1_RVT u_memory_mem_reg_1__2_ ( .D(n117), .CLK(clk), .Q(u_memory_mem[7]), 
        .QN(n438) );
  DFFX1_RVT u_memory_mem_reg_0__2_ ( .D(n109), .CLK(clk), .Q(u_memory_mem[12]), 
        .QN(n441) );
  DFFX1_RVT u_memory_mem_reg_2__4_ ( .D(n123), .CLK(clk), .Q(u_memory_mem[3])
         );
  DFFX1_RVT u_memory_mem_reg_2__3_ ( .D(n124), .CLK(clk), .Q(n468), .QN(n428)
         );
  DFFX1_RVT u_memory_mem_reg_2__5_ ( .D(n122), .CLK(clk), .Q(u_memory_mem[4]), 
        .QN(n459) );
  DFFX1_RVT u_memory_mem_reg_1__1_ ( .D(n118), .CLK(clk), .Q(u_memory_mem[6]), 
        .QN(n460) );
  DFFX1_RVT u_memory_mem_reg_1__4_ ( .D(n115), .CLK(clk), .Q(u_memory_mem[9])
         );
  DFFX1_RVT u_memory_mem_reg_1__3_ ( .D(n116), .CLK(clk), .Q(u_memory_mem[8])
         );
  DFFX1_RVT u_memory_mem_reg_1__5_ ( .D(n114), .CLK(clk), .Q(u_memory_mem[10])
         );
  INVX1_RVT U157 ( .A(n297), .Y(n337) );
  OR2X2_RVT U158 ( .A1(n153), .A2(n152), .Y(n365) );
  INVX0_RVT U159 ( .A(n147), .Y(n386) );
  OR2X2_RVT U161 ( .A1(n187), .A2(n165), .Y(n266) );
  AOI21X1_RVT U162 ( .A1(n391), .A2(n180), .A3(n260), .Y(n355) );
  NAND2X0_RVT U163 ( .A1(n147), .A2(n469), .Y(n218) );
  AND2X1_RVT U164 ( .A1(n195), .A2(n389), .Y(n147) );
  NBUFFX2_RVT U166 ( .A(sel_item[1]), .Y(n214) );
  NOR2X0_RVT U168 ( .A1(n231), .A2(n163), .Y(n148) );
  NAND2X0_RVT U169 ( .A1(n148), .A2(n172), .Y(n149) );
  NBUFFX2_RVT U170 ( .A(n195), .Y(n172) );
  NBUFFX2_RVT U171 ( .A(n332), .Y(n150) );
  INVX0_RVT U172 ( .A(coin_in[1]), .Y(n330) );
  OR2X1_RVT U173 ( .A1(n366), .A2(n367), .Y(n135) );
  OR2X2_RVT U175 ( .A1(n211), .A2(n253), .Y(n206) );
  NOR3X0_RVT U176 ( .A1(n441), .A2(n195), .A3(n214), .Y(n252) );
  NOR2X0_RVT U177 ( .A1(rst), .A2(n205), .Y(n158) );
  NOR4X1_RVT U179 ( .A1(n205), .A2(n183), .A3(n207), .A4(n206), .Y(n151) );
  OR2X1_RVT U180 ( .A1(n352), .A2(n351), .Y(n132) );
  AO21X1_RVT U182 ( .A1(n375), .A2(n197), .A3(rst), .Y(n152) );
  NOR4X1_RVT U183 ( .A1(n207), .A2(n178), .A3(n205), .A4(n206), .Y(n153) );
  OR3X1_RVT U184 ( .A1(n480), .A2(n212), .A3(n173), .Y(n180) );
  NOR4X1_RVT U186 ( .A1(n480), .A2(n391), .A3(n212), .A4(n173), .Y(n260) );
  OR2X2_RVT U187 ( .A1(rst), .A2(n341), .Y(n358) );
  NBUFFX2_RVT U188 ( .A(n319), .Y(n154) );
  NOR2X0_RVT U190 ( .A1(n207), .A2(n206), .Y(n157) );
  INVX1_RVT U191 ( .A(n173), .Y(n155) );
  INVX0_RVT U192 ( .A(n263), .Y(n156) );
  OA21X1_RVT U193 ( .A1(n156), .A2(n155), .A3(n180), .Y(n350) );
  AOI22X1_RVT U194 ( .A1(n197), .A2(n375), .A3(n158), .A4(n157), .Y(n203) );
  NOR2X0_RVT U195 ( .A1(n442), .A2(sel_item[0]), .Y(n193) );
  OA22X1_RVT U196 ( .A1(n217), .A2(n194), .A3(n222), .A4(n387), .Y(n216) );
  OR2X2_RVT U197 ( .A1(n208), .A2(n261), .Y(n207) );
  AND2X1_RVT U198 ( .A1(u_memory_mem[8]), .A2(n255), .Y(n256) );
  AND2X1_RVT U199 ( .A1(n193), .A2(n214), .Y(n251) );
  NBUFFX2_RVT U201 ( .A(n345), .Y(n159) );
  AO22X1_RVT U202 ( .A1(n162), .A2(n268), .A3(n235), .A4(n160), .Y(n133) );
  INVX0_RVT U203 ( .A(n202), .Y(n160) );
  OR4X4_RVT U206 ( .A1(n245), .A2(n241), .A3(n244), .A4(n240), .Y(n205) );
  NBUFFX2_RVT U207 ( .A(n214), .Y(n163) );
  OR2X1_RVT U208 ( .A1(n425), .A2(n248), .Y(n221) );
  OR2X1_RVT U209 ( .A1(n429), .A2(n248), .Y(n220) );
  OR2X1_RVT U210 ( .A1(n164), .A2(n248), .Y(n219) );
  AND2X1_RVT U211 ( .A1(n425), .A2(n429), .Y(n164) );
  XNOR2X2_RVT U212 ( .A1(n177), .A2(n201), .Y(n181) );
  AO21X1_RVT U213 ( .A1(n162), .A2(n186), .A3(n361), .Y(n130) );
  NOR3X0_RVT U214 ( .A1(n167), .A2(n166), .A3(n205), .Y(n165) );
  OR3X1_RVT U215 ( .A1(n261), .A2(n208), .A3(n253), .Y(n166) );
  OR2X1_RVT U216 ( .A1(n211), .A2(rst), .Y(n167) );
  NBUFFX2_RVT U221 ( .A(n211), .Y(n173) );
  NAND2X0_RVT U222 ( .A1(u_memory_mem[8]), .A2(sel_item[0]), .Y(n191) );
  OR2X2_RVT U223 ( .A1(sel_item[1]), .A2(sel_item[0]), .Y(n248) );
  NBUFFX2_RVT U224 ( .A(n387), .Y(n174) );
  OR2X1_RVT U225 ( .A1(n459), .A2(n200), .Y(n213) );
  NAND2X0_RVT U226 ( .A1(n190), .A2(n175), .Y(n342) );
  AND2X1_RVT U227 ( .A1(n204), .A2(n148), .Y(n175) );
  AND2X2_RVT U228 ( .A1(coin_in[1]), .A2(coin_in[0]), .Y(n294) );
  OR4X2_RVT U231 ( .A1(n211), .A2(n391), .A3(n480), .A4(n212), .Y(n177) );
  INVX0_RVT U232 ( .A(n375), .Y(n178) );
  INVX0_RVT U235 ( .A(n342), .Y(n185) );
  INVX0_RVT U238 ( .A(n375), .Y(n183) );
  AND2X1_RVT U240 ( .A1(u_memory_mem[10]), .A2(n255), .Y(n184) );
  NOR2X0_RVT U241 ( .A1(n183), .A2(n188), .Y(n187) );
  NOR2X0_RVT U242 ( .A1(n231), .A2(n174), .Y(n188) );
  NOR2X0_RVT U245 ( .A1(n426), .A2(n174), .Y(n227) );
  NOR2X0_RVT U246 ( .A1(n430), .A2(n174), .Y(n224) );
  NAND2X0_RVT U249 ( .A1(sel_item[1]), .A2(sel_item[0]), .Y(n194) );
  NBUFFX2_RVT U250 ( .A(sel_item[0]), .Y(n195) );
  NOR2X0_RVT U252 ( .A1(n446), .A2(n194), .Y(n245) );
  OR3X1_RVT U255 ( .A1(n373), .A2(n466), .A3(n335), .Y(n297) );
  INVX0_RVT U257 ( .A(n282), .Y(n308) );
  INVX1_RVT U261 ( .A(n248), .Y(n243) );
  INVX1_RVT U262 ( .A(n294), .Y(n287) );
  OR2X2_RVT U263 ( .A1(n265), .A2(n264), .Y(n268) );
  INVX1_RVT U264 ( .A(n480), .Y(n262) );
  INVX0_RVT U265 ( .A(dispense), .Y(n231) );
  INVX0_RVT U266 ( .A(n220), .Y(n225) );
  INVX0_RVT U267 ( .A(n393), .Y(n370) );
  INVX0_RVT U268 ( .A(n400), .Y(n402) );
  INVX1_RVT U269 ( .A(n312), .Y(n323) );
  INVX0_RVT U271 ( .A(n268), .Y(n348) );
  INVX0_RVT U272 ( .A(n221), .Y(n228) );
  MUX21X1_RVT U273 ( .A1(u_memory_mem[7]), .A2(n347), .S0(n483), .Y(n117) );
  INVX0_RVT U274 ( .A(n383), .Y(n466) );
  OR2X2_RVT U275 ( .A1(n231), .A2(n194), .Y(n197) );
  AND2X1_RVT U277 ( .A1(n172), .A2(n375), .Y(n204) );
  AO22X1_RVT U279 ( .A1(n243), .A2(u_memory_mem[14]), .A3(u_memory_mem[4]), 
        .A4(n238), .Y(n242) );
  AO22X1_RVT U280 ( .A1(n243), .A2(u_memory_mem[13]), .A3(u_memory_mem[3]), 
        .A4(n238), .Y(n246) );
  AO22X1_RVT U281 ( .A1(n243), .A2(n210), .A3(n238), .A4(n209), .Y(n208) );
  OR2X1_RVT U282 ( .A1(u_memory_mem[4]), .A2(u_memory_mem[3]), .Y(n209) );
  OR2X1_RVT U283 ( .A1(u_memory_mem[14]), .A2(u_memory_mem[13]), .Y(n210) );
  NBUFFX2_RVT U286 ( .A(n261), .Y(n212) );
  NOR2X0_RVT U287 ( .A1(n214), .A2(n191), .Y(n247) );
  NAND2X0_RVT U288 ( .A1(n360), .A2(n213), .Y(n122) );
  OR3X1_RVT U289 ( .A1(n242), .A2(n241), .A3(n240), .Y(n392) );
  OR3X1_RVT U290 ( .A1(n479), .A2(n245), .A3(n246), .Y(n391) );
  OR2X1_RVT U291 ( .A1(n256), .A2(n257), .Y(n116) );
  OR2X1_RVT U292 ( .A1(n258), .A2(n259), .Y(n115) );
  AND2X1_RVT U293 ( .A1(u_memory_mem[9]), .A2(n255), .Y(n258) );
  OAI22X1_RVT U294 ( .A1(n343), .A2(n342), .A3(n460), .A4(n483), .Y(n118) );
  AO22X1_RVT U295 ( .A1(n198), .A2(n159), .A3(n192), .A4(u_memory_mem[5]), .Y(
        n226) );
  AO22X1_RVT U296 ( .A1(u_memory_mem[0]), .A2(n159), .A3(n192), .A4(
        u_memory_mem[6]), .Y(n223) );
  NAND3X0_RVT U297 ( .A1(n219), .A2(n218), .A3(n216), .Y(n261) );
  AND2X1_RVT U298 ( .A1(n440), .A2(n444), .Y(n217) );
  AND2X1_RVT U299 ( .A1(n426), .A2(n430), .Y(n222) );
  OR3X1_RVT U300 ( .A1(n228), .A2(n227), .A3(n226), .Y(n267) );
  OR3X1_RVT U301 ( .A1(n225), .A2(n224), .A3(n223), .Y(n338) );
  OAI22X1_RVT U302 ( .A1(n443), .A2(n194), .A3(n428), .A4(n387), .Y(n229) );
  NOR2X0_RVT U303 ( .A1(n427), .A2(n248), .Y(n230) );
  OR2X1_RVT U305 ( .A1(n349), .A2(n234), .Y(n124) );
  OR2X1_RVT U306 ( .A1(n354), .A2(n353), .Y(n123) );
  NOR2X0_RVT U307 ( .A1(n448), .A2(n203), .Y(n361) );
  NOR2X0_RVT U308 ( .A1(n440), .A2(n203), .Y(n367) );
  NOR2X0_RVT U310 ( .A1(n443), .A2(n203), .Y(n352) );
  NOR2X0_RVT U311 ( .A1(n267), .A2(n365), .Y(n366) );
  NOR2X0_RVT U313 ( .A1(n350), .A2(n365), .Y(n351) );
  OAI22X1_RVT U316 ( .A1(n358), .A2(n355), .A3(n461), .A4(n196), .Y(n107) );
  OAI22X1_RVT U317 ( .A1(n350), .A2(n358), .A3(n427), .A4(n196), .Y(n108) );
  OAI22X1_RVT U318 ( .A1(n358), .A2(n343), .A3(n429), .A4(n196), .Y(n110) );
  OAI22X1_RVT U319 ( .A1(n181), .A2(n358), .A3(n462), .A4(n196), .Y(n106) );
  OA22X1_RVT U320 ( .A1(n442), .A2(n200), .A3(n348), .A4(n359), .Y(n464) );
  NOR2X0_RVT U321 ( .A1(n355), .A2(n359), .Y(n353) );
  NOR2X0_RVT U322 ( .A1(n350), .A2(n359), .Y(n234) );
  OR2X1_RVT U323 ( .A1(n181), .A2(n359), .Y(n360) );
  NOR2X0_RVT U324 ( .A1(n172), .A2(n370), .Y(n465) );
  OR2X1_RVT U325 ( .A1(n445), .A2(n368), .Y(n232) );
  OR2X1_RVT U326 ( .A1(n435), .A2(n368), .Y(n233) );
  NOR2X0_RVT U327 ( .A1(n339), .A2(n262), .Y(n265) );
  NOR2X0_RVT U328 ( .A1(n448), .A2(n194), .Y(n241) );
  AND3X1_RVT U346 ( .A1(state_out[1]), .A2(n432), .A3(n450), .Y(n385) );
  NAND2X0_RVT U347 ( .A1(n385), .A2(n452), .Y(n236) );
  NAND2X0_RVT U348 ( .A1(n375), .A2(n236), .Y(n368) );
  OR2X1_RVT U351 ( .A1(n431), .A2(state_out[2]), .Y(n237) );
  NOR2X0_RVT U352 ( .A1(n237), .A2(n432), .Y(dispense) );
  INVX0_RVT U353 ( .A(sel_item[1]), .Y(n389) );
  OR2X2_RVT U354 ( .A1(sel_item[0]), .A2(n389), .Y(n387) );
  AND2X1_RVT U355 ( .A1(sel_item[1]), .A2(sel_item[0]), .Y(n345) );
  AND2X1_RVT U357 ( .A1(u_memory_mem[10]), .A2(n192), .Y(n240) );
  AND2X1_RVT U358 ( .A1(u_memory_mem[9]), .A2(n192), .Y(n244) );
  AND2X1_RVT U359 ( .A1(n235), .A2(n345), .Y(n250) );
  NOR2X0_RVT U362 ( .A1(n350), .A2(n342), .Y(n257) );
  NOR2X0_RVT U363 ( .A1(n355), .A2(n342), .Y(n259) );
  AND3X1_RVT U364 ( .A1(state_out[0]), .A2(state_out[2]), .A3(n431), .Y(error)
         );
  NOR2X0_RVT U365 ( .A1(rst), .A2(cancel), .Y(n383) );
  INVX0_RVT U367 ( .A(n263), .Y(n264) );
  OR2X1_RVT U368 ( .A1(rst), .A2(n369), .Y(n364) );
  OR2X1_RVT U369 ( .A1(rst), .A2(n268), .Y(n347) );
  OR2X1_RVT U370 ( .A1(stock[2]), .A2(stock[3]), .Y(n271) );
  AND2X1_RVT U371 ( .A1(n433), .A2(n453), .Y(n269) );
  NAND3X0_RVT U372 ( .A1(n454), .A2(n434), .A3(n269), .Y(n270) );
  OAI22X1_RVT U373 ( .A1(display[7]), .A2(intadd_8_n1), .A3(n271), .A4(n270), 
        .Y(n379) );
  AND4X1_RVT U374 ( .A1(state_out[1]), .A2(u_control_unit_check_wait), .A3(
        n450), .A4(n379), .Y(n272) );
  OR3X1_RVT U375 ( .A1(dispense), .A2(error), .A3(n272), .Y(n463) );
  INVX0_RVT U378 ( .A(error), .Y(n275) );
  NAND2X0_RVT U379 ( .A1(u_control_unit_check_wait), .A2(n385), .Y(n274) );
  AND3X1_RVT U380 ( .A1(n470), .A2(n275), .A3(n274), .Y(n277) );
  NOR2X0_RVT U381 ( .A1(n466), .A2(n277), .Y(n281) );
  OR2X1_RVT U382 ( .A1(n481), .A2(n486), .Y(n279) );
  AND2X1_RVT U383 ( .A1(n450), .A2(n431), .Y(n278) );
  NAND3X0_RVT U384 ( .A1(n383), .A2(n279), .A3(n278), .Y(n296) );
  NOR2X0_RVT U385 ( .A1(state_out[0]), .A2(n296), .Y(n280) );
  OR2X1_RVT U386 ( .A1(n281), .A2(n280), .Y(u_control_unit_N20) );
  AND2X1_RVT U387 ( .A1(n375), .A2(n368), .Y(n393) );
  OR2X1_RVT U388 ( .A1(n450), .A2(state_out[1]), .Y(n382) );
  NOR2X0_RVT U389 ( .A1(state_out[0]), .A2(n382), .Y(n373) );
  INVX1_RVT U390 ( .A(n296), .Y(n335) );
  NOR2X0_RVT U391 ( .A1(display[4]), .A2(n287), .Y(n282) );
  NAND2X0_RVT U393 ( .A1(n308), .A2(n487), .Y(n290) );
  NAND2X0_RVT U394 ( .A1(n330), .A2(display[0]), .Y(n332) );
  INVX1_RVT U395 ( .A(coin_in[0]), .Y(n284) );
  NOR2X0_RVT U396 ( .A1(display[1]), .A2(n284), .Y(n325) );
  NAND2X0_RVT U397 ( .A1(n284), .A2(display[1]), .Y(n326) );
  NOR2X0_RVT U398 ( .A1(display[2]), .A2(n294), .Y(n319) );
  NOR2X0_RVT U399 ( .A1(display[3]), .A2(n330), .Y(n313) );
  NOR2X0_RVT U400 ( .A1(n319), .A2(n313), .Y(n286) );
  NAND2X0_RVT U401 ( .A1(n294), .A2(display[2]), .Y(n320) );
  NAND2X0_RVT U402 ( .A1(n330), .A2(display[3]), .Y(n314) );
  OAI21X1_RVT U403 ( .A1(n320), .A2(n313), .A3(n314), .Y(n285) );
  AOI21X1_RVT U404 ( .A1(n312), .A2(n286), .A3(n285), .Y(n300) );
  NAND2X0_RVT U405 ( .A1(n287), .A2(display[4]), .Y(n307) );
  INVX0_RVT U406 ( .A(n307), .Y(n301) );
  NAND2X0_RVT U407 ( .A1(n486), .A2(display[5]), .Y(n302) );
  INVX0_RVT U408 ( .A(n302), .Y(n288) );
  AOI21X1_RVT U409 ( .A1(n301), .A2(n487), .A3(n288), .Y(n289) );
  OAI21X2_RVT U410 ( .A1(n290), .A2(n300), .A3(n289), .Y(n293) );
  XOR2X1_RVT U411 ( .A1(n291), .A2(display[7]), .Y(n292) );
  AO22X1_RVT U412 ( .A1(n337), .A2(display[7]), .A3(n292), .A4(n335), .Y(n81)
         );
  FADDX1_RVT U413 ( .A(display[6]), .B(n294), .CI(n293), .CO(n291), .S(n295)
         );
  AOI21X1_RVT U415 ( .A1(n310), .A2(n308), .A3(n301), .Y(n305) );
  NAND2X0_RVT U416 ( .A1(n487), .A2(n302), .Y(n304) );
  AO22X1_RVT U417 ( .A1(n337), .A2(display[5]), .A3(n306), .A4(n335), .Y(n83)
         );
  NAND2X0_RVT U418 ( .A1(n308), .A2(n307), .Y(n309) );
  XNOR2X1_RVT U419 ( .A1(n310), .A2(n309), .Y(n311) );
  AO22X1_RVT U420 ( .A1(n337), .A2(display[4]), .A3(n311), .A4(n335), .Y(n84)
         );
  OAI21X1_RVT U421 ( .A1(n154), .A2(n323), .A3(n320), .Y(n317) );
  INVX0_RVT U422 ( .A(n313), .Y(n315) );
  NAND2X0_RVT U423 ( .A1(n315), .A2(n314), .Y(n316) );
  XNOR2X1_RVT U424 ( .A1(n317), .A2(n316), .Y(n318) );
  AO22X1_RVT U425 ( .A1(n337), .A2(display[3]), .A3(n318), .A4(n335), .Y(n85)
         );
  INVX0_RVT U426 ( .A(n154), .Y(n321) );
  NAND2X0_RVT U427 ( .A1(n321), .A2(n320), .Y(n322) );
  XOR2X1_RVT U428 ( .A1(n323), .A2(n322), .Y(n324) );
  AO22X1_RVT U429 ( .A1(n337), .A2(display[2]), .A3(n324), .A4(n335), .Y(n86)
         );
  INVX0_RVT U430 ( .A(n325), .Y(n327) );
  NAND2X0_RVT U431 ( .A1(n327), .A2(n326), .Y(n328) );
  XOR2X1_RVT U432 ( .A1(n150), .A2(n328), .Y(n329) );
  AO22X1_RVT U433 ( .A1(n337), .A2(display[1]), .A3(n329), .A4(n335), .Y(n88)
         );
  NOR2X0_RVT U434 ( .A1(display[0]), .A2(n330), .Y(n331) );
  INVX0_RVT U435 ( .A(n331), .Y(n333) );
  AO22X1_RVT U438 ( .A1(n337), .A2(display[0]), .A3(n488), .A4(n335), .Y(n87)
         );
  AND2X1_RVT U439 ( .A1(n267), .A2(n338), .Y(n340) );
  NOR2X0_RVT U440 ( .A1(n340), .A2(n339), .Y(n343) );
  INVX0_RVT U442 ( .A(n343), .Y(n344) );
  OR2X1_RVT U443 ( .A1(n344), .A2(rst), .Y(n346) );
  MUX21X1_RVT U445 ( .A1(u_memory_mem[0]), .A2(n346), .S0(n202), .Y(n134) );
  MUX21X1_RVT U446 ( .A1(u_memory_mem[12]), .A2(n347), .S0(n362), .Y(n109) );
  MUX21X1_RVT U447 ( .A1(u_memory_mem[11]), .A2(n364), .S0(n362), .Y(n111) );
  MUX21X1_RVT U448 ( .A1(u_memory_mem[1]), .A2(n364), .S0(n200), .Y(n127) );
  INVX0_RVT U449 ( .A(n368), .Y(n394) );
  NOR2X0_RVT U450 ( .A1(n370), .A2(n369), .Y(n371) );
  AO21X1_RVT U451 ( .A1(n394), .A2(stock[0]), .A3(n371), .Y(n96) );
  OR2X1_RVT U452 ( .A1(n435), .A2(display[0]), .Y(n395) );
  OR2X1_RVT U453 ( .A1(n395), .A2(display[1]), .Y(n372) );
  AO22X1_RVT U454 ( .A1(display[1]), .A2(n395), .A3(n372), .A4(n436), .Y(
        intadd_8_CI) );
  INVX0_RVT U455 ( .A(n373), .Y(n374) );
  NOR2X0_RVT U456 ( .A1(n374), .A2(n466), .Y(n405) );
  AND2X1_RVT U457 ( .A1(n383), .A2(n382), .Y(n407) );
  AND2X1_RVT U458 ( .A1(change_out[6]), .A2(n407), .Y(n377) );
  OA21X1_RVT U459 ( .A1(cancel), .A2(error), .A3(n375), .Y(n400) );
  NOR2X0_RVT U460 ( .A1(n455), .A2(n402), .Y(n376) );
  OR2X1_RVT U461 ( .A1(n377), .A2(n376), .Y(n378) );
  AO21X1_RVT U462 ( .A1(n405), .A2(intadd_8_SUM_4_), .A3(n378), .Y(n74) );
  AND4X1_RVT U463 ( .A1(state_out[0]), .A2(confirm), .A3(n450), .A4(n431), .Y(
        n381) );
  NAND2X0_RVT U464 ( .A1(u_control_unit_check_wait), .A2(n379), .Y(n380) );
  OA221X1_RVT U465 ( .A1(n381), .A2(n385), .A3(n381), .A4(n380), .A5(n383), 
        .Y(u_control_unit_N21) );
  NAND2X0_RVT U466 ( .A1(n231), .A2(n382), .Y(n384) );
  OA221X1_RVT U467 ( .A1(u_control_unit_check_wait), .A2(n385), .A3(n452), 
        .A4(n384), .A5(n383), .Y(n136) );
  NAND2X0_RVT U468 ( .A1(n174), .A2(n386), .Y(n388) );
  AO22X1_RVT U469 ( .A1(n394), .A2(price[1]), .A3(n393), .A4(n388), .Y(n102)
         );
  AO22X1_RVT U470 ( .A1(n393), .A2(n159), .A3(n394), .A4(price[2]), .Y(n101)
         );
  AO22X1_RVT U471 ( .A1(n172), .A2(n393), .A3(n394), .A4(price[5]), .Y(n98) );
  AO22X1_RVT U472 ( .A1(n163), .A2(n393), .A3(n394), .A4(price[6]), .Y(n97) );
  AO22X1_RVT U473 ( .A1(n394), .A2(stock[1]), .A3(n393), .A4(n338), .Y(n95) );
  AO22X1_RVT U474 ( .A1(n394), .A2(stock[2]), .A3(n480), .A4(n393), .Y(n94) );
  AO22X1_RVT U475 ( .A1(n394), .A2(stock[3]), .A3(n173), .A4(n393), .Y(n93) );
  AO22X1_RVT U476 ( .A1(n394), .A2(stock[4]), .A3(n393), .A4(n391), .Y(n92) );
  AO22X1_RVT U477 ( .A1(n394), .A2(stock[5]), .A3(n393), .A4(n392), .Y(n91) );
  AO21X1_RVT U478 ( .A1(n405), .A2(n435), .A3(n400), .Y(n396) );
  INVX0_RVT U479 ( .A(n395), .Y(n397) );
  AO222X1_RVT U480 ( .A1(n396), .A2(display[0]), .A3(n407), .A4(change_out[0]), 
        .A5(n405), .A6(n397), .Y(n80) );
  FADDX1_RVT U481 ( .A(price[1]), .B(n397), .CI(display[1]), .S(n398) );
  AO22X1_RVT U482 ( .A1(n405), .A2(n398), .A3(n407), .A4(change_out[1]), .Y(
        n399) );
  AO21X1_RVT U483 ( .A1(n400), .A2(display[1]), .A3(n399), .Y(n79) );
  AO222X1_RVT U484 ( .A1(n400), .A2(display[2]), .A3(n407), .A4(change_out[2]), 
        .A5(intadd_8_SUM_0_), .A6(n405), .Y(n78) );
  AO222X1_RVT U485 ( .A1(n400), .A2(display[3]), .A3(n407), .A4(change_out[3]), 
        .A5(intadd_8_SUM_1_), .A6(n405), .Y(n77) );
  AO222X1_RVT U486 ( .A1(n400), .A2(display[4]), .A3(n407), .A4(change_out[4]), 
        .A5(intadd_8_SUM_2_), .A6(n405), .Y(n76) );
  AO222X1_RVT U487 ( .A1(n400), .A2(display[5]), .A3(n407), .A4(change_out[5]), 
        .A5(intadd_8_SUM_3_), .A6(n405), .Y(n75) );
  INVX0_RVT U488 ( .A(intadd_8_n1), .Y(n401) );
  XOR2X1_RVT U489 ( .A1(display[7]), .A2(n401), .Y(n404) );
  NOR2X0_RVT U490 ( .A1(n456), .A2(n402), .Y(n403) );
  AO21X1_RVT U491 ( .A1(n405), .A2(n404), .A3(n403), .Y(n406) );
  AO21X1_RVT U492 ( .A1(n407), .A2(change_out[7]), .A3(n406), .Y(n73) );
  OAI21X1_RVT U165 ( .A1(n332), .A2(n325), .A3(n326), .Y(n312) );
  OR4X1_RVT U160 ( .A1(n252), .A2(n250), .A3(n249), .A4(n251), .Y(n480) );
  XOR2X1_RVT U167 ( .A1(n305), .A2(n304), .Y(n306) );
  INVX0_RVT U174 ( .A(n365), .Y(n162) );
  OR3X2_RVT U178 ( .A1(n247), .A2(n229), .A3(n230), .Y(n211) );
  INVX0_RVT U181 ( .A(n341), .Y(n362) );
  INVX0_RVT U185 ( .A(sel_item[0]), .Y(n239) );
  INVX0_RVT U189 ( .A(n212), .Y(n339) );
  OR4X2_RVT U200 ( .A1(n252), .A2(n250), .A3(n249), .A4(n251), .Y(n253) );
  INVX0_RVT U204 ( .A(n178), .Y(n485) );
  INVX0_RVT U205 ( .A(n392), .Y(n201) );
  INVX0_RVT U217 ( .A(rst), .Y(n375) );
  INVX0_RVT U218 ( .A(n300), .Y(n310) );
  INVX0_RVT U219 ( .A(n267), .Y(n369) );
  OR2X1_RVT U220 ( .A1(u_memory_mem[5]), .A2(u_memory_mem[6]), .Y(n469) );
  OR3X1_RVT U229 ( .A1(state_out[1]), .A2(confirm), .A3(n432), .Y(n470) );
  NAND2X0_RVT U230 ( .A1(n148), .A2(n239), .Y(n471) );
  OR2X1_RVT U233 ( .A1(n355), .A2(n365), .Y(n476) );
  OA22X1_RVT U234 ( .A1(n472), .A2(rst), .A3(n473), .A4(n474), .Y(n202) );
  INVX0_RVT U236 ( .A(n197), .Y(n472) );
  OR2X1_RVT U237 ( .A1(rst), .A2(n205), .Y(n473) );
  OR2X1_RVT U239 ( .A1(n207), .A2(n206), .Y(n474) );
  NAND2X0_RVT U243 ( .A1(n475), .A2(n476), .Y(n131) );
  OR2X1_RVT U244 ( .A1(n446), .A2(n202), .Y(n475) );
  OR2X1_RVT U247 ( .A1(n480), .A2(n212), .Y(n263) );
  NAND2X0_RVT U248 ( .A1(n477), .A2(n478), .Y(n82) );
  OR2X1_RVT U251 ( .A1(n455), .A2(n297), .Y(n477) );
  NAND2X0_RVT U253 ( .A1(n295), .A2(n335), .Y(n478) );
  AND2X1_RVT U254 ( .A1(u_memory_mem[9]), .A2(n192), .Y(n479) );
  MUX21X1_RVT U256 ( .A1(n346), .A2(u_memory_mem[2]), .S0(n266), .Y(n126) );
  INVX1_RVT U258 ( .A(n266), .Y(n200) );
  AND2X1_RVT U259 ( .A1(u_memory_mem[3]), .A2(n266), .Y(n354) );
  INVX0_RVT U260 ( .A(n341), .Y(n196) );
  AO22X1_RVT U270 ( .A1(price[4]), .A2(n394), .A3(n389), .A4(n393), .Y(n99) );
  INVX0_RVT U276 ( .A(n387), .Y(n238) );
  NOR2X2_RVT U278 ( .A1(n214), .A2(n239), .Y(n192) );
  OR3X2_RVT U284 ( .A1(rst), .A2(n187), .A3(n165), .Y(n359) );
  INVX0_RVT U285 ( .A(n284), .Y(n481) );
  INVX0_RVT U304 ( .A(n255), .Y(n482) );
  MUX21X1_RVT U309 ( .A1(u_memory_mem[5]), .A2(n364), .S0(n482), .Y(n119) );
  INVX0_RVT U312 ( .A(n255), .Y(n483) );
  AO21X1_RVT U314 ( .A1(n149), .A2(n375), .A3(n151), .Y(n255) );
  INVX0_RVT U315 ( .A(n181), .Y(n186) );
  AND2X1_RVT U329 ( .A1(n468), .A2(n266), .Y(n349) );
  OR3X1_RVT U345 ( .A1(n207), .A2(n206), .A3(n205), .Y(n190) );
  AO21X1_RVT U356 ( .A1(n485), .A2(n471), .A3(n484), .Y(n341) );
  NOR4X1_RVT U360 ( .A1(n207), .A2(n178), .A3(n205), .A4(n206), .Y(n484) );
  AO21X1_RVT U361 ( .A1(n185), .A2(n186), .A3(n184), .Y(n114) );
  NOR3X0_RVT U366 ( .A1(n438), .A2(n214), .A3(n239), .Y(n249) );
  NBUFFX2_RVT U376 ( .A(coin_in[1]), .Y(n486) );
  OR2X1_RVT U377 ( .A1(display[5]), .A2(n486), .Y(n487) );
  AND2X1_RVT U392 ( .A1(n333), .A2(n150), .Y(n488) );
endmodule

