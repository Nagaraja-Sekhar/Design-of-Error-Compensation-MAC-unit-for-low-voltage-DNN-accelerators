`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2022 11:37:12
// Design Name: 
// Module Name: 4_grouped_MAC
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


module group_4_MAC(
    input [7:0] weight_1, weight_2, weight_3, weight_4,
    input [7:0] activation_1, activation_2, activation_3, activation_4,
    input [23:0] partial_sum_in,
    input [15:0] error_product_in,
    input error_in,
    input clk,
    input delay_clk,
    output [7:0] next_activation_1, next_activation_2, next_activation_3,
        next_activation_4,
    output [23:0] partial_sum_out,
    output [15:0] error_product_out,
    output error_out
    );
    
    wire [23:0] partial_sum_out_1, partial_sum_out_2, partial_sum_out_3;
    wire [15:0] error_product_out_1, error_product_out_2, 
        error_product_out_3;
    wire error_out_1, error_out_2;
        
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
    type2_MAC T2_3(weight_3, activation_3, partial_sum_out_2, 
        error_product_out_2, error_out_2, clk, delay_clk, 
        next_activation_3, partial_sum_out_3, error_product_out_3);
    
    // MAC 4        
    type3_MAC T3_4(weight_4, activation_4, partial_sum_out_3, 
        error_product_out_3, clk, delay_clk, next_activation_4, 
        partial_sum_out, error_product_out, error_out);  
    
        
endmodule
