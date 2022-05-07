`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.01.2022 09:45:11
// Design Name: 
// Module Name: CMAC_unit_default
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


module CMAC_unit_default(
    input [7:0] weight,
    input [7:0] activation,
    input [23:0] partial_sum_in,
    input [15:0] error_product_in,
    input clk,
    input delay_clk,
    output [23:0] partial_sum_out,
    output [15:0] error_product_out,
    output [7:0] next_activation,
    output error_sig,
    output [15:0]mult_out,
    output [23:0] q_out,
    output [23:0] q1_out 
    );
    
    wire [15:0]product;
    wire [23:0]sum1, sum2;
    //wire error;
    reg [15:0]c;
    reg [23:0]q, q_1;
    reg error;
    reg [7:0] weight_1, activation_1;
    
    assign next_activation=activation_1;
    
    adder A1(c, q, sum1);
    multiplier M1(weight_1, activation_1, product);
    adder A2(product, sum1, sum2);
    assign mult_out=sum2;
    
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
        error=(q==q_1)?0:1;
    end
        
    //assign error=q==q_1?0:1;        
    //bit24_xor B1(error, q, q_1);
    assign error_sig=error;
    
    assign q_out=q;
    assign q1_out=q_1;
    
    assign partial_sum_out=error?q_1:sum2;
    assign error_product_out=error?product:16'b0;    
    
endmodule
