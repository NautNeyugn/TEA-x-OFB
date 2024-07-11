`timescale 1ns / 1ps

module TEA (
    input wire [63:0] data_in,
    input wire [127:0] key,
    output reg [63:0] data_out
);
    reg [31:0] v0, v1, sum;
    reg [31:0] k0, k1, k2, k3;
    integer i;

    always @(*) begin
        v0 = data_in[63:32];
        v1 = data_in[31:0];
        k0 = key[127:96];
        k1 = key[95:64];
        k2 = key[63:32];
        k3 = key[31:0];
        sum = 0;

        for (i = 0; i < 32; i = i + 1) begin
            sum = sum + 32'h9E3779B9;
            v0 = v0 + ((v1 << 4) + k0) ^ (v1 + sum) ^ ((v1 >> 5) + k1);
            v1 = v1 + ((v0 << 4) + k2) ^ (v0 + sum) ^ ((v0 >> 5) + k3);
        end

        data_out = {v0, v1};
    end
endmodule