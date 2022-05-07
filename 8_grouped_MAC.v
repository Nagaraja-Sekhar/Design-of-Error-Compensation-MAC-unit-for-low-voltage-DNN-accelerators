`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2022 09:41:04
// Design Name: 
// Module Name: 8_grouped_MAC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module group_8_MAC(
    input [7:0] weight_1, weight_2, weight_3, weight_4,
        weight_5, weight_6, weight_7, weight_8,
    input [7:0] activation_1, activation_2, activation_3, activation_4,
        activation_5, activation_6, activation_7, activation_8,
    input [23:0] partial_sum_in,
    input [15:0] error_product_in,
    input error_in,
    input clk,
    input delay_clk,
    output [7:0] next_activation_1, next_activation_2, next_activation_3,
        next_activation_4, next_activation_5, next_activation_6, 
        next_activation_7, next_activation_8,
    output [23:0] partial_sum_out,
    output [15:0] error_product_out,
    output error_out
    );
    
    wire [23:0] partial_sum_out_1, partial_sum_out_2, partial_sum_out_3,
        partial_sum_out_4, partial_sum_out_5, partial_sum_out_6,
        partial_sum_out_7;
    wire [15:0] error_product_out_1, error_product_out_2, 
        error_product_out_3, error_product_out_4, error_product_out_5,
        error_product_out_6, error_product_out_7;
    wire error_out_1, error_out_2, error_out_3, error_out_4, error_out_5,
        error_out_6;
        
    // MAC 1
    type1_MAC T1_1(weight_1, activation_1, partial_sum_in, 
        error_product_in, error_in, clk, delay_clk, 
        next_activation_1, partial_sum_out_1, error_product_out_1, 
        error_out_1);
        
    // MAC 2
    type1_MAC T1_2(weight_2, activation_2, partial_sum_out_1, 
        error_product_out_1, error_out_1, clk, delay_clk, 
        next_activation_2, partial_sum_out_2, error_product_out_2, 
        error_out_2);
        
    // MAC 3
    type1_MAC T1_3(weight_3, activation_3, partial_sum_out_2, 
        error_product_out_2, error_out_2, clk, delay_clk, 
        next_activation_3, partial_sum_out_3, error_product_out_3, 
        error_out_3);
        
    // MAC 4
    type1_MAC T1_4(weight_4, activation_4, partial_sum_out_3, 
        error_product_out_3, error_out_3, clk, delay_clk, 
        next_activation_4, partial_sum_out_4, error_product_out_4, 
        error_out_4);
        
    // MAC 5
    type1_MAC T1_5(weight_5, activation_5, partial_sum_out_4, 
        error_product_out_4, error_out_4, clk, delay_clk, 
        next_activation_5, partial_sum_out_5, error_product_out_5, 
        error_out_5);
        
     // MAC 6
     type1_MAC T1_6(weight_6, activation_6, partial_sum_out_5, 
        error_product_out_5, error_out_5, clk, delay_clk, 
        next_activation_6, partial_sum_out_6, error_product_out_6, 
        error_out_6);
        
     // MAC 7
     type2_MAC T2_7(weight_7, activation_7, partial_sum_out_6, 
        error_product_out_6, error_out_6, clk, delay_clk, 
        next_activation_7, partial_sum_out_7, error_product_out_7);
        
     // MAC 8
     type3_MAC T3_8(weight_8, activation_8, partial_sum_out_7, 
        error_product_out_7, clk, delay_clk, next_activation_8, 
        partial_sum_out, error_product_out, error_out);
        
        
endmodule
