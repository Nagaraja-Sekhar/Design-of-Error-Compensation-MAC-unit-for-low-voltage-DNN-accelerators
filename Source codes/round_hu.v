`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2022 22:21:00
// Design Name: 
// Module Name: rhu
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


module round_hu(
    input [15:0] error_product,
    output [15:0] rounded_error_product
    );
    
    reg [15:0] err_prod;
    // considering error_product is the 16-bit data 
    // and m-bit MSB is taken
    // left shift is 16-m to get 2^(16-m)
    reg [15:0] mask;
    reg [4:0] msb=5'd8;
    reg [15:0] add_bit;
    reg [4:0] count;
    
    always @ (error_product)
    begin
        err_prod = error_product;
        mask = 16'hffff;
        add_bit = 16'h1;
        for(count = 5'd16-msb-1'b1; count > 0; count = count - 1'b1)
        begin
            mask = mask << 1;
            add_bit = add_bit << 1;
        end
        
        //err_prod = err_prod & mask;
        err_prod = err_prod + add_bit;
        
        mask = mask << 1;
        err_prod = err_prod & mask;        
        
    end
    
    assign rounded_error_product = err_prod;
    
endmodule
