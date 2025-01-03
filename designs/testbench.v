`timescale 1ns/1ns

module clock(
    output reg clk
);

    initial clk = 1'b1;
    always #10 clk = !clk;


endmodule

module test;

    wire MAX10_CLK1_50;
    reg [1:0] KEY;
    reg [9:0] SW;
    wire [3:0] VGA_B;
    wire [3:0] VGA_G;
    wire       VGA_HS;
    wire [3:0] VGA_R;
    wire       VGA_VS;

    clock clk1 (
    .clk(MAX10_CLK1_50)
    );

    DE10_LITE_Golden_Top main (
        .MAX10_CLK1_50(MAX10_CLK1_50),
        .KEY(KEY),
        .SW(SW),
        .VGA_B(VGA_B),
        .VGA_G(VGA_G),
        .VGA_HS(VGA_HS),
        .VGA_R(VGA_R),
        .VGA_VS(VGA_VS)
    );

    initial
    begin

        $dumpfile("test.vcd");
        $dumpvars(0,main);
        KEY = 2'b10;
        #40
        KEY = 2'b11;
        #40
        KEY = 2'b01;
        SW = 10'b0000001000;
        #17000000
        SW = 10'b0000000001;
        #17000000
        #17000000
        $dumpoff;
        $finish;
    end
endmodule