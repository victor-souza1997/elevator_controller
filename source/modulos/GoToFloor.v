`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:59 08/28/2019 
// Design Name: 
// Module Name:    GoToFloor 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GoToFloor(F, B, S, clk);

output reg [3:0]F;
input [3:0]B;
input clk;
input [2:0]S;

initial
	begin
	
	F[3] <= 0;
	F[2] <= 0;
	F[1] <= 0;
	F[0] <= 0;

	end
always @(posedge clk)
begin
	 case ({B,S})
      6'b100000  : F[3] <= 1;
      6'b010000  : F[2] <= 1;
		6'b001000  : F[1] <= 1;
      6'b000100  : F[0] <= 1;
		6'b100011  : F[3] <= 0;
      6'b010010  : F[2] <= 0;
		6'b001001  : F[1] <= 0;
      6'b000100  : F[0] <= 0;
    endcase	
end

endmodule
