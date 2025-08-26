`timescale 1ns / 10ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2025 02:17:45 PM
// Design Name: 
// Module Name: tb
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


module tb();

parameter set_LFSR_WIDTH = 13;

reg clk = 1'b0;

wire [set_LFSR_WIDTH-1:0]LFSR_DATA;
wire [3:0] anode;
wire [7:0] cathode;
wire [3:0] dp;

always begin
    #10 clk <= ~clk;
end

lfsr #(
        .LFSR_WIDTH(set_LFSR_WIDTH)
        )
  lfsr_1(
        .clk(clk),
        .SW(4'b0011),
        .anode(anode),
        .cathode(cathode),
        .dp(dp),
        .result(LFSR_DATA)
        );     
endmodule
