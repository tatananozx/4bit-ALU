module flag_logic (
    input  wire [3:0] result,
    input  wire       cout,
    input  wire       c_msb,
    input  wire [2:0] opcode,      // NEW — needed to gate C and V
    output wire        z,
    output wire        c,
    output wire        v,
    output wire        n
);

wire is_addsub;
assign is_addsub = (opcode == 3'b000) || (opcode == 3'b001);  // ADD or SUB

assign z = (result == 4'b0000);
assign n = result[3];

assign c = is_addsub ? cout        : 1'b0;
assign v = is_addsub ? (c_msb^cout): 1'b0;

endmodule