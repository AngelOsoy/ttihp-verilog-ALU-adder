// src/tt_um_alu8.v
module tt_um_alu8 (
input [7:0] ui_in, // Entradas del usuario (8 pines)
output [7:0] uo_out, // Salidas del usuario (8 pines)
input [7:0] uio_in, // Pines I/O no utilizados
output [7:0] uio_out,
output [7:0] uio_oe,
input ena // Habilita el funcionamiento (alta cuando está activo)
);

rust
Copiar
Editar
// Dividimos ui_in en A y B de 4 bits cada uno
wire [3:0] A = ui_in[7:4];
wire [3:0] B = ui_in[3:0];

// Extendemos A y B a 8 bits (los 4 bits superiores en 0)
wire [7:0] A_ext = {4'b0000, A};
wire [7:0] B_ext = {4'b0000, B};

// Fijamos una operación de la ALU (por ejemplo, suma: 3'b010)
wire [2:0] ALUControl = 3'b010;

wire [7:0] Result;
wire Zero, Negative, Carry, Overflow;

// Instanciamos tu ALU de 8 bits
alu8 my_alu (
    .A(A_ext),
    .B(B_ext),
    .ALUControl(ALUControl),
    .Result(Result),
    .Zero(Zero),
    .Negative(Negative),
    .Carry(Carry),
    .Overflow(Overflow)
);

// Usamos solo los 8 bits de salida para mostrar el resultado
assign uo_out = Result;

// No usamos los pines bidireccionales
assign uio_out = 8'b0;
assign uio_oe  = 8'b0;
endmodule
