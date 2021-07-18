`timescale 1ns / 1ps

module Control_Motor(motor,select_floor,CCLK,s4,s3,s2,s1);

output [1:0]motor;
input [3:0]select_floor;
input CCLK;
input s4,s3,s2,s1;

wire [3:0]G;
wire [1:0]FF; //Posicao 
wire [5:0]Stage;
wire count;
wire clk, clk2, clk3;

clock_base10 CLK1(clk, 25000, CCLK);
clock_base10 CLK2(clk2,250000,CCLK); //Clock do controlador do elevador
clock_base10 CLK3(clk3, 25000000,CCLK);
positionFloor PF(FF,s4,s3,s2,s1,clk);//Maquina de estado responsável por controlar
															//O andar em que o elevador se encontra. 
															//Nessa maquina cada estado respresenta um estádo
GoToFloor GTF(G, select_floor, FF, clk2);//Modulo responsável por salvar o andar clicado
																// Até que se chegue no mesmo
counter C(out, Stage, clk3);
movimento CM(Stage, FFpostion,F,count,clk3); // Controlador do motor. Tem como saida o
//valor do estagio
															 


endmodule
