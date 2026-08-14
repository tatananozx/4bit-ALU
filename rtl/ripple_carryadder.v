module ripple_carryadder (    //4bit
    input [3:0] a,b,
    input cin, // single bit
    output [3:0] sum,
    output cout  // single bit
);

wire c1,c2,c3; //intermidate wires  //named port maping
full_adder fa0(.a(a[0]), .b(b[0]), .cin(cin),  .sum(sum[0]), .cout(c1));
full_adder fa1(.a(a[1]), .b(b[1]), .cin(c1),   .sum(sum[1]), .cout(c2));
full_adder fa2(.a(a[2]), .b(b[2]), .cin(c2),   .sum(sum[2]), .cout(c3));
full_adder fa3(.a(a[3]), .b(b[3]), .cin(c3),   .sum(sum[3]), .cout(cout));   
endmodule                                                                                                           //positional port maping
                                                                                                                    //full_adder fa0(a[0], b[0], cin, sum[0], c1);
                                                                                                                    //full_adder fa1(a[1], b[1], c1, sum[1], c2);
                                                                                                                    //full_adder fa0(a[2], b[2], c2, sum[2], c3);
                                                                                                                    //full_adder fa0(a[3], b[3], c3, sum[3], cout);
