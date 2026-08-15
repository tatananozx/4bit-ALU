module alu_4bit (
    input wire [3:0] a,b,
    input wire [2:0] opcode,
    output wire [3:0] result,
    output wire z,c,v,n 
);
wire sub;
assign sub = opcode[0]; 

//outputs of different blocks
wire [3:0] r_addsub, r_and, r_or, r_not, r_xor, r_shl, r_shr;
wire cout, c_msb;

//add_sub_unit
add_sub_unit addsub(.a(a), .b(b), .sub(sub), .sum(r_addsub), .cout(cout), .c_msb(c_msb));

//and_gate instantiated 4 times for 4 bit alu
and_gate g0(.a(a[0]), .b(b[0]), .y(r_and[0]));
and_gate g1(.a(a[1]), .b(b[1]), .y(r_and[1]));
and_gate g2(.a(a[2]), .b(b[2]), .y(r_and[2]));
and_gate g3(.a(a[3]), .b(b[3]), .y(r_and[3]));

//or_gate instantiated 4 times
or_gate g4(.a(a[0]), .b(b[0]), .y(r_or[0]));
or_gate g5(.a(a[1]), .b(b[1]), .y(r_or[1]));
or_gate g6(.a(a[2]), .b(b[2]), .y(r_or[2]));
or_gate g7(.a(a[3]), .b(b[3]), .y(r_or[3]));

//xor_gate instantiated 4 times
xor_gate g8(.a(a[0]), .b(b[0]), .y(r_xor[0]));
xor_gate g9(.a(a[1]), .b(b[1]), .y(r_xor[1]));
xor_gate g10(.a(a[2]), .b(b[2]), .y(r_xor[2]));
xor_gate g11(.a(a[3]), .b(b[3]), .y(r_xor[3]));

//not_a
not_gate g12(.a(a[0]), .y(r_not[0]));
not_gate g13(.a(a[1]), .y(r_not[1]));
not_gate g14(.a(a[2]), .y(r_not[2]));
not_gate g15(.a(a[3]), .y(r_not[3]));

//shift left and right operation
shifter_left g16(.a(a), .y(r_shl));
shifter_right g17(.a(a), .y(r_shr));

//MUX 8:1
mux8to1 mux(.i0(r_addsub), .i1(r_addsub), .i2(r_and), .i3(r_or), .i4(r_xor),
            .i5(r_not), .i6(r_shl), .i7(r_shr), .s(opcode), .y(result));

//FLAGS LOGIC
flag_logic fl(.result(result), .cout(cout), .c_msb(c_msb), .opcode(opcode), .z(z), .c(c), .v(v), .n(n));

endmodule
