`timescale 1ns/1ns

module maze(
    input wire clk,
    input wire rst,
    input wire [3:0] mov,
    output wire [7:0] HEX0,
    output wire [7:0] HEX1,
    output wire [7:0] HEX2,
    output wire [7:0] HEX3,
    output wire [7:0] HEX4,
    output wire [7:0] HEX5,
    output wire hsync,
    output wire vsync,
    output reg [3:0] R,
    output reg [3:0] G,
    output reg [3:0] B
);

    wire [11:0] end_addr = 12'd2110;
    wire display_en;
    wire [9:0] x,y, cursor_x, cursor_y;
    wire div_clk;
    wire q, q_col;
    wire [11:0] tile_pixel;
    wire [11:0] fb_addr, col_addr, pl_addr;
    wire [10:0] tile_addr;
    wire [9:0] xp_old,yp_old, xp_new, yp_new;
    reg crst;
    wire [31:0] cout;
    reg [31:0] timestamp;
    wire dp_enable;
    wire dp_disable;
    wire [3:0] digit [0:5];
    wire [7:0] seg, min, hor;
    wire en;


    assign dp_enable = 1'b1;
    assign dp_disable = 1'b0;

    assign digit[0] = seg%10;
    assign digit[1] = seg/10;
    assign digit[2] = min%10;
    assign digit[3] = min/10;
    assign digit[4] = hor%10;
    assign digit[5] = hor/10;


    assign seg = timestamp%60;
    assign min = (timestamp/60)%60;
    assign hor = timestamp / 3600;

    counter c1 (
        .clk(clk),
        .rst(rst),
        .crst(crst),
        .cout(cout)
    );

    seven_segment s0 (
        .clk(clk),
        .rst(rst),
        .digit(digit[0]),
        .dp_enable(dp_disable),
        .segments(HEX0)
    );

    seven_segment s1 (
        .clk(clk),
        .rst(rst),
        .digit(digit[1]),
        .dp_enable(dp_disable),
        .segments(HEX1)
    );

    seven_segment s2 (
        .clk(clk),
        .rst(rst),
        .digit(digit[2]),
        .dp_enable(dp_enable),
        .segments(HEX2)
    );

    seven_segment s3 (
        .clk(clk),
        .rst(rst),
        .digit(digit[3]),
        .dp_enable(dp_disable),
        .segments(HEX3)
    );

    seven_segment s4 (
        .clk(clk),
        .rst(rst),
        .digit(digit[4]),
        .dp_enable(dp_enable),
        .segments(HEX4)
    );

    seven_segment s5 (
        .clk(clk),
        .rst(rst),
        .digit(digit[5]),
        .dp_enable(dp_disable),
        .segments(HEX5)
    );

    clock_divider div1 (
        .clk(clk),
        .rst(rst),
        .div_clk(div_clk)
    );

    vga_driver vga1 (
        .clk(div_clk),
        .rst(rst),
        .hsync(hsync),
        .vsync(vsync),
        .display_en(display_en),
        .x(x),
        .y(y)
    );

    assign cursor_x = (xp_old-7) & 10'b1xxxxxxxxx ? 0: ((xp_old-7) > 32 ? 32: (xp_old-7));
    assign cursor_y = (yp_old-7) & 10'b1xxxxxxxxx ? 0: ((yp_old-7) > 32 ? 32: (yp_old-7));


    assign fb_addr = (cursor_x+((x+1)/40))+(cursor_y+((y+1)/30))*48;

    assign col_addr = xp_new + yp_new*48;

    assign pl_addr = xp_old + yp_old*48;

    assign tile_addr = x%40+(y%30)*40;



    dual_port_rom #(
        .mem_init("labirinto.mem"),
        .data_width(1),
        .addr_width(12),
        .size(2304)
    ) rom_maze (
        .addr_a(fb_addr),
        .addr_b(col_addr),
        .clk(clk),
        .q_a(q),
        .q_b(q_col)
    );

    dual_port_rom #(
        .mem_init("tile.mem"),
        .data_width(12),
        .addr_width(11),
        .size(1200)
    ) rom_tile (
        .addr_a(tile_addr),
        .addr_b(),
        .clk(clk),
        .q_a(tile_pixel),
        .q_b()
    );

    player p1 (
        .clk(clk),
        .rst(rst),
        .mov(mov),
        .q(q_col),
        .en(en),
        .x_new(xp_new),
        .y_new(yp_new),
        .x_old(xp_old),
        .y_old(yp_old)
    );

    always @(posedge div_clk) begin
        if(rst)
            begin
                {B,G,R} <= 12'h0;
            end
        else
            begin
                if(display_en)
                    begin
                        if(fb_addr == pl_addr)
                            {B,G,R} <= 12'h0FF;
                        else if (fb_addr == end_addr)
                            {B,G,R} <= 12'h00F;
                        else
                            {B,G,R} <= q ? 12'h996:tile_pixel;
                    end
                else
                    {B,G,R} <= 12'h0;
            end
    end

    always @(posedge clk) begin
        if(rst)
            timestamp <= 0;
        else
            if(cout == 50000000 && en)
                begin
                    timestamp <=  timestamp + 1;
                    crst = 1'b1;
                end
            else
                crst = 1'b0;
    end

    assign en = pl_addr != end_addr;
    


endmodule