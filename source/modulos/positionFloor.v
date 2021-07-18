`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:22:24 08/30/2019 
// Design Name: 
// Module Name:    positionFloor 
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
module positionFloor(FF, s4,s3,s2,s1,clk
    );
	 
output reg [1:0]FF;
input s4,s3,s2,s1;
input clk;
reg atual_est, prox_est;
parameter[1:0] S1 = 2'b00,
					S2 = 2'b01,
					S3 = 2'b10,
					S4 = 2'b11;

initial
	atual_est <= S1;
always @(posedge clk)
atual_est<=prox_est;

always @(atual_est or s4 or s3 or s2 or s1)
begin
	case(atual_est)
	S1: if(s2 == 1'b1) prox_est = S2; else prox_est = atual_est; 
	S2: if(s1 == 1'b1) prox_est = S1; else prox_est = atual_est;
	S3: if(s2 == 1'b1) prox_est = S2; else prox_est = atual_est;
	S4: if(s3 == 1'b1) prox_est = S3; else prox_est = atual_est;
	default prox_est = atual_est;
	endcase
end
always @(atual_est)
	FF <= atual_est;

endmodule
