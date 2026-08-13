module full_adder (
    input wire a,b,cin,   // 3 i/ps each 1 bit
    output wire sum,cout  // 2 o/ps each 1 bit
);

assign sum = a ^ b ^ cin;    //dataflow modeling
assign cout = (a & b) | (b & cin) |  (cin & a);
endmodule
