`timescale 1ns / 1ps
module adder8(
input [7:0] A,
    input [7:0] B,
    input Cin,
    output [7:0] Sum,
    output Cout
);
    wire [7:0] carry;

    full_adder FA0 (A[0], B[0], Cin, Sum[0], carry[0]);
    full_adder FA1 (A[1], B[1], carry[0], Sum[1], carry[1]);
    full_adder FA2 (A[2], B[2], carry[1], Sum[2], carry[2]);
    full_adder FA3 (A[3], B[3], carry[2], Sum[3], carry[3]);
    full_adder FA4 (A[4], B[4], carry[3], Sum[4], carry[4]);
    full_adder FA5 (A[5], B[5], carry[4], Sum[5], carry[5]);
    full_adder FA6 (A[6], B[6], carry[5], Sum[6], carry[6]);
    full_adder FA7 (A[7], B[7], carry[6], Sum[7], Cout);
endmodule
