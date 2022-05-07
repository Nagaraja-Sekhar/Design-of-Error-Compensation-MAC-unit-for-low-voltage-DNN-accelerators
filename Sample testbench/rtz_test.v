`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2022 19:41:47
// Design Name: 
// Module Name: rtz_test
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


module rtz_test();
    reg [15:0] a;
    wire [15:0] round_a;
    
    rtz_2 r1(a,round_a);
       
    initial
    begin
        a=16'h5;
        #5 a=16'h4;
        #5 a=16'h7;
        #5 a=16'hc;
        #5 a=16'he;
        #5 a=16'hf;
        #5 a=-16'h1;
        #5 a=-16'h8;
        #5 a=-16'h7;
        #5 a=-16'h4;
        #5 a=-16'h3;
        #5 $finish;
    end 
endmodule
