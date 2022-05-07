`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.02.2022 11:43:26
// Design Name: 
// Module Name: type1_MAC
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


module type1_MAC(
    input [7:0] weight,
    input [7:0] activation,
    input [23:0] partial_sum_in,
    input [15:0] error_product_in,
    input error_in,
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
    reg e;
    
    wire [15:0] product;
    wire [23:0] sum;
    wire err;
    
    always @ (posedge clk)
    begin
        q<=partial_sum_in;
        c<=error_product_in;
        weight_1<=weight;
        activation_1<=activation;
        e<=error_in;
    end
    
    always @ (posedge delay_clk)
    begin
        q_1<=partial_sum_in;
    end
    
    bit24_xor B1(err, q, q_1);
    
    mac_multiplier M1(weight_1, activation_1, product);
    mac_adder A1(product, q, sum);
    or O1(error_out, e, err);
    
    assign next_activation=activation_1;
    assign error_product_out=({err, e}==2'b10)?product:(({err, e}==2'b01)?c:16'h0);
    assign partial_sum_out=err?q_1:sum;
    
endmodule
