`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2022 18:59:50
// Design Name: 
// Module Name: rtz
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


module rtz(
    input [15:0] error_product,
    output [15:0] rounded_error_product
    );
    
    reg [15:0] err_prod;
    // considering error_product is the 16-bit data 
    // and m-bit MSB is taken
    // left shift is 16-m to get 2^(16-m)
    reg [15:0] divisor = 16'h1<<(16-14);
    reg [15:0] quotient = 16'h0;
    reg [15:0] buffer = 16'h0;
    
    reg [4:0] count;
    // division operation
    always @ (error_product)
    begin
        err_prod=error_product;
        for(count = 5'd16; count > 0; count = count - 1'b1)
        begin
            buffer = {buffer [14:0], err_prod [15]};
            err_prod = err_prod << 1;
            quotient = quotient << 1;
            if (buffer >= divisor)
            begin
                quotient = {quotient [15:1], 1'b1};
                buffer = buffer - divisor;
            end
        end
        if (error_product[15]==1'b1)
            quotient=quotient+1;

    end
    
    assign rounded_error_product = quotient*divisor;
    
endmodule
