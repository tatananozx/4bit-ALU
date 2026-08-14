module shifter_right (
    input wire [3:0] a,
    output wire [3:0] y
);

assign y = a >> 1;
endmodule