`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: PU
// Engineer: Ryan Githae
// 
// Create Date: 08/21/2025 07:53:04 PM
// Design Name: Seven Segment Driver
// Module Name: sevenseg
// Project Name: Seven Segment
// Target Devices: Basys3 FPGA
// Tool Versions: Vivado 2024.2
// Description: A driver to handle driving the four segments of the 
// Seven segment display on the Basys3
// 
// Dependencies: None
// 
// Revision: 1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sevenseg
  #
(
parameter NUM_SEGMENTS = 4,
parameter WIDTH = 16
)
(
input clk,
input reset,
input wire [WIDTH:1] encoded,
output logic decimal_point,
output logic [NUM_SEGMENTS-1:0]    anode,
output logic [6:0]                 cathode
 );
reg[19:0] refresh_counter = '0;
  wire [1:0] activated_anode;
  reg [3:0] activated_cathode;
  
  always_ff@(posedge clk or posedge reset) begin
     if (reset == 1 || refresh_counter == '1) 
        refresh_counter <= 0; 
     else
         refresh_counter <= refresh_counter + 1'b1;
   end
   
   assign activated_anode = refresh_counter[19:18];
   
   always_comb begin
     decimal_point = 1'b1;
     case(activated_anode)
         2'b00: begin
             anode = 4'b0111;
             activated_cathode = encoded[16:13];
             
         end
         2'b01: begin
             anode = 4'b1011;
             activated_cathode = encoded[12:9];
         end
         2'b10: begin
             anode = 4'b1101;
             activated_cathode= encoded[8:5];
         end
         2'b11: begin
             anode = 4'b1110;
             activated_cathode = encoded[4:1];
         end
       endcase
     end
 
   always_ff @(posedge clk) begin
      case (activated_cathode)
        4'h0: cathode[6:0] <= 7'b1000000;
        4'h1: cathode[6:0] <= 7'b1111001;
        4'h2: cathode[6:0] <= 7'b0100100;
        4'h3: cathode[6:0] <= 7'b0110000;
        4'h4: cathode[6:0] <= 7'b0011001;
        4'h5: cathode[6:0] <= 7'b0010010;
        4'h6: cathode[6:0] <= 7'b0000010;
        4'h7: cathode[6:0] <= 7'b1111000;
        4'h8: cathode[6:0] <= 7'b0000000;
        4'h9: cathode[6:0] <= 7'b0010000;
        4'hA: cathode[6:0] <= 7'b0001000;
        4'hB: cathode[6:0] <= 7'b0000011;
        4'hC: cathode[6:0] <= 7'b1000110;
        4'hD: cathode[6:0] <= 7'b0100001;
        4'hE: cathode[6:0] <= 7'b0000110;
        4'hF: cathode[6:0] <= 7'b0001110;
        default: cathode[6:0] <= 7'b1111111;
      endcase
    end
 
 endmodule
