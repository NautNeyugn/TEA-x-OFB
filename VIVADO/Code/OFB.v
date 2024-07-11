`timescale 1ns / 1ps

module OFB (
    input wire [63:0] data_in,
    input wire [127:0] key,
    input wire [63:0] iv, // Initialization Vector
    input wire clk,
    input wire reset,
    output reg [63:0] data_out
);
    reg [63:0] feedback;
    wire [63:0] tea_out;

    TEA tea (
        .data_in(feedback),
        .key(key),
        .data_out(tea_out)
    );

    always @(posedge clk) begin
        if (reset) begin
            feedback <= iv;
            data_out <= 64'b0;
        end else begin
            feedback <= tea_out;
            data_out <= data_in ^ tea_out;
        end
    end
endmodule