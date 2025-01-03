`timescale 1ns/1ns

module vga_driver(
    input wire clk,
    input wire rst,
    output wire hsync,
    output wire vsync,
    output wire display_en,
    output reg [9:0] x,
    output reg [9:0] y
);

    reg [9:0] hcount;
    reg [9:0] vcount;
    

    always @(posedge clk)
    begin :hsync_gen
        if(rst)
            hcount <= 0;
        else
            if(hcount < 800)
                hcount <= hcount + 1;
            else
                hcount <= 0;
    end

    assign hsync = hcount < 96 ? 1'b0: 1'b1;

    always @(posedge clk)
    begin :hsync_pos
        if(rst)
            x <= 0;
        else
            if(hcount >= 144 && hcount < 784)
                x <= x + 1'b1;
            else
                x <= 1'b0;
    end

    always @(posedge clk)
    begin :vsync_gen
        if(rst)
            vcount <= 1'b0;
        else
            if(vcount < 525)
                begin
                    if (hcount == 800)
                        vcount <= vcount + 1'b1;
                end
            else
                vcount <= 0;
    end

    assign vsync = vcount < 2 ? 1'b0: 1'b1;

    always @(posedge clk)
    begin :vsync_pos
        if(rst)
            y <= 1'b0;
        else
            if(vcount >= 35 && vcount < 515)
                begin
                    if(hcount == 800)
                        y <= y + 1'b1;
                end
            else 
                y <= 1'b0;

    end

    assign display_en = vcount >= 35 && hcount >= 144 && vcount < 515 && hcount < 784;

endmodule