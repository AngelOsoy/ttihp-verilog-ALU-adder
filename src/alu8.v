`timescale 1ns / 1ps

module alu8(
    input [7:0] A,
    input [7:0] B,
    input [2:0] ALUControl,
    output reg [7:0] Result,
    output Zero, Negative, Carry, Overflow
);
    wire [7:0] B_in;
    wire [7:0] Sum;
    wire Cout;
    wire [7:0] AndOut = A & B;
    wire [7:0] OrOut  = A | B;

    // Si es SUB, invierte B y pone Carry-in en 1
    wire Binvert = ALUControl[2];
    assign B_in = Binvert ? ~B : B;

    adder8 adder_unit (
        .A(A),
        .B(B_in),
        .Cin(Binvert),
        .Sum(Sum),
        .Cout(Cout)
    );

    // Selección de operación
    always @(*) begin
        case (ALUControl[1:0])
            2'b00: Result = AndOut;
            2'b01: Result = OrOut;
            2'b10: Result = Sum;
            2'b11: Result = {7'b0, Sum[7]};  
            default: Result = 8'b0;
        endcase
    end

    assign Zero = (Result == 8'b0);
    assign Negative = Result[7];
    assign Carry = Cout;
    assign Overflow = (A[7] ~^ B_in[7]) & (Result[7] ^ A[7]);  // solo para suma
endmodule
