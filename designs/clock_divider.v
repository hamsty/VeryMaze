`timescale 1ns/1ns
module clock_divider(
    input wire clk,
    input wire rst,
    output reg div_clk
);


    always @(posedge clk) begin :divider_blk
        if(rst)
            begin
                div_clk <= 1'b0;
            end
        else
            begin
                    div_clk <= !div_clk;
            end
    end


endmodule
