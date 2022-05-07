`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.03.2022 10:34:37
// Design Name: 
// Module Name: type2_MAC_test
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


module type2_MAC_test();
    reg [7:0] weight, activation;
    reg [23:0] partial_sum_in;
    reg [15:0] error_product_in;
    reg error_in;
    reg clk, delay_clk;
    
    wire [7:0] next_activation;
    wire [23:0] partial_sum_out;
    wire [15:0] error_product_out;
    
    type2_MAC T2(weight, activation, partial_sum_in, error_product_in,
        error_in, clk, delay_clk, next_activation, partial_sum_out, 
        error_product_out);
        
    initial
    begin
        clk=1'b0;
        delay_clk=1'b0;
        #60 $finish;
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
        
        weight=8'h10;
        activation=8'h2;
        #6 partial_sum_in=24'h8000;
        
        #10
        partial_sum_in=24'b1000;
        error_product_in=16'h12;
        weight=8'h20;
        activation=8'h3;
        
        #16
        partial_sum_in=24'h4000;
        error_product_in=16'h0;
        error_in=1'b0;
        
        weight=8'h10;
        activation=8'h2;
        #2 partial_sum_in=24'h8000;
        
        #11
        partial_sum_in=24'h2000;
        error_product_in=16'h0;
        error_in=1'b1;
        
        weight=8'h10;
        activation=8'h2;
        #3 partial_sum_in=24'h6000;
    end
    
endmodule
