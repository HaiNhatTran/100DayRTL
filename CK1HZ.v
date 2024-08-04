`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:07 01/03/2024 
// Design Name: 
// Module Name:    CK1HZ 
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
module CK1HZ
#(parameter N= 20, M = 10000000)
	( 
		input wire clk, reset,
		output wire q
	);
	// signal declaration
	reg [N-1:0] r_reg;
	wire [N-1:0] r_next;
	// body, register
	always @(posedge clk, posedge reset)
		if (reset)
			r_reg <= 0;
		else
			r_reg<=r_next;
	// next state logic
	assign r_next = (r_reg==M)?0:r_reg + 1;
	// output logic
	assign q=(r_reg<M/2)?0:1;
endmodule