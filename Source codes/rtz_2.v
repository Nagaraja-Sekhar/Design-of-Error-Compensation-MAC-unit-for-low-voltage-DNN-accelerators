`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2022 23:40:21
// Design Name: 
// Module Name: rtz_2
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


module rtz_2(
    input [15:0] error_product,
    output [15:0] rounded_error_product
    );
    
    reg [15:0] err_prod;
    
    reg [15:0] mask;
    reg [4:0] msb=5'd14;
    reg [15:0] add_bit; 
    reg [4:0] count;
    
    always @ (error_product)
    begin
        err_prod = error_product;
        add_bit = {15'b0, err_prod[15]};
        mask = 16'hffff;
        for(count = 5'd16 - msb; count > 0; count = count - 1'b1)
        begin    
            mask = mask << 1;
            add_bit = add_bit << 1;
        end
                
        err_prod = err_prod & mask;
        err_prod = err_prod + add_bit;
        
    end
    
    assign rounded_error_product = err_prod;
endmodule
