module alu(A,B,Control,Result);
 //declaring inputs
 input [31:0]A,B,Result;
 input [2:0]Control;
 //declaring outputs
 output [31:0]Result;

//declaring interim wires
wire [31:0] a_and_b;
wire [31:0] a_or_b;
wire [31:0] not_b;
wire [31:0] mux_b;
wire [31:0] sum;
wire [31:0] final_mux;

//logic design

assign a_and_b = A & B;
assign a_or_b = A | B;
assign not_b = ~b;

//ternary operator for mux

assign mux_b = Control[0] ? not_b : b;

assign sum = A + mux_b + Control[0];

//designing a 4x1 mux

assign final_mux = ((Control[1:0]==2'b00) || (Control[1:0]==2'b01)) ? sum : (Control[1:0]==2'b10) ? a_and_b : a_or_b;

endmodule
