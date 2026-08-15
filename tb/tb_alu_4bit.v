// tb_alu_4bit.v
// Simple self-checking testbench for 4-bit ALU

module tb_alu_4bit;

reg  [3:0] a, b;
reg  [2:0] opcode;
wire [3:0] result;
wire       z, c, v, n;
integer errors;

alu_4bit dut (
    .a(a), .b(b), .opcode(opcode),
    .result(result), .z(z), .c(c), .v(v), .n(n)
);

task check;
    input [3:0] exp_result;
    begin
        if (result !== exp_result) begin
            $display("FAIL: a=%b b=%b opcode=%b result=%b expected=%b", a, b, opcode, result, exp_result);
            errors = errors + 1;
        end
    end
endtask

initial begin
    errors = 0;
    $dumpfile("sim/wave.vcd");
    $dumpvars(0, tb_alu_4bit);
    // ADD
    a=4; b=3; opcode=3'b000; #10; check(7);
    // SUB
    a=7; b=3; opcode=3'b001; #10; check(4);
    // AND
    a=4'b1010; b=4'b0110; opcode=3'b010; #10; check(4'b0010);
    // OR
    a=4'b1010; b=4'b0110; opcode=3'b011; #10; check(4'b1110);
    // XOR
    a=4'b1010; b=4'b0110; opcode=3'b100; #10; check(4'b1100);
    // NOT
    a=4'b0000; opcode=3'b101; #10; check(4'b1111);
    // SHL
    a=4'b0001; opcode=3'b110; #10; check(4'b0010);
    // SHR
    a=4'b0010; opcode=3'b111; #10; check(4'b0001);
    if (errors == 0)
        $display("ALL TESTS PASSED");
    else
        $display("FAILED: %0d errors", errors);
    $finish;
end
endmodule