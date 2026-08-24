/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri Aug 21 14:56:05 2026
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
  wire   u_control_unit_N22, u_control_unit_N20, u_control_unit_check_wait,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n106, n107, n108, n109, n110, n111, n114, n115, n116,
         n117, n119, n122, n123, n124, n126, n127, n130, n131, n132, n133,
         n134, n135, n136, intadd_9_CI, intadd_9_SUM_4_, intadd_9_SUM_3_,
         intadd_9_SUM_2_, intadd_9_SUM_1_, intadd_9_SUM_0_, intadd_9_n5,
         intadd_9_n4, intadd_9_n3, intadd_9_n2, intadd_9_n1, n147, n148, n149,
         n150, n151, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n202, n203, n204, n205, n206, n207, n208, n210, n211,
         n212, n214, n215, n216, n217, n218, n220, n222, n223, n224, n225,
         n227, n230, n233, n234, n235, n237, n238, n239, n240, n242, n243,
         n244, n245, n247, n248, n249, n250, n251, n252, n254, n255, n256,
         n257, n259, n260, n261, n262, n263, n264, n266, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n316, n317,
         n318, n319, n320, n321, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n379, n381, n382, n383, n384, n388, n389, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n402, n403, n404, n405,
         n406, n407, n408, n409, n410, n411, n412, n413, n414, n415, n416,
         n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, n433, n434, n435, n436, n437, n438,
         n439, n440, n441, n442, n443, n444, n445, n446, n447, n448, n449,
         n450, n451, n452, n453, n454, n455, n456;
  wire   [6:0] price;
  wire   [5:0] stock;
  wire   [22:0] u_memory_mem;

  DFFX1_RVT u_control_unit_check_wait_reg ( .D(n136), .CLK(clk), .Q(
        u_control_unit_check_wait), .QN(n396) );
  DFFX1_RVT u_control_unit_current_state_reg_2_ ( .D(u_control_unit_N22), 
        .CLK(clk), .Q(state_out[2]) );
  DFFX1_RVT u_control_unit_current_state_reg_0_ ( .D(u_control_unit_N20), 
        .CLK(clk), .Q(state_out[0]), .QN(n375) );
  DFFX1_RVT u_control_unit_current_state_reg_1_ ( .D(n456), .CLK(clk), .Q(
        state_out[1]), .QN(n374) );
  DFFX1_RVT u_memory_mem_reg_3__1_ ( .D(n134), .CLK(clk), .Q(u_memory_mem[1]), 
        .QN(n381) );
  DFFX1_RVT u_memory_mem_reg_3__0_ ( .D(n135), .CLK(clk), .Q(u_memory_mem[0])
         );
  DFFX1_RVT u_memory_mem_reg_3__2_ ( .D(n133), .CLK(clk), .Q(u_memory_mem[2]), 
        .QN(n382) );
  DFFX1_RVT u_memory_mem_reg_3__3_ ( .D(n132), .CLK(clk), .Q(n402) );
  DFFX1_RVT u_memory_mem_reg_3__4_ ( .D(n131), .CLK(clk), .Q(u_memory_mem[3]), 
        .QN(n389) );
  DFFX1_RVT u_memory_mem_reg_3__5_ ( .D(n130), .CLK(clk), .Q(u_memory_mem[4]), 
        .QN(n392) );
  DFFX1_RVT u_memory_mem_reg_2__0_ ( .D(n127), .CLK(clk), .Q(u_memory_mem[5])
         );
  DFFX1_RVT u_memory_mem_reg_2__1_ ( .D(n126), .CLK(clk), .Q(u_memory_mem[6])
         );
  DFFX1_RVT u_memory_mem_reg_2__2_ ( .D(n182), .CLK(clk), .Q(u_memory_mem[7]), 
        .QN(n399) );
  DFFX1_RVT u_memory_mem_reg_2__3_ ( .D(n124), .CLK(clk), .Q(u_memory_mem[8])
         );
  DFFX1_RVT u_memory_mem_reg_2__4_ ( .D(n123), .CLK(clk), .Q(u_memory_mem[9])
         );
  DFFX1_RVT u_memory_mem_reg_2__5_ ( .D(n122), .CLK(clk), .Q(u_memory_mem[10])
         );
  DFFX1_RVT u_memory_mem_reg_1__0_ ( .D(n119), .CLK(clk), .Q(u_memory_mem[11])
         );
  DFFX1_RVT u_memory_mem_reg_1__2_ ( .D(n117), .CLK(clk), .Q(u_memory_mem[13])
         );
  DFFX1_RVT u_memory_mem_reg_1__1_ ( .D(n183), .CLK(clk), .Q(u_memory_mem[12]), 
        .QN(n398) );
  DFFX1_RVT u_memory_mem_reg_1__3_ ( .D(n116), .CLK(clk), .Q(u_memory_mem[14])
         );
  DFFX1_RVT u_memory_mem_reg_1__4_ ( .D(n115), .CLK(clk), .Q(u_memory_mem[15])
         );
  DFFX1_RVT u_memory_mem_reg_1__5_ ( .D(n114), .CLK(clk), .Q(u_memory_mem[16])
         );
  DFFX1_RVT u_memory_mem_reg_0__0_ ( .D(n111), .CLK(clk), .Q(u_memory_mem[17]), 
        .QN(n377) );
  DFFX1_RVT u_memory_mem_reg_0__2_ ( .D(n109), .CLK(clk), .Q(u_memory_mem[19]), 
        .QN(n383) );
  DFFX1_RVT u_memory_mem_reg_0__1_ ( .D(n110), .CLK(clk), .Q(u_memory_mem[18])
         );
  DFFX1_RVT u_memory_mem_reg_0__3_ ( .D(n108), .CLK(clk), .Q(u_memory_mem[20])
         );
  DFFX1_RVT u_memory_mem_reg_0__4_ ( .D(n107), .CLK(clk), .Q(u_memory_mem[21])
         );
  DFFX1_RVT u_memory_mem_reg_0__5_ ( .D(n106), .CLK(clk), .Q(u_memory_mem[22])
         );
  DFFX1_RVT u_credit_reg_credit_reg_1_ ( .D(n88), .CLK(clk), .Q(display[1]), 
        .QN(n397) );
  DFFX1_RVT u_credit_reg_credit_reg_4_ ( .D(n84), .CLK(clk), .Q(display[4]), 
        .QN(n154) );
  DFFX1_RVT u_memory_price_reg_0_ ( .D(n103), .CLK(clk), .Q(price[0]), .QN(
        n376) );
  DFFX1_RVT u_memory_price_reg_1_ ( .D(n102), .CLK(clk), .Q(price[1]), .QN(
        n379) );
  DFFX1_RVT u_memory_price_reg_2_ ( .D(n101), .CLK(clk), .QN(n384) );
  DFFX1_RVT u_memory_price_reg_3_ ( .D(n100), .CLK(clk), .QN(n388) );
  DFFX1_RVT u_memory_price_reg_4_ ( .D(n99), .CLK(clk), .QN(n391) );
  DFFX1_RVT u_memory_price_reg_5_ ( .D(n98), .CLK(clk), .Q(price[5]), .QN(n393) );
  DFFX1_RVT u_memory_price_reg_6_ ( .D(n97), .CLK(clk), .Q(price[6]), .QN(n394) );
  DFFX1_RVT u_memory_stock_reg_0_ ( .D(n96), .CLK(clk), .Q(stock[0]), .QN(n395) );
  DFFX1_RVT u_memory_stock_reg_1_ ( .D(n95), .CLK(clk), .Q(stock[1]), .QN(n373) );
  DFFX1_RVT u_credit_reg_credit_reg_6_ ( .D(n82), .CLK(clk), .Q(display[6]), 
        .QN(n150) );
  DFFX1_RVT u_credit_reg_credit_reg_7_ ( .D(n81), .CLK(clk), .Q(display[7]), 
        .QN(n400) );
  FADDX1_RVT intadd_9_U6 ( .A(display[2]), .B(n384), .CI(intadd_9_CI), .CO(
        intadd_9_n5), .S(intadd_9_SUM_0_) );
  FADDX1_RVT intadd_9_U5 ( .A(display[3]), .B(n388), .CI(intadd_9_n5), .CO(
        intadd_9_n4), .S(intadd_9_SUM_1_) );
  FADDX1_RVT intadd_9_U4 ( .A(display[4]), .B(n391), .CI(intadd_9_n4), .CO(
        intadd_9_n3), .S(intadd_9_SUM_2_) );
  FADDX1_RVT intadd_9_U3 ( .A(display[5]), .B(n393), .CI(intadd_9_n3), .CO(
        intadd_9_n2), .S(intadd_9_SUM_3_) );
  FADDX1_RVT intadd_9_U2 ( .A(display[6]), .B(n394), .CI(intadd_9_n2), .CO(
        intadd_9_n1), .S(intadd_9_SUM_4_) );
  OAI21X1_RVT U158 ( .A1(n162), .A2(n419), .A3(n413), .Y(n147) );
  XOR2X1_RVT U163 ( .A1(n155), .A2(n292), .Y(n294) );
  NOR2X0_RVT U167 ( .A1(n223), .A2(state_out[2]), .Y(dispense) );
  NOR3X0_RVT U169 ( .A1(n172), .A2(n290), .A3(n155), .Y(n161) );
  INVX0_RVT U170 ( .A(coin_in[0]), .Y(n188) );
  OAI21X2_RVT U172 ( .A1(n296), .A2(n303), .A3(n297), .Y(n189) );
  OAI22X1_RVT U173 ( .A1(n150), .A2(n313), .A3(n147), .A4(n148), .Y(n82) );
  AO22X1_RVT U174 ( .A1(n165), .A2(n281), .A3(n163), .A4(n164), .Y(n148) );
  NAND2X0_RVT U175 ( .A1(n279), .A2(n160), .Y(n162) );
  INVX1_RVT U176 ( .A(n160), .Y(n284) );
  AND2X1_RVT U177 ( .A1(n283), .A2(n282), .Y(n160) );
  NAND2X0_RVT U178 ( .A1(n158), .A2(display[6]), .Y(n282) );
  OR2X1_RVT U179 ( .A1(display[6]), .A2(n158), .Y(n283) );
  NOR2X0_RVT U180 ( .A1(n286), .A2(n290), .Y(n279) );
  AND2X1_RVT U181 ( .A1(n154), .A2(n158), .Y(n290) );
  INVX0_RVT U182 ( .A(n279), .Y(n149) );
  NAND2X0_RVT U184 ( .A1(n154), .A2(n158), .Y(n151) );
  AO21X1_RVT U185 ( .A1(n290), .A2(n172), .A3(n170), .Y(n169) );
  OA21X1_RVT U187 ( .A1(n339), .A2(n338), .A3(n337), .Y(n347) );
  AOI21X1_RVT U188 ( .A1(n295), .A2(n190), .A3(n189), .Y(n293) );
  NOR2X0_RVT U190 ( .A1(n388), .A2(n324), .Y(n326) );
  OR3X1_RVT U191 ( .A1(error), .A2(n357), .A3(n356), .Y(n358) );
  INVX0_RVT U192 ( .A(n285), .Y(n170) );
  NOR2X0_RVT U193 ( .A1(display[2]), .A2(n191), .Y(n302) );
  AND2X1_RVT U194 ( .A1(coin_in[0]), .A2(coin_in[1]), .Y(n191) );
  NOR2X0_RVT U198 ( .A1(n355), .A2(confirm), .Y(n356) );
  NOR2X0_RVT U200 ( .A1(n196), .A2(n361), .Y(n136) );
  NAND2X0_RVT U201 ( .A1(n413), .A2(display[7]), .Y(n153) );
  OAI21X1_RVT U203 ( .A1(n286), .A2(n285), .A3(n287), .Y(n280) );
  OA21X1_RVT U206 ( .A1(n318), .A2(n307), .A3(n308), .Y(n156) );
  OR2X2_RVT U207 ( .A1(n154), .A2(n158), .Y(n285) );
  NOR2X0_RVT U208 ( .A1(coin_in[1]), .A2(display[5]), .Y(n286) );
  OAI21X1_RVT U209 ( .A1(n302), .A2(n156), .A3(n303), .Y(n300) );
  AO22X1_RVT U210 ( .A1(n418), .A2(display[5]), .A3(n166), .A4(n167), .Y(n83)
         );
  NOR2X0_RVT U211 ( .A1(n312), .A2(n161), .Y(n166) );
  NOR2X0_RVT U212 ( .A1(n296), .A2(n302), .Y(n190) );
  NOR3X0_RVT U213 ( .A1(display[7]), .A2(n180), .A3(n293), .Y(n177) );
  NOR2X0_RVT U214 ( .A1(n419), .A2(n180), .Y(n178) );
  AO21X1_RVT U215 ( .A1(n149), .A2(n284), .A3(n157), .Y(n163) );
  OR2X1_RVT U216 ( .A1(n160), .A2(n281), .Y(n164) );
  AND2X1_RVT U217 ( .A1(n284), .A2(n419), .Y(n165) );
  AOI22X1_RVT U218 ( .A1(n155), .A2(n171), .A3(n169), .A4(n168), .Y(n167) );
  OR2X1_RVT U219 ( .A1(n289), .A2(n285), .Y(n168) );
  AND2X1_RVT U220 ( .A1(n285), .A2(n172), .Y(n171) );
  INVX1_RVT U221 ( .A(n289), .Y(n172) );
  NAND3X0_RVT U222 ( .A1(n175), .A2(n174), .A3(n173), .Y(n81) );
  OR2X1_RVT U223 ( .A1(n400), .A2(n313), .Y(n173) );
  NAND2X0_RVT U224 ( .A1(n176), .A2(n413), .Y(n174) );
  OR3X1_RVT U225 ( .A1(n181), .A2(n178), .A3(n153), .Y(n175) );
  AO21X1_RVT U226 ( .A1(n181), .A2(n400), .A3(n177), .Y(n176) );
  NAND2X0_RVT U227 ( .A1(n279), .A2(n283), .Y(n180) );
  AO21X1_RVT U228 ( .A1(n280), .A2(n283), .A3(n192), .Y(n181) );
  NOR2X0_RVT U229 ( .A1(coin_in[1]), .A2(coin_in[0]), .Y(n185) );
  NOR2X0_RVT U230 ( .A1(n449), .A2(n325), .Y(n328) );
  NOR2X0_RVT U232 ( .A1(n184), .A2(n369), .Y(n187) );
  OAI22X1_RVT U233 ( .A1(n399), .A2(n249), .A3(n248), .A4(n256), .Y(n182) );
  OAI22X1_RVT U234 ( .A1(n398), .A2(n430), .A3(n239), .A4(n255), .Y(n183) );
  NOR2X0_RVT U235 ( .A1(n375), .A2(n361), .Y(n184) );
  OR2X1_RVT U236 ( .A1(n326), .A2(n328), .Y(n100) );
  AO21X1_RVT U237 ( .A1(n331), .A2(price[0]), .A3(n328), .Y(n103) );
  NOR2X0_RVT U239 ( .A1(n353), .A2(n361), .Y(u_control_unit_N22) );
  NOR2X0_RVT U240 ( .A1(n360), .A2(n375), .Y(error) );
  OR2X2_RVT U241 ( .A1(cancel), .A2(rst), .Y(n361) );
  AND2X1_RVT U242 ( .A1(state_out[2]), .A2(n374), .Y(n193) );
  NOR2X2_RVT U243 ( .A1(n193), .A2(n361), .Y(n369) );
  OR2X1_RVT U244 ( .A1(state_out[2]), .A2(state_out[1]), .Y(n186) );
  NAND2X0_RVT U249 ( .A1(n188), .A2(display[1]), .Y(n308) );
  NOR2X0_RVT U250 ( .A1(display[3]), .A2(n316), .Y(n296) );
  NAND2X0_RVT U251 ( .A1(display[2]), .A2(n158), .Y(n303) );
  NAND2X0_RVT U252 ( .A1(n316), .A2(display[3]), .Y(n297) );
  NAND2X0_RVT U253 ( .A1(display[5]), .A2(coin_in[1]), .Y(n287) );
  INVX0_RVT U254 ( .A(n282), .Y(n192) );
  INVX0_RVT U255 ( .A(n193), .Y(n360) );
  NAND2X0_RVT U256 ( .A1(state_out[1]), .A2(state_out[0]), .Y(n223) );
  OR2X1_RVT U257 ( .A1(dispense), .A2(n193), .Y(n195) );
  OR2X1_RVT U258 ( .A1(n374), .A2(state_out[0]), .Y(n194) );
  OR2X1_RVT U259 ( .A1(state_out[2]), .A2(n194), .Y(n354) );
  NOR2X0_RVT U260 ( .A1(u_control_unit_check_wait), .A2(n354), .Y(n336) );
  AOI21X1_RVT U261 ( .A1(n195), .A2(u_control_unit_check_wait), .A3(n336), .Y(
        n196) );
  INVX0_RVT U265 ( .A(sel_item[0]), .Y(n235) );
  NOR2X0_RVT U268 ( .A1(n218), .A2(n377), .Y(n197) );
  INVX0_RVT U274 ( .A(n429), .Y(n237) );
  OR2X1_RVT U275 ( .A1(n237), .A2(n159), .Y(n233) );
  AND2X1_RVT U279 ( .A1(u_memory_mem[8]), .A2(n330), .Y(n202) );
  NOR2X0_RVT U281 ( .A1(n218), .A2(n383), .Y(n208) );
  NOR2X0_RVT U282 ( .A1(n427), .A2(n382), .Y(n205) );
  AO21X1_RVT U283 ( .A1(u_memory_mem[7]), .A2(n330), .A3(n205), .Y(n207) );
  AND2X1_RVT U284 ( .A1(u_memory_mem[13]), .A2(n329), .Y(n206) );
  AND2X1_RVT U289 ( .A1(u_memory_mem[6]), .A2(n330), .Y(n210) );
  NOR2X0_RVT U294 ( .A1(n217), .A2(n389), .Y(n216) );
  AND2X1_RVT U297 ( .A1(u_memory_mem[9]), .A2(n330), .Y(n214) );
  AND2X1_RVT U303 ( .A1(u_memory_mem[10]), .A2(n330), .Y(n220) );
  OR2X1_RVT U307 ( .A1(state_out[2]), .A2(n223), .Y(n224) );
  MUX21X1_RVT U313 ( .A1(u_memory_mem[17]), .A2(n233), .S0(n245), .Y(n111) );
  AO21X1_RVT U327 ( .A1(n429), .A2(n432), .A3(n238), .Y(n240) );
  AO22X1_RVT U328 ( .A1(n431), .A2(u_memory_mem[18]), .A3(n264), .A4(n240), 
        .Y(n110) );
  INVX0_RVT U329 ( .A(n240), .Y(n239) );
  OR2X1_RVT U330 ( .A1(n240), .A2(n159), .Y(n242) );
  MUX21X1_RVT U333 ( .A1(u_memory_mem[1]), .A2(n242), .S0(n426), .Y(n134) );
  AOI21X1_RVT U335 ( .A1(n276), .A2(n244), .A3(n251), .Y(n248) );
  INVX0_RVT U336 ( .A(n248), .Y(n250) );
  OR2X1_RVT U337 ( .A1(n250), .A2(n159), .Y(n247) );
  MUX21X1_RVT U338 ( .A1(u_memory_mem[19]), .A2(n247), .S0(n245), .Y(n109) );
  MUX21X1_RVT U339 ( .A1(u_memory_mem[13]), .A2(n247), .S0(n430), .Y(n117) );
  AO22X1_RVT U340 ( .A1(n272), .A2(u_memory_mem[2]), .A3(n271), .A4(n250), .Y(
        n133) );
  INVX0_RVT U341 ( .A(n415), .Y(n252) );
  NOR2X0_RVT U342 ( .A1(n252), .A2(n251), .Y(n254) );
  AO22X1_RVT U345 ( .A1(n431), .A2(u_memory_mem[20]), .A3(n264), .A4(n257), 
        .Y(n108) );
  AO22X1_RVT U347 ( .A1(n257), .A2(n424), .A3(n266), .A4(u_memory_mem[14]), 
        .Y(n116) );
  AO22X1_RVT U349 ( .A1(n269), .A2(n257), .A3(n268), .A4(u_memory_mem[8]), .Y(
        n124) );
  AO22X1_RVT U350 ( .A1(n272), .A2(n402), .A3(n271), .A4(n257), .Y(n132) );
  INVX0_RVT U351 ( .A(n274), .Y(n259) );
  NOR2X0_RVT U352 ( .A1(n259), .A2(n422), .Y(n260) );
  AO22X1_RVT U354 ( .A1(n431), .A2(u_memory_mem[21]), .A3(n264), .A4(n261), 
        .Y(n107) );
  AO22X1_RVT U355 ( .A1(n424), .A2(n261), .A3(n266), .A4(u_memory_mem[15]), 
        .Y(n115) );
  AO22X1_RVT U356 ( .A1(n261), .A2(n269), .A3(n268), .A4(u_memory_mem[9]), .Y(
        n123) );
  AO22X1_RVT U357 ( .A1(n272), .A2(u_memory_mem[3]), .A3(n271), .A4(n261), .Y(
        n131) );
  AO22X1_RVT U359 ( .A1(n431), .A2(u_memory_mem[22]), .A3(n264), .A4(n270), 
        .Y(n106) );
  AO22X1_RVT U360 ( .A1(n270), .A2(n424), .A3(n266), .A4(u_memory_mem[16]), 
        .Y(n114) );
  AO22X1_RVT U361 ( .A1(n270), .A2(n269), .A3(n268), .A4(u_memory_mem[10]), 
        .Y(n122) );
  AO22X1_RVT U362 ( .A1(n272), .A2(u_memory_mem[4]), .A3(n271), .A4(n270), .Y(
        n130) );
  NOR2X2_RVT U363 ( .A1(rst), .A2(n336), .Y(n331) );
  AO22X1_RVT U365 ( .A1(n414), .A2(n404), .A3(stock[5]), .A4(n331), .Y(n91) );
  AO22X1_RVT U366 ( .A1(n414), .A2(n274), .A3(stock[4]), .A4(n331), .Y(n92) );
  AO22X1_RVT U367 ( .A1(n414), .A2(n415), .A3(stock[3]), .A4(n331), .Y(n93) );
  AO22X1_RVT U368 ( .A1(n414), .A2(n276), .A3(stock[2]), .A4(n331), .Y(n94) );
  AO22X1_RVT U369 ( .A1(n432), .A2(n414), .A3(stock[1]), .A4(n331), .Y(n95) );
  AO22X1_RVT U370 ( .A1(n414), .A2(n429), .A3(stock[0]), .A4(n331), .Y(n96) );
  INVX0_RVT U372 ( .A(n286), .Y(n288) );
  AND2X1_RVT U373 ( .A1(n288), .A2(n287), .Y(n289) );
  NAND2X0_RVT U374 ( .A1(n151), .A2(n285), .Y(n292) );
  AO22X1_RVT U375 ( .A1(n418), .A2(display[4]), .A3(n294), .A4(n413), .Y(n84)
         );
  INVX0_RVT U376 ( .A(n296), .Y(n298) );
  NAND2X0_RVT U377 ( .A1(n298), .A2(n297), .Y(n299) );
  XNOR2X1_RVT U378 ( .A1(n300), .A2(n299), .Y(n301) );
  AO22X1_RVT U379 ( .A1(n418), .A2(display[3]), .A3(n413), .A4(n301), .Y(n85)
         );
  INVX0_RVT U380 ( .A(n302), .Y(n304) );
  NAND2X0_RVT U381 ( .A1(n304), .A2(n303), .Y(n305) );
  XOR2X1_RVT U382 ( .A1(n156), .A2(n305), .Y(n306) );
  AO22X1_RVT U383 ( .A1(n418), .A2(display[2]), .A3(n413), .A4(n306), .Y(n86)
         );
  INVX0_RVT U384 ( .A(n307), .Y(n309) );
  NAND2X0_RVT U385 ( .A1(n309), .A2(n308), .Y(n310) );
  XNOR2X1_RVT U386 ( .A1(n310), .A2(n318), .Y(n311) );
  NOR2X0_RVT U387 ( .A1(display[0]), .A2(n316), .Y(n317) );
  INVX0_RVT U388 ( .A(n317), .Y(n319) );
  NAND2X0_RVT U389 ( .A1(n319), .A2(n318), .Y(n320) );
  INVX0_RVT U390 ( .A(n320), .Y(n321) );
  AO22X1_RVT U391 ( .A1(n418), .A2(display[0]), .A3(n413), .A4(n321), .Y(n87)
         );
  AO22X1_RVT U392 ( .A1(n414), .A2(sel_item[1]), .A3(n331), .A4(price[6]), .Y(
        n97) );
  AO22X1_RVT U393 ( .A1(n414), .A2(n449), .A3(n331), .A4(price[5]), .Y(n98) );
  NOR2X0_RVT U399 ( .A1(display[0]), .A2(n376), .Y(n367) );
  INVX0_RVT U400 ( .A(n367), .Y(n334) );
  OA21X1_RVT U401 ( .A1(n379), .A2(display[1]), .A3(n334), .Y(n335) );
  AO21X1_RVT U402 ( .A1(display[1]), .A2(n379), .A3(n335), .Y(intadd_9_CI) );
  OR2X1_RVT U403 ( .A1(n375), .A2(state_out[1]), .Y(n355) );
  OR2X1_RVT U404 ( .A1(state_out[2]), .A2(n355), .Y(n339) );
  INVX0_RVT U405 ( .A(confirm), .Y(n338) );
  INVX0_RVT U406 ( .A(n336), .Y(n337) );
  OR2X1_RVT U407 ( .A1(stock[3]), .A2(stock[2]), .Y(n342) );
  OR2X1_RVT U408 ( .A1(stock[5]), .A2(stock[4]), .Y(n341) );
  NAND2X0_RVT U409 ( .A1(n373), .A2(n395), .Y(n340) );
  NOR3X0_RVT U410 ( .A1(n342), .A2(n341), .A3(n340), .Y(n344) );
  NOR2X0_RVT U411 ( .A1(display[7]), .A2(intadd_9_n1), .Y(n343) );
  NOR2X0_RVT U412 ( .A1(n344), .A2(n343), .Y(n351) );
  INVX0_RVT U413 ( .A(n351), .Y(n345) );
  OR2X1_RVT U414 ( .A1(n345), .A2(n354), .Y(n346) );
  OR2X1_RVT U417 ( .A1(n374), .A2(state_out[2]), .Y(n349) );
  OR2X1_RVT U418 ( .A1(n396), .A2(n349), .Y(n352) );
  NOR2X0_RVT U419 ( .A1(dispense), .A2(error), .Y(n350) );
  OA21X1_RVT U420 ( .A1(n352), .A2(n351), .A3(n350), .Y(n353) );
  NOR2X0_RVT U422 ( .A1(n354), .A2(n396), .Y(n357) );
  AO22X1_RVT U423 ( .A1(n413), .A2(n375), .A3(n359), .A4(n358), .Y(
        u_control_unit_N20) );
  AO21X1_RVT U424 ( .A1(display[0]), .A2(n376), .A3(n367), .Y(n366) );
  OR2X1_RVT U425 ( .A1(state_out[0]), .A2(n360), .Y(n362) );
  NOR2X2_RVT U426 ( .A1(n362), .A2(n361), .Y(n371) );
  INVX0_RVT U427 ( .A(cancel), .Y(n364) );
  INVX0_RVT U428 ( .A(error), .Y(n363) );
  AND2X1_RVT U429 ( .A1(n364), .A2(n363), .Y(n365) );
  AO222X1_RVT U430 ( .A1(n366), .A2(n371), .A3(display[0]), .A4(n370), .A5(
        n369), .A6(change_out[0]), .Y(n80) );
  XOR3X1_RVT U431 ( .A1(display[1]), .A2(price[1]), .A3(n367), .Y(n368) );
  AO222X1_RVT U432 ( .A1(n369), .A2(change_out[1]), .A3(n370), .A4(display[1]), 
        .A5(n371), .A6(n368), .Y(n79) );
  AO222X1_RVT U433 ( .A1(n369), .A2(change_out[2]), .A3(n370), .A4(display[2]), 
        .A5(n371), .A6(intadd_9_SUM_0_), .Y(n78) );
  AO222X1_RVT U434 ( .A1(n369), .A2(change_out[3]), .A3(n370), .A4(display[3]), 
        .A5(n371), .A6(intadd_9_SUM_1_), .Y(n77) );
  AO222X1_RVT U435 ( .A1(n369), .A2(change_out[4]), .A3(n370), .A4(display[4]), 
        .A5(n371), .A6(intadd_9_SUM_2_), .Y(n76) );
  AO222X1_RVT U436 ( .A1(n369), .A2(change_out[5]), .A3(n370), .A4(display[5]), 
        .A5(n371), .A6(intadd_9_SUM_3_), .Y(n75) );
  AO222X1_RVT U437 ( .A1(n369), .A2(change_out[6]), .A3(n370), .A4(display[6]), 
        .A5(n371), .A6(intadd_9_SUM_4_), .Y(n74) );
  XNOR2X1_RVT U438 ( .A1(intadd_9_n1), .A2(display[7]), .Y(n372) );
  AO222X1_RVT U439 ( .A1(n372), .A2(n371), .A3(display[7]), .A4(n370), .A5(
        n369), .A6(change_out[7]), .Y(n73) );
  NOR2X2_RVT U266 ( .A1(sel_item[1]), .A2(n235), .Y(n329) );
  DFFX1_RVT change_out_reg_7_ ( .D(n73), .CLK(clk), .Q(change_out[7]) );
  DFFX1_RVT change_out_reg_0_ ( .D(n80), .CLK(clk), .Q(change_out[0]) );
  DFFX1_RVT change_out_reg_6_ ( .D(n74), .CLK(clk), .Q(change_out[6]) );
  DFFX1_RVT change_out_reg_5_ ( .D(n75), .CLK(clk), .Q(change_out[5]) );
  DFFX1_RVT change_out_reg_4_ ( .D(n76), .CLK(clk), .Q(change_out[4]) );
  DFFX1_RVT change_out_reg_3_ ( .D(n77), .CLK(clk), .Q(change_out[3]) );
  DFFX1_RVT change_out_reg_2_ ( .D(n78), .CLK(clk), .Q(change_out[2]) );
  DFFX1_RVT change_out_reg_1_ ( .D(n79), .CLK(clk), .Q(change_out[1]) );
  DFFX1_RVT u_memory_stock_reg_5_ ( .D(n91), .CLK(clk), .Q(stock[5]) );
  DFFX1_RVT u_memory_stock_reg_4_ ( .D(n92), .CLK(clk), .Q(stock[4]) );
  DFFX1_RVT u_memory_stock_reg_3_ ( .D(n93), .CLK(clk), .Q(stock[3]) );
  DFFX1_RVT u_memory_stock_reg_2_ ( .D(n94), .CLK(clk), .Q(stock[2]) );
  DFFX1_RVT u_credit_reg_credit_reg_0_ ( .D(n87), .CLK(clk), .Q(display[0]), 
        .QN(n420) );
  DFFX1_RVT u_credit_reg_credit_reg_3_ ( .D(n85), .CLK(clk), .Q(display[3]) );
  DFFX1_RVT u_credit_reg_credit_reg_2_ ( .D(n86), .CLK(clk), .Q(display[2]) );
  DFFX1_RVT u_credit_reg_credit_reg_5_ ( .D(n83), .CLK(clk), .Q(display[5]) );
  NBUFFX2_RVT U162 ( .A(rst), .Y(n159) );
  OAI21X1_RVT U202 ( .A1(n286), .A2(n285), .A3(n287), .Y(n157) );
  OR2X1_RVT U246 ( .A1(n413), .A2(n187), .Y(n313) );
  OR2X1_RVT U344 ( .A1(n254), .A2(n422), .Y(n257) );
  NOR2X1_RVT U157 ( .A1(n365), .A2(n159), .Y(n370) );
  OAI21X1_RVT U159 ( .A1(n443), .A2(n230), .A3(n448), .Y(n426) );
  NOR3X0_RVT U160 ( .A1(n186), .A2(n185), .A3(n361), .Y(n413) );
  OAI21X1_RVT U161 ( .A1(n318), .A2(n307), .A3(n308), .Y(n295) );
  INVX0_RVT U164 ( .A(n413), .Y(n312) );
  INVX0_RVT U165 ( .A(n331), .Y(n324) );
  INVX0_RVT U166 ( .A(n404), .Y(n262) );
  INVX1_RVT U168 ( .A(rst), .Y(n455) );
  INVX0_RVT U171 ( .A(coin_in[1]), .Y(n316) );
  OR3X2_RVT U183 ( .A1(n208), .A2(n206), .A3(n207), .Y(n276) );
  INVX0_RVT U186 ( .A(n243), .Y(n251) );
  INVX0_RVT U189 ( .A(n244), .Y(n238) );
  INVX0_RVT U195 ( .A(n218), .Y(n434) );
  INVX0_RVT U196 ( .A(n218), .Y(n433) );
  INVX0_RVT U197 ( .A(n327), .Y(n217) );
  INVX0_RVT U199 ( .A(n230), .Y(n403) );
  INVX0_RVT U204 ( .A(n327), .Y(n428) );
  AND2X1_RVT U205 ( .A1(coin_in[0]), .A2(n397), .Y(n307) );
  INVX0_RVT U231 ( .A(n218), .Y(n407) );
  INVX1_RVT U238 ( .A(n157), .Y(n281) );
  INVX0_RVT U245 ( .A(n361), .Y(n359) );
  INVX1_RVT U247 ( .A(n268), .Y(n249) );
  INVX2_RVT U248 ( .A(n159), .Y(n448) );
  OR3X1_RVT U262 ( .A1(n210), .A2(n212), .A3(n211), .Y(n277) );
  NOR2X0_RVT U263 ( .A1(n381), .A2(n427), .Y(n212) );
  NOR2X0_RVT U264 ( .A1(n392), .A2(n428), .Y(n222) );
  AND2X1_RVT U267 ( .A1(u_memory_mem[0]), .A2(n327), .Y(n436) );
  INVX0_RVT U269 ( .A(sel_item[0]), .Y(n408) );
  OR3X1_RVT U270 ( .A1(n197), .A2(n436), .A3(n440), .Y(n278) );
  AO22X1_RVT U271 ( .A1(n330), .A2(u_memory_mem[5]), .A3(u_memory_mem[11]), 
        .A4(n329), .Y(n440) );
  AO22X1_RVT U272 ( .A1(n410), .A2(n403), .A3(n455), .A4(rst), .Y(n271) );
  NBUFFX2_RVT U273 ( .A(n273), .Y(n404) );
  OR2X2_RVT U276 ( .A1(n405), .A2(n225), .Y(n227) );
  NOR3X0_RVT U277 ( .A1(n276), .A2(n437), .A3(n450), .Y(n225) );
  OR2X1_RVT U278 ( .A1(n224), .A2(n445), .Y(n405) );
  OR3X1_RVT U280 ( .A1(n220), .A2(n222), .A3(n406), .Y(n273) );
  AO22X1_RVT U285 ( .A1(n329), .A2(u_memory_mem[16]), .A3(u_memory_mem[22]), 
        .A4(n434), .Y(n406) );
  OR3X1_RVT U286 ( .A1(n204), .A2(n202), .A3(n203), .Y(n275) );
  AO22X1_RVT U287 ( .A1(n329), .A2(u_memory_mem[14]), .A3(u_memory_mem[20]), 
        .A4(n433), .Y(n203) );
  INVX0_RVT U288 ( .A(n218), .Y(n409) );
  AO22X1_RVT U290 ( .A1(n407), .A2(u_memory_mem[21]), .A3(n329), .A4(
        u_memory_mem[15]), .Y(n215) );
  INVX0_RVT U291 ( .A(sel_item[1]), .Y(n323) );
  AND2X1_RVT U292 ( .A1(sel_item[1]), .A2(n408), .Y(n330) );
  AO22X1_RVT U293 ( .A1(u_memory_mem[18]), .A2(n409), .A3(n329), .A4(
        u_memory_mem[12]), .Y(n211) );
  AND2X1_RVT U295 ( .A1(n444), .A2(n455), .Y(n410) );
  AO21X1_RVT U296 ( .A1(n435), .A2(n455), .A3(n411), .Y(n268) );
  NOR4X1_RVT U298 ( .A1(n437), .A2(n159), .A3(n450), .A4(n276), .Y(n411) );
  OR2X2_RVT U299 ( .A1(n159), .A2(n331), .Y(n325) );
  NOR2X2_RVT U300 ( .A1(n159), .A2(n331), .Y(n414) );
  OAI22X1_RVT U301 ( .A1(n445), .A2(n325), .A3(n391), .A4(n324), .Y(n99) );
  INVX1_RVT U302 ( .A(n439), .Y(n445) );
  OAI22X1_RVT U304 ( .A1(n325), .A2(n412), .A3(n324), .A4(n379), .Y(n102) );
  NOR2X4_RVT U305 ( .A1(n329), .A2(n330), .Y(n412) );
  OAI22X1_RVT U306 ( .A1(n217), .A2(n325), .A3(n324), .A4(n384), .Y(n101) );
  OR3X1_RVT U308 ( .A1(n203), .A2(n204), .A3(n202), .Y(n415) );
  NOR2X2_RVT U309 ( .A1(n413), .A2(n187), .Y(n418) );
  OR2X1_RVT U310 ( .A1(n397), .A2(n313), .Y(n417) );
  NAND2X0_RVT U311 ( .A1(n416), .A2(n417), .Y(n88) );
  OR2X1_RVT U312 ( .A1(n312), .A2(n311), .Y(n416) );
  AOI21X1_RVT U314 ( .A1(n295), .A2(n190), .A3(n189), .Y(n155) );
  AOI21X1_RVT U315 ( .A1(n295), .A2(n190), .A3(n189), .Y(n419) );
  AND2X1_RVT U316 ( .A1(coin_in[0]), .A2(coin_in[1]), .Y(n158) );
  OR2X2_RVT U317 ( .A1(coin_in[1]), .A2(n420), .Y(n318) );
  INVX1_RVT U318 ( .A(n442), .Y(n421) );
  NBUFFX2_RVT U319 ( .A(sel_item[0]), .Y(n442) );
  NOR2X0_RVT U320 ( .A1(n244), .A2(n425), .Y(n422) );
  OR2X1_RVT U321 ( .A1(n276), .A2(n275), .Y(n425) );
  INVX0_RVT U322 ( .A(n256), .Y(n269) );
  XNOR2X2_RVT U323 ( .A1(n263), .A2(n262), .Y(n270) );
  OR2X2_RVT U324 ( .A1(n277), .A2(n278), .Y(n244) );
  NOR2X0_RVT U325 ( .A1(n450), .A2(n243), .Y(n263) );
  OAI22X1_RVT U326 ( .A1(n448), .A2(n159), .A3(n423), .A4(n227), .Y(n264) );
  NAND2X0_RVT U331 ( .A1(n448), .A2(n447), .Y(n423) );
  AOI21X2_RVT U332 ( .A1(n227), .A2(n455), .A3(n453), .Y(n424) );
  OR2X2_RVT U334 ( .A1(n276), .A2(n244), .Y(n243) );
  INVX0_RVT U343 ( .A(n444), .Y(n443) );
  OR2X2_RVT U346 ( .A1(n263), .A2(n260), .Y(n261) );
  OA21X1_RVT U348 ( .A1(n443), .A2(n230), .A3(n448), .Y(n272) );
  OR2X2_RVT U353 ( .A1(n225), .A2(n224), .Y(n230) );
  OR2X2_RVT U358 ( .A1(n274), .A2(n275), .Y(n450) );
  MUX21X1_RVT U364 ( .A1(n233), .A2(u_memory_mem[11]), .S0(n266), .Y(n119) );
  INVX0_RVT U371 ( .A(n327), .Y(n427) );
  OR3X1_RVT U394 ( .A1(n436), .A2(n197), .A3(n440), .Y(n429) );
  OA21X1_RVT U395 ( .A1(n454), .A2(n227), .A3(n455), .Y(n266) );
  OAI21X2_RVT U396 ( .A1(n454), .A2(n227), .A3(n455), .Y(n430) );
  OA21X1_RVT U397 ( .A1(n449), .A2(n227), .A3(n455), .Y(n431) );
  INVX1_RVT U398 ( .A(n442), .Y(n454) );
  OR3X1_RVT U415 ( .A1(n212), .A2(n211), .A3(n210), .Y(n432) );
  OR3X1_RVT U416 ( .A1(n214), .A2(n216), .A3(n215), .Y(n274) );
  OR2X2_RVT U421 ( .A1(sel_item[0]), .A2(sel_item[1]), .Y(n218) );
  MUX21X1_RVT U440 ( .A1(u_memory_mem[6]), .A2(n242), .S0(n249), .Y(n126) );
  OR2X1_RVT U441 ( .A1(n441), .A2(n452), .Y(n435) );
  OAI21X2_RVT U442 ( .A1(n449), .A2(n227), .A3(n455), .Y(n245) );
  AND2X1_RVT U443 ( .A1(sel_item[0]), .A2(sel_item[1]), .Y(n327) );
  AND2X1_RVT U444 ( .A1(n402), .A2(n327), .Y(n204) );
  OR3X1_RVT U445 ( .A1(n273), .A2(n278), .A3(n277), .Y(n437) );
  NBUFFX2_RVT U446 ( .A(n421), .Y(n438) );
  NBUFFX2_RVT U447 ( .A(n323), .Y(n439) );
  OR2X1_RVT U448 ( .A1(n441), .A2(n225), .Y(n234) );
  OR2X1_RVT U449 ( .A1(n224), .A2(n439), .Y(n441) );
  AND2X1_RVT U450 ( .A1(n446), .A2(n445), .Y(n444) );
  INVX0_RVT U451 ( .A(n438), .Y(n446) );
  AO22X1_RVT U452 ( .A1(n272), .A2(u_memory_mem[0]), .A3(n271), .A4(n237), .Y(
        n135) );
  MUX21X1_RVT U453 ( .A1(u_memory_mem[5]), .A2(n233), .S0(n249), .Y(n127) );
  INVX1_RVT U454 ( .A(n449), .Y(n447) );
  NBUFFX2_RVT U455 ( .A(n442), .Y(n449) );
  AO21X1_RVT U456 ( .A1(n455), .A2(n234), .A3(n451), .Y(n256) );
  AO21X1_RVT U457 ( .A1(n455), .A2(n452), .A3(n159), .Y(n451) );
  INVX1_RVT U458 ( .A(n438), .Y(n452) );
  AO21X1_RVT U459 ( .A1(n227), .A2(n455), .A3(n453), .Y(n255) );
  AO21X1_RVT U460 ( .A1(n455), .A2(n454), .A3(n159), .Y(n453) );
  AOI21X1_RVT U461 ( .A1(n347), .A2(n346), .A3(n361), .Y(n456) );
endmodule

