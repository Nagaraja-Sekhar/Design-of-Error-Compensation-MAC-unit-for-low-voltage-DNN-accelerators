`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.02.2022 10:52:09
// Design Name: 
// Module Name: adder_test
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


module adder_test();
    reg [15:0] a; //=16'h1234;
    reg [23:0] b; //=24'h120000;
    
    wire [23:0]z;
    
    adder dut(a,b,z);
    
    initial
    begin
    a=16'hf234;
    b=24'h120000;
    #10
    a=16'hf678;
    b=24'h560000;
    #10 $finish;
    end

endmodule
