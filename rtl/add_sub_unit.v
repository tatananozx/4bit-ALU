module add_sub_unit (
    input wire [3:0] a,b,
    input wire sub, //control bit- 0=add & 1=subtract
    output wire [3:0] sum,
    output cout
);

wire [3:0] bmod; // b after conditional inversion

xor_gate x0(.a(b[0]), .b(sub), .y(bmod[0]));
xor_gate x1(.a(b[1]), .b(sub), .y(bmod[1]));
xor_gate x2(.a(b[2]), .b(sub), .y(bmod[2]));
xor_gate x3(.a(b[3]), .b(sub), .y(bmod[3]));

ripple_carryadder rca(.a(a), .b(bmod), .cin(sub), .sum(sum), .cout(cout));
endmodule
