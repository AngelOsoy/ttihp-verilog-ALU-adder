module tt_um_alu_adder (
    input  [7:0] ui_in,     // Entradas de usuario (control + operandos)
    output [7:0] uo_out,    // Salidas de usuario (resultado)
    input  [7:0] uio_in,    // No usado
    output [7:0] uio_out,   // No usado
    output [7:0] uio_oe,    // No usado
    input        clk,       // Reloj (si lo usas)
    input        rst_n      // Reset (activo bajo)
);

    // Puedes definir cómo interpretar los bits de ui_in
    wire [2:0] ALUControl = ui_in[7:5];
    wire [3:0] A = {1'b0, ui_in[4:2]};
    wire [3:0] B = {2'b00, ui_in[1:0]};

    wire [7:0] Result;
    wire Zero, Negative, Carry, Overflow;

    // Instancia de la ALU de 8 bits
    alu8 my_alu (
        .A({4'b0000, A}),
        .B({4'b0000, B}),
        .ALUControl(ALUControl),
        .Result(Result),
        .Zero(Zero),
        .Negative(Negative),
        .Carry(Carry),
        .Overflow(Overflow)
    );

    // Asignar el resultado a la salida
    assign uo_out = Result;

    // Pines bidireccionales no utilizados
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
