`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2022 00:02:27
// Design Name: 
// Module Name: rhu_test
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


module round_hu_test();
    reg [15:0] a;
    wire [15:0] round_a;
    
    round_hu r1(a,round_a);
       
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
