`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:27:32 08/31/2019 
// Design Name: 
// Module Name:    movimento 
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
module movimento(Stage,FF, G,count,clk);

output reg [5:0]Stage;
input [1:0]FF;
input [3:0]G;
input count,clk;


reg atual_est, prox_est;
parameter[3:0] STOP = 3'b000,
					UP = 3'b001,
					CCU = 3'b010,
					DMU = 3'b011,
					DOWN = 3'b100,
					DMD = 3'b101, 
					CCD = 3'b110;
assign x = {FF,G};
initial
	atual_est <= STOP;
always @(posedge clk)
atual_est<=prox_est;

always @(atual_est)
begin
	case(atual_est)
	STOP: if(
	x == 6'b000010 | 
	x == 6'b000100 |
	x == 6'b000110 |
	x == 6'b001000 |
	x == 6'b001010 |
	x == 6'b001100 |
	x == 6'b001110 |
	x == 6'b010100 |
	x == 6'b011000 |
	x == 6'b011100 |
	x == 6'b111000 ) prox_est = UP; else prox_est = atual_est; 
	UP : if(
	x == 6'b01xx1x|
	x == 6'b10x1xx|
	x == 6'b111xxx) prox_est = CCU; else prox_est = atual_est;
	CCU: if(count == 1) prox_est = DMU; else prox_est = atual_est;
	DMU: if(
	x == 6'b0100xx|
	x == 6'b100xxx) prox_est = STOP; 
	else if(
	x == 6'b0101xx |
	x == 6'b0110xx |
	x == 6'b0111xx |
	x == 6'b101xxx ) prox_est = UP;
	else prox_est = DMU;
	
	
	STOP: if(
	x == 6'b110001 | 
	x == 6'b110010 |
	x == 6'b110011 |
	x == 6'b110100 |
	x == 6'b110101 |
	x == 6'b110110 |
	x == 6'b110111 |
	x == 6'b100001 |
	x == 6'b100010 |
	x == 6'b100011 |
	x == 6'b010001 ) prox_est = DOWN; else prox_est = atual_est; 
	DOWN : if(
	x == 6'b01xxxx|
	x == 6'b10x1xx|
	x == 6'b111xxx) prox_est = CCD; else prox_est = atual_est;
	CCD: if(count == 1) prox_est = DMD; else prox_est = atual_est;
	DMD: if(
	x == 6'b10xx00|
	x == 6'b01xxx0) prox_est = STOP; 
	else if(
	x == 6'b10xx01 |
	x == 6'b01xx10 |
	x == 6'b10xx11 |
	x == 6'b01xxx1 ) prox_est = DOWN;
	else prox_est = DMU;
	
	
	
endcase
end
always @(atual_est)
	Stage <= atual_est;

endmodule
