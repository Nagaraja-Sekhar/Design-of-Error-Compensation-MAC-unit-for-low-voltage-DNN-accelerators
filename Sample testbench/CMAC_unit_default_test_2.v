`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2022 12:11:55
// Design Name: 
// Module Name: CMAC_unit_default_test
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


module CMAC_unit_default_test_2();
    reg [7:0] weight_1, activation_1, weight_2, activation_2;
    reg [23:0] partial_sum_in_1;
    reg [15:0] error_product_in_1;
    reg clk;
    
    wire delay_clk;
    wire [23:0] partial_sum_out_1, partial_sum_out_2;
    wire [15:0] error_product_out_1, error_product_out_2;
    wire [7:0] next_activation_1, next_activation_2;
    wire error_sig_1, error_sig_2;
    wire [15:0] mult_out_1, mult_out_2;
    wire [23:0] q1_out, q1_1_out, q2_out, q2_2_out;
    
    CMAC_unit_default dut_1(weight_1, activation_1, partial_sum_in_1, 
        error_product_in_1, clk, delay_clk, partial_sum_out_1, 
        error_product_out_1, next_activation_1, error_sig_1, mult_out_1,
        q1_out, q1_1_out);
    CMAC_unit_default dut_2(weight_2, activation_2, partial_sum_out_1,
        error_product_out_1, clk, delay_clk, partial_sum_out_2,
        error_product_out_2, next_activation_2, error_sig_2, mult_out_2,
        q2_out, q2_2_out);
        
        
    initial
    begin
        clk=1'b0;
        #60 $finish;
    end
    
    assign #2 delay_clk = clk;
    
    always
    begin        
        #5 clk=~clk;
    end

    initial
    begin
        partial_sum_in_1=24'h4000;
        error_product_in_1=16'h0;
        
        weight_1=8'h10;
        activation_1=8'h2;
        weight_2=8'h30;
        activation_2=8'h4;
        #6 partial_sum_in_1=24'h8000;
        
        #16
        partial_sum_in_1=24'b1000;
        error_product_in_1=16'h12;
        weight_1=8'h20;
        activation_1=8'h3;
        weight_2=8'h40;
        activation_2=8'h6;
        
        #16
        partial_sum_in_1=24'h4000;
        error_product_in_1=16'h0;
        
        weight_1=8'h10;
        activation_1=8'h2;
        weight_2=8'h30;
        activation_2=8'h4;
        #2 partial_sum_in_1=24'h8000;
        
        
    end
endmodule
