`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2022 13:25:23
// Design Name: 
// Module Name: 8_grouped_MAC_test
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


module group_8_MAC_test();
    reg [7:0] weight_1, weight_2, weight_3, weight_4,
        weight_5, weight_6, weight_7, weight_8;
    reg [7:0] activation_1, activation_2, activation_3, activation_4,
        activation_5, activation_6, activation_7, activation_8;
    reg [23:0] partial_sum_in;
    reg [15:0] error_product_in;
    reg error_in;
    reg clk, delay_clk;
    
    wire [7:0] next_activation_1, next_activation_2, next_activation_3,
        next_activation_4, next_activation_5, next_activation_6, 
        next_activation_7, next_activation_8;
    wire [23:0] partial_sum_out;
    wire [15:0] error_product_out;
    wire error_out;
    
    group_8_MAC G1(weight_1, weight_2, weight_3, weight_4,
        weight_5, weight_6, weight_7, weight_8, activation_1, 
        activation_2, activation_3, activation_4, activation_5,
        activation_6, activation_7, activation_8, partial_sum_in, 
        error_product_in, error_in, clk, delay_clk,
        next_activation_1, next_activation_2, next_activation_3, 
        next_activation_4, next_activation_5, next_activation_6, 
        next_activation_7, next_activation_8, partial_sum_out, 
        error_product_out, error_out);
        
    initial
    begin
        clk=1'b0;
        delay_clk=1'b0;
        #140 $finish;
    end
    
    always
    begin        
        #5 clk=~clk;
        #2 delay_clk=~delay_clk;
    end
    
    initial
    begin
        partial_sum_in=24'h4000;
        error_product_in=16'h0;
        error_in=1'b0;
        
        weight_1=8'h1;
        activation_1=8'h2;
        weight_2=8'h3;
        activation_2=8'h4;
        weight_3=8'h5;
        activation_3=8'h6;
        weight_4=8'h7;
        activation_4=8'h8;
        weight_5=8'h9;
        activation_5=8'ha;
        weight_6=8'hb;
        activation_6=8'hc;
        weight_7=8'hd;
        activation_7=8'he;
        weight_8=8'hf;
        activation_8=8'h10;
        #6 partial_sum_in=24'h8000;
        
        #118
        partial_sum_in=24'b1000;
        error_product_in=16'h12;
        weight_1=8'h10;
        activation_1=8'hf;
        weight_2=8'he;
        activation_2=8'hd;
        weight_3=8'hc;
        activation_3=8'hb;
        weight_4=8'ha;
        activation_4=8'h9;
        weight_5=8'h8;
        activation_5=8'h7;
        weight_6=8'h6;
        activation_6=8'h5;
        weight_7=8'h4;
        activation_7=8'h3;
        weight_8=8'h2;
        activation_8=8'h1;
        
        #16
        partial_sum_in=24'h4000;
        error_product_in=16'h0;
        error_in=1'b0;
        
        weight_1=8'h1;
        activation_1=8'h2;
        weight_2=8'h3;
        activation_2=8'h4;
        weight_3=8'h5;
        activation_3=8'h6;
        weight_4=8'h7;
        activation_4=8'h8;
        weight_5=8'h9;
        activation_5=8'ha;
        weight_6=8'hb;
        activation_6=8'hc;
        weight_7=8'hd;
        activation_7=8'he;
        weight_8=8'hf;
        activation_8=8'h10;
        #2 partial_sum_in=24'h8000;
    end
endmodule
