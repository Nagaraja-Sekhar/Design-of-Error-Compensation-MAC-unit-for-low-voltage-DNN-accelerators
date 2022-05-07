`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2022 18:29:57
// Design Name: 
// Module Name: type3_MAC
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


module type3_MAC(
    input [7:0] weight,
    input [7:0] activation,
    input [23:0] partial_sum_in,
    input [15:0] error_product_in,
    input clk,
    input delay_clk,
    output [7:0] next_activation,
    output [23:0] partial_sum_out,
    output [15:0] error_product_out,
    output error_out
    );
    
    reg [7:0] weight_1, activation_1;
    reg [15:0] c;
    reg [23:0] q, q_1;
    reg err;
    reg [15:0] error_product_out_1;
    reg [23:0] partial_sum_out_1;
    
    wire [15:0] round_c;
    wire [15:0] product;
    wire [23:0] sum1, sum2;
    
     always @ (posedge clk)
    begin
        q<=partial_sum_in;
        c<=error_product_in;
        weight_1<=weight;
        activation_1<=activation;
    end
    
    always @ (posedge delay_clk)
    begin
        q_1=partial_sum_in;
        err=(q==q_1)?0:1;
        error_product_out_1=err?product:16'h0;
        partial_sum_out_1=err?q_1:sum2; 
    end
    
    round_hu r1(c, round_c);
    
    multiplier M1(weight_1, activation_1, product);
    adder A1(round_c, q, sum1);
    adder A2(product, sum1, sum2);
    
    assign next_activation=activation_1;
    assign error_product_out=error_product_out_1;
    assign partial_sum_out=partial_sum_out_1;
    assign error_out=err;
endmodule
