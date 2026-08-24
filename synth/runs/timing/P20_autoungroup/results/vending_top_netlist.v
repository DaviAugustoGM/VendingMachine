/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : X-2025.06-SP2
// Date      : Fri Aug 21 14:55:24 2026
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
  wire   u_control_unit_N22, u_control_unit_N21, u_control_unit_N20,
         u_control_unit_check_wait, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n107, n108, n109, n110, n111, n115,
         n116, n117, n118, n119, n123, n124, n125, n126, n127, n131, n132,
         n133, n134, n135, n136, intadd_0_CI, intadd_0_SUM_4_, intadd_0_SUM_3_,
         intadd_0_SUM_2_, intadd_0_SUM_1_, intadd_0_SUM_0_, intadd_0_n5,
         intadd_0_n4, intadd_0_n3, intadd_0_n2, intadd_0_n1, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256;
  wire   [6:0] price;
  wire   [4:0] stock;
  wire   [19:0] u_memory_mem;

  FADDX1_RVT intadd_0_U6 ( .A(display[2]), .B(n248), .CI(intadd_0_CI), .CO(
        intadd_0_n5), .S(intadd_0_SUM_0_) );
  FADDX1_RVT intadd_0_U5 ( .A(display[3]), .B(n249), .CI(intadd_0_n5), .CO(
        intadd_0_n4), .S(intadd_0_SUM_1_) );
  FADDX1_RVT intadd_0_U4 ( .A(display[4]), .B(n250), .CI(intadd_0_n4), .CO(
        intadd_0_n3), .S(intadd_0_SUM_2_) );
  FADDX1_RVT intadd_0_U3 ( .A(display[5]), .B(n251), .CI(intadd_0_n3), .CO(
        intadd_0_n2), .S(intadd_0_SUM_3_) );
  FADDX1_RVT intadd_0_U2 ( .A(display[6]), .B(n252), .CI(intadd_0_n2), .CO(
        intadd_0_n1), .S(intadd_0_SUM_4_) );
  INVX0_RVT U157 ( .A(sel_item[0]), .Y(n146) );
  INVX2_RVT U158 ( .A(n146), .Y(n147) );
  NAND2X0_RVT U159 ( .A1(n231), .A2(n188), .Y(n189) );
  INVX0_RVT U160 ( .A(rst), .Y(n231) );
  AND3X1_RVT U161 ( .A1(state_out[0]), .A2(state_out[2]), .A3(n244), .Y(error)
         );
  NAND3X0_RVT U162 ( .A1(state_out[1]), .A2(state_out[0]), .A3(n243), .Y(n157)
         );
  NOR2X0_RVT U164 ( .A1(rst), .A2(cancel), .Y(n230) );
  OR3X1_RVT U165 ( .A1(state_out[1]), .A2(confirm), .A3(n253), .Y(n150) );
  INVX0_RVT U166 ( .A(error), .Y(n149) );
  AND3X1_RVT U167 ( .A1(state_out[1]), .A2(n253), .A3(n243), .Y(n187) );
  NAND2X0_RVT U168 ( .A1(u_control_unit_check_wait), .A2(n187), .Y(n148) );
  NAND3X0_RVT U169 ( .A1(n150), .A2(n149), .A3(n148), .Y(n151) );
  AND3X1_RVT U170 ( .A1(n230), .A2(n244), .A3(n243), .Y(n208) );
  OA21X1_RVT U171 ( .A1(coin_in[0]), .A2(coin_in[1]), .A3(n208), .Y(n227) );
  AO22X1_RVT U172 ( .A1(n230), .A2(n151), .A3(n227), .A4(n253), .Y(
        u_control_unit_N20) );
  NAND2X0_RVT U173 ( .A1(price[0]), .A2(n246), .Y(n232) );
  AO222X1_RVT U174 ( .A1(display[1]), .A2(n247), .A3(display[1]), .A4(n232), 
        .A5(n247), .A6(n232), .Y(intadd_0_CI) );
  AND4X1_RVT U175 ( .A1(state_out[0]), .A2(confirm), .A3(n243), .A4(n244), .Y(
        n154) );
  NOR4X1_RVT U176 ( .A1(stock[3]), .A2(stock[2]), .A3(stock[1]), .A4(stock[0]), 
        .Y(n152) );
  INVX0_RVT U177 ( .A(intadd_0_n1), .Y(n237) );
  AO22X1_RVT U178 ( .A1(n152), .A2(n245), .A3(n237), .A4(n255), .Y(n155) );
  NAND2X0_RVT U179 ( .A1(u_control_unit_check_wait), .A2(n155), .Y(n153) );
  OA221X1_RVT U180 ( .A1(n154), .A2(n187), .A3(n154), .A4(n153), .A5(n230), 
        .Y(u_control_unit_N21) );
  AND4X1_RVT U181 ( .A1(state_out[1]), .A2(u_control_unit_check_wait), .A3(
        n243), .A4(n155), .Y(n156) );
  AO222X1_RVT U182 ( .A1(n230), .A2(dispense), .A3(n230), .A4(error), .A5(n230), .A6(n156), .Y(u_control_unit_N22) );
  NAND2X0_RVT U183 ( .A1(state_out[2]), .A2(n244), .Y(n204) );
  NAND2X0_RVT U184 ( .A1(n157), .A2(n204), .Y(n158) );
  OA221X1_RVT U185 ( .A1(u_control_unit_check_wait), .A2(n187), .A3(n254), 
        .A4(n158), .A5(n230), .Y(n136) );
  NAND2X0_RVT U186 ( .A1(sel_item[1]), .A2(n147), .Y(n193) );
  INVX0_RVT U187 ( .A(sel_item[1]), .Y(n195) );
  MUX41X1_RVT U188 ( .A1(u_memory_mem[9]), .A3(u_memory_mem[19]), .A2(
        u_memory_mem[4]), .A4(u_memory_mem[14]), .S0(n195), .S1(n147), .Y(n200) );
  MUX41X1_RVT U189 ( .A1(u_memory_mem[8]), .A3(u_memory_mem[18]), .A2(
        u_memory_mem[3]), .A4(u_memory_mem[13]), .S0(n195), .S1(n147), .Y(n199) );
  MUX41X1_RVT U190 ( .A1(u_memory_mem[7]), .A3(u_memory_mem[17]), .A2(
        u_memory_mem[2]), .A4(u_memory_mem[12]), .S0(n195), .S1(n147), .Y(n198) );
  MUX41X1_RVT U191 ( .A1(u_memory_mem[0]), .A3(u_memory_mem[10]), .A2(
        u_memory_mem[5]), .A4(u_memory_mem[15]), .S0(n195), .S1(n146), .Y(n196) );
  MUX41X1_RVT U192 ( .A1(u_memory_mem[6]), .A3(u_memory_mem[16]), .A2(
        u_memory_mem[1]), .A4(u_memory_mem[11]), .S0(n195), .S1(n147), .Y(n197) );
  OR2X1_RVT U193 ( .A1(n196), .A2(n197), .Y(n163) );
  OR2X1_RVT U194 ( .A1(n198), .A2(n163), .Y(n165) );
  OR2X1_RVT U195 ( .A1(n199), .A2(n165), .Y(n167) );
  OR2X1_RVT U196 ( .A1(n200), .A2(n167), .Y(n168) );
  NAND2X0_RVT U197 ( .A1(n168), .A2(dispense), .Y(n177) );
  OA21X1_RVT U198 ( .A1(n193), .A2(n177), .A3(n231), .Y(n170) );
  INVX0_RVT U199 ( .A(n196), .Y(n159) );
  INVX0_RVT U200 ( .A(n170), .Y(n161) );
  AND2X1_RVT U201 ( .A1(n231), .A2(n161), .Y(n169) );
  AO22X1_RVT U202 ( .A1(u_memory_mem[0]), .A2(n170), .A3(n159), .A4(n169), .Y(
        n135) );
  INVX0_RVT U203 ( .A(n163), .Y(n160) );
  AO21X1_RVT U204 ( .A1(n196), .A2(n197), .A3(n160), .Y(n180) );
  AO221X1_RVT U205 ( .A1(n180), .A2(n161), .A3(n170), .A4(u_memory_mem[1]), 
        .A5(rst), .Y(n134) );
  INVX0_RVT U206 ( .A(n165), .Y(n162) );
  AO21X1_RVT U207 ( .A1(n198), .A2(n163), .A3(n162), .Y(n182) );
  AO22X1_RVT U208 ( .A1(u_memory_mem[2]), .A2(n170), .A3(n169), .A4(n182), .Y(
        n133) );
  INVX0_RVT U209 ( .A(n167), .Y(n164) );
  AO21X1_RVT U210 ( .A1(n199), .A2(n165), .A3(n164), .Y(n183) );
  AO22X1_RVT U211 ( .A1(u_memory_mem[3]), .A2(n170), .A3(n169), .A4(n183), .Y(
        n132) );
  INVX0_RVT U212 ( .A(n168), .Y(n166) );
  AO21X1_RVT U213 ( .A1(n200), .A2(n167), .A3(n166), .Y(n184) );
  AO22X1_RVT U214 ( .A1(u_memory_mem[4]), .A2(n170), .A3(n169), .A4(n184), .Y(
        n131) );
  NAND2X0_RVT U215 ( .A1(sel_item[1]), .A2(n146), .Y(n190) );
  OA21X1_RVT U216 ( .A1(n190), .A2(n177), .A3(n231), .Y(n173) );
  INVX0_RVT U217 ( .A(n173), .Y(n171) );
  NAND2X0_RVT U218 ( .A1(n196), .A2(n231), .Y(n179) );
  AO22X1_RVT U219 ( .A1(n173), .A2(u_memory_mem[5]), .A3(n171), .A4(n179), .Y(
        n127) );
  AO221X1_RVT U220 ( .A1(n180), .A2(n171), .A3(n173), .A4(u_memory_mem[6]), 
        .A5(rst), .Y(n126) );
  AND2X1_RVT U221 ( .A1(n231), .A2(n171), .Y(n172) );
  AO22X1_RVT U222 ( .A1(u_memory_mem[7]), .A2(n173), .A3(n172), .A4(n182), .Y(
        n125) );
  AO22X1_RVT U223 ( .A1(u_memory_mem[8]), .A2(n173), .A3(n172), .A4(n183), .Y(
        n124) );
  AO22X1_RVT U224 ( .A1(u_memory_mem[9]), .A2(n173), .A3(n172), .A4(n184), .Y(
        n123) );
  NAND2X0_RVT U225 ( .A1(n147), .A2(n195), .Y(n191) );
  OA21X1_RVT U226 ( .A1(n191), .A2(n177), .A3(n231), .Y(n176) );
  INVX0_RVT U227 ( .A(n176), .Y(n174) );
  AO22X1_RVT U228 ( .A1(n176), .A2(u_memory_mem[10]), .A3(n174), .A4(n179), 
        .Y(n119) );
  AND2X1_RVT U229 ( .A1(n231), .A2(n174), .Y(n175) );
  AO22X1_RVT U230 ( .A1(u_memory_mem[11]), .A2(n176), .A3(n175), .A4(n180), 
        .Y(n118) );
  AO221X1_RVT U231 ( .A1(n182), .A2(n174), .A3(n176), .A4(u_memory_mem[12]), 
        .A5(rst), .Y(n117) );
  AO22X1_RVT U232 ( .A1(u_memory_mem[13]), .A2(n176), .A3(n175), .A4(n183), 
        .Y(n116) );
  AO22X1_RVT U233 ( .A1(u_memory_mem[14]), .A2(n176), .A3(n175), .A4(n184), 
        .Y(n115) );
  NAND2X0_RVT U234 ( .A1(n195), .A2(n146), .Y(n178) );
  OA21X1_RVT U235 ( .A1(n178), .A2(n177), .A3(n231), .Y(n186) );
  INVX0_RVT U236 ( .A(n186), .Y(n181) );
  AO22X1_RVT U237 ( .A1(n186), .A2(u_memory_mem[15]), .A3(n181), .A4(n179), 
        .Y(n111) );
  AND2X1_RVT U238 ( .A1(n231), .A2(n181), .Y(n185) );
  AO22X1_RVT U239 ( .A1(u_memory_mem[16]), .A2(n186), .A3(n185), .A4(n180), 
        .Y(n110) );
  AO221X1_RVT U240 ( .A1(n182), .A2(n181), .A3(n186), .A4(u_memory_mem[17]), 
        .A5(rst), .Y(n109) );
  AO22X1_RVT U241 ( .A1(u_memory_mem[18]), .A2(n186), .A3(n185), .A4(n183), 
        .Y(n108) );
  AO22X1_RVT U242 ( .A1(u_memory_mem[19]), .A2(n186), .A3(n185), .A4(n184), 
        .Y(n107) );
  NAND2X0_RVT U243 ( .A1(n187), .A2(n254), .Y(n188) );
  INVX0_RVT U244 ( .A(n189), .Y(n202) );
  AND2X1_RVT U245 ( .A1(n231), .A2(n189), .Y(n201) );
  AO22X1_RVT U246 ( .A1(price[0]), .A2(n202), .A3(n201), .A4(n146), .Y(n103)
         );
  NAND2X0_RVT U247 ( .A1(n191), .A2(n190), .Y(n192) );
  AO22X1_RVT U248 ( .A1(n202), .A2(price[1]), .A3(n201), .A4(n192), .Y(n102)
         );
  INVX0_RVT U249 ( .A(n193), .Y(n194) );
  AO22X1_RVT U250 ( .A1(n194), .A2(n201), .A3(n202), .A4(price[2]), .Y(n101)
         );
  AO22X1_RVT U251 ( .A1(price[3]), .A2(n202), .A3(n201), .A4(n146), .Y(n100)
         );
  AO22X1_RVT U252 ( .A1(price[4]), .A2(n202), .A3(n201), .A4(n195), .Y(n99) );
  AO22X1_RVT U253 ( .A1(n147), .A2(n201), .A3(n202), .A4(price[5]), .Y(n98) );
  AO22X1_RVT U254 ( .A1(sel_item[1]), .A2(n201), .A3(n202), .A4(price[6]), .Y(
        n97) );
  AO22X1_RVT U255 ( .A1(n202), .A2(stock[0]), .A3(n201), .A4(n196), .Y(n96) );
  AO22X1_RVT U256 ( .A1(n202), .A2(stock[1]), .A3(n201), .A4(n197), .Y(n95) );
  AO22X1_RVT U257 ( .A1(n202), .A2(stock[2]), .A3(n201), .A4(n198), .Y(n94) );
  AO22X1_RVT U258 ( .A1(n202), .A2(stock[3]), .A3(n201), .A4(n199), .Y(n93) );
  AO22X1_RVT U259 ( .A1(n202), .A2(stock[4]), .A3(n201), .A4(n200), .Y(n92) );
  OAI21X1_RVT U260 ( .A1(n246), .A2(coin_in[1]), .A3(coin_in[0]), .Y(n203) );
  NAND2X0_RVT U261 ( .A1(display[1]), .A2(n203), .Y(n210) );
  OA21X1_RVT U262 ( .A1(display[1]), .A2(n203), .A3(n210), .Y(n207) );
  AND2X1_RVT U264 ( .A1(n230), .A2(n204), .Y(n242) );
  INVX0_RVT U265 ( .A(n227), .Y(n205) );
  AO22X1_RVT U267 ( .A1(n227), .A2(n207), .A3(display[1]), .A4(n229), .Y(n88)
         );
  INVX0_RVT U268 ( .A(coin_in[1]), .Y(n216) );
  AO21X1_RVT U269 ( .A1(n208), .A2(coin_in[1]), .A3(n229), .Y(n209) );
  OA222X1_RVT U270 ( .A1(display[0]), .A2(n227), .A3(display[0]), .A4(n216), 
        .A5(n246), .A6(n209), .Y(n87) );
  NAND2X0_RVT U271 ( .A1(coin_in[0]), .A2(coin_in[1]), .Y(n219) );
  NAND2X0_RVT U272 ( .A1(n219), .A2(n210), .Y(n211) );
  NAND2X0_RVT U273 ( .A1(display[2]), .A2(n211), .Y(n213) );
  OA21X1_RVT U274 ( .A1(display[2]), .A2(n211), .A3(n213), .Y(n212) );
  AO22X1_RVT U275 ( .A1(n227), .A2(n212), .A3(display[2]), .A4(n229), .Y(n86)
         );
  INVX0_RVT U276 ( .A(n213), .Y(n215) );
  AO22X1_RVT U277 ( .A1(n227), .A2(n214), .A3(n229), .A4(display[3]), .Y(n85)
         );
  FADDX1_RVT U278 ( .A(display[3]), .B(n216), .CI(n215), .CO(n220), .S(n214)
         );
  FADDX1_RVT U279 ( .A(display[4]), .B(n220), .CI(n219), .S(n217) );
  AO22X1_RVT U280 ( .A1(n227), .A2(n217), .A3(n229), .A4(display[4]), .Y(n84)
         );
  AO222X1_RVT U281 ( .A1(display[4]), .A2(n220), .A3(display[4]), .A4(n219), 
        .A5(n220), .A6(n219), .Y(n221) );
  FADDX1_RVT U282 ( .A(coin_in[1]), .B(display[5]), .CI(n221), .S(n218) );
  AO22X1_RVT U283 ( .A1(n227), .A2(n218), .A3(n229), .A4(display[5]), .Y(n83)
         );
  INVX0_RVT U284 ( .A(n219), .Y(n225) );
  OR2X1_RVT U285 ( .A1(display[4]), .A2(n220), .Y(n222) );
  AO222X1_RVT U286 ( .A1(display[5]), .A2(coin_in[1]), .A3(display[5]), .A4(
        n222), .A5(coin_in[1]), .A6(n221), .Y(n224) );
  AO22X1_RVT U287 ( .A1(n227), .A2(n223), .A3(n229), .A4(display[6]), .Y(n82)
         );
  FADDX1_RVT U288 ( .A(display[6]), .B(n225), .CI(n224), .CO(n226), .S(n223)
         );
  HADDX1_RVT U289 ( .A0(display[7]), .B0(n226), .SO(n228) );
  AO22X1_RVT U290 ( .A1(display[7]), .A2(n229), .A3(n228), .A4(n227), .Y(n81)
         );
  AND4X1_RVT U291 ( .A1(state_out[2]), .A2(n230), .A3(n253), .A4(n244), .Y(
        n238) );
  OA21X1_RVT U292 ( .A1(cancel), .A2(error), .A3(n231), .Y(n240) );
  AO21X1_RVT U293 ( .A1(n238), .A2(n256), .A3(n240), .Y(n233) );
  INVX0_RVT U294 ( .A(n232), .Y(n234) );
  AO222X1_RVT U295 ( .A1(n233), .A2(display[0]), .A3(n238), .A4(n234), .A5(
        n242), .A6(change_out[0]), .Y(n80) );
  FADDX1_RVT U296 ( .A(display[1]), .B(price[1]), .CI(n234), .S(n235) );
  AO22X1_RVT U297 ( .A1(n242), .A2(change_out[1]), .A3(n238), .A4(n235), .Y(
        n236) );
  AO21X1_RVT U298 ( .A1(display[1]), .A2(n240), .A3(n236), .Y(n79) );
  AO222X1_RVT U299 ( .A1(display[2]), .A2(n240), .A3(n242), .A4(change_out[2]), 
        .A5(intadd_0_SUM_0_), .A6(n238), .Y(n78) );
  AO222X1_RVT U300 ( .A1(n242), .A2(change_out[3]), .A3(n238), .A4(
        intadd_0_SUM_1_), .A5(display[3]), .A6(n240), .Y(n77) );
  AO222X1_RVT U301 ( .A1(n242), .A2(change_out[4]), .A3(n240), .A4(display[4]), 
        .A5(intadd_0_SUM_2_), .A6(n238), .Y(n76) );
  AO222X1_RVT U302 ( .A1(n242), .A2(change_out[5]), .A3(n240), .A4(display[5]), 
        .A5(intadd_0_SUM_3_), .A6(n238), .Y(n75) );
  AO222X1_RVT U303 ( .A1(n242), .A2(change_out[6]), .A3(n238), .A4(
        intadd_0_SUM_4_), .A5(display[6]), .A6(n240), .Y(n74) );
  HADDX1_RVT U304 ( .A0(display[7]), .B0(n237), .SO(n239) );
  AO22X1_RVT U305 ( .A1(display[7]), .A2(n240), .A3(n239), .A4(n238), .Y(n241)
         );
  AO21X1_RVT U306 ( .A1(n242), .A2(change_out[7]), .A3(n241), .Y(n73) );
  DFFSSRX1_RVT u_control_unit_check_wait_reg ( .D(1'b0), .SETB(1'b0), .RSTB(
        n136), .CLK(clk), .Q(u_control_unit_check_wait), .QN(n254) );
  DFFSSRX1_RVT u_control_unit_current_state_reg_0_ ( .D(1'b0), .SETB(1'b0), 
        .RSTB(u_control_unit_N20), .CLK(clk), .Q(state_out[0]), .QN(n253) );
  DFFSSRX1_RVT u_memory_price_reg_6_ ( .D(1'b0), .SETB(1'b0), .RSTB(n97), 
        .CLK(clk), .Q(price[6]), .QN(n252) );
  DFFSSRX1_RVT u_memory_price_reg_5_ ( .D(1'b0), .SETB(1'b0), .RSTB(n98), 
        .CLK(clk), .Q(price[5]), .QN(n251) );
  DFFSSRX1_RVT u_memory_price_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n101), 
        .CLK(clk), .Q(price[2]), .QN(n248) );
  DFFSSRX1_RVT u_memory_price_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n99), 
        .CLK(clk), .Q(price[4]), .QN(n250) );
  DFFSSRX1_RVT u_memory_price_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n100), 
        .CLK(clk), .Q(price[3]), .QN(n249) );
  DFFSSRX1_RVT u_memory_price_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n103), 
        .CLK(clk), .Q(price[0]), .QN(n256) );
  DFFSSRX1_RVT u_memory_stock_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n92), 
        .CLK(clk), .Q(stock[4]), .QN(n245) );
  DFFSSRX1_RVT u_memory_price_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n102), 
        .CLK(clk), .Q(price[1]), .QN(n247) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n87), 
        .CLK(clk), .Q(display[0]), .QN(n246) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_7_ ( .D(1'b0), .SETB(1'b0), .RSTB(n81), 
        .CLK(clk), .Q(display[7]), .QN(n255) );
  DFFSSRX1_RVT u_control_unit_current_state_reg_1_ ( .D(1'b0), .SETB(1'b0), 
        .RSTB(u_control_unit_N21), .CLK(clk), .Q(state_out[1]), .QN(n244) );
  DFFSSRX1_RVT u_control_unit_current_state_reg_2_ ( .D(1'b0), .SETB(1'b0), 
        .RSTB(u_control_unit_N22), .CLK(clk), .Q(state_out[2]), .QN(n243) );
  DFFSSRX1_RVT change_out_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n80), .CLK(clk), .Q(change_out[0]) );
  DFFSSRX1_RVT change_out_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n78), .CLK(clk), .Q(change_out[2]) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n88), 
        .CLK(clk), .Q(display[1]) );
  DFFSSRX1_RVT u_memory_stock_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n93), 
        .CLK(clk), .Q(stock[3]) );
  DFFSSRX1_RVT u_memory_stock_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n94), 
        .CLK(clk), .Q(stock[2]) );
  DFFSSRX1_RVT u_memory_stock_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n95), 
        .CLK(clk), .Q(stock[1]) );
  DFFSSRX1_RVT u_memory_stock_reg_0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n96), 
        .CLK(clk), .Q(stock[0]) );
  DFFSSRX1_RVT change_out_reg_1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n79), .CLK(clk), .Q(change_out[1]) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n86), 
        .CLK(clk), .Q(display[2]) );
  DFFSSRX1_RVT change_out_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n77), .CLK(clk), .Q(change_out[3]) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n85), 
        .CLK(clk), .Q(display[3]) );
  DFFSSRX1_RVT change_out_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n76), .CLK(clk), .Q(change_out[4]) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n84), 
        .CLK(clk), .Q(display[4]) );
  DFFSSRX1_RVT u_memory_mem_reg_2__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n127), 
        .CLK(clk), .Q(u_memory_mem[5]) );
  DFFSSRX1_RVT u_memory_mem_reg_1__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n119), 
        .CLK(clk), .Q(u_memory_mem[10]) );
  DFFSSRX1_RVT u_memory_mem_reg_0__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n111), 
        .CLK(clk), .Q(u_memory_mem[15]) );
  DFFSSRX1_RVT change_out_reg_5_ ( .D(1'b0), .SETB(1'b0), .RSTB(n75), .CLK(clk), .Q(change_out[5]) );
  DFFSSRX1_RVT u_memory_mem_reg_3__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n134), 
        .CLK(clk), .Q(u_memory_mem[1]) );
  DFFSSRX1_RVT u_memory_mem_reg_2__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n126), 
        .CLK(clk), .Q(u_memory_mem[6]) );
  DFFSSRX1_RVT u_memory_mem_reg_1__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n117), 
        .CLK(clk), .Q(u_memory_mem[12]) );
  DFFSSRX1_RVT u_memory_mem_reg_0__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n109), 
        .CLK(clk), .Q(u_memory_mem[17]) );
  DFFSSRX1_RVT u_memory_mem_reg_3__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n131), 
        .CLK(clk), .Q(u_memory_mem[4]) );
  DFFSSRX1_RVT u_memory_mem_reg_3__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n132), 
        .CLK(clk), .Q(u_memory_mem[3]) );
  DFFSSRX1_RVT u_memory_mem_reg_3__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n133), 
        .CLK(clk), .Q(u_memory_mem[2]) );
  DFFSSRX1_RVT u_memory_mem_reg_2__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n123), 
        .CLK(clk), .Q(u_memory_mem[9]) );
  DFFSSRX1_RVT u_memory_mem_reg_2__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n124), 
        .CLK(clk), .Q(u_memory_mem[8]) );
  DFFSSRX1_RVT u_memory_mem_reg_2__2_ ( .D(1'b0), .SETB(1'b0), .RSTB(n125), 
        .CLK(clk), .Q(u_memory_mem[7]) );
  DFFSSRX1_RVT u_memory_mem_reg_1__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n115), 
        .CLK(clk), .Q(u_memory_mem[14]) );
  DFFSSRX1_RVT u_memory_mem_reg_1__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n116), 
        .CLK(clk), .Q(u_memory_mem[13]) );
  DFFSSRX1_RVT u_memory_mem_reg_1__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n118), 
        .CLK(clk), .Q(u_memory_mem[11]) );
  DFFSSRX1_RVT u_memory_mem_reg_0__4_ ( .D(1'b0), .SETB(1'b0), .RSTB(n107), 
        .CLK(clk), .Q(u_memory_mem[19]) );
  DFFSSRX1_RVT u_memory_mem_reg_0__3_ ( .D(1'b0), .SETB(1'b0), .RSTB(n108), 
        .CLK(clk), .Q(u_memory_mem[18]) );
  DFFSSRX1_RVT u_memory_mem_reg_0__1_ ( .D(1'b0), .SETB(1'b0), .RSTB(n110), 
        .CLK(clk), .Q(u_memory_mem[16]) );
  DFFSSRX1_RVT u_memory_mem_reg_3__0_ ( .D(1'b0), .SETB(1'b0), .RSTB(n135), 
        .CLK(clk), .Q(u_memory_mem[0]) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_5_ ( .D(1'b0), .SETB(1'b0), .RSTB(n83), 
        .CLK(clk), .Q(display[5]) );
  DFFSSRX1_RVT change_out_reg_6_ ( .D(1'b0), .SETB(1'b0), .RSTB(n74), .CLK(clk), .Q(change_out[6]) );
  DFFSSRX1_RVT u_credit_reg_credit_reg_6_ ( .D(1'b0), .SETB(1'b0), .RSTB(n82), 
        .CLK(clk), .Q(display[6]) );
  DFFSSRX1_RVT change_out_reg_7_ ( .D(1'b0), .SETB(1'b0), .RSTB(n73), .CLK(clk), .Q(change_out[7]) );
  OA221X1_RVT U266 ( .A1(1'b0), .A2(n230), .A3(n242), .A4(state_out[0]), .A5(
        n205), .Y(n229) );
  INVX0_RVT U163 ( .A(n157), .Y(dispense) );
endmodule

