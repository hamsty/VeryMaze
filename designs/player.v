`timescale 1ns/1ns
module player
(
    input wire clk,
    input wire rst,
    input wire [3:0] mov,
    input wire q,
    input wire en,
    output reg [9:0] x_new,
    output reg [9:0] y_new,
    output reg [9:0] x_old,
    output reg [9:0] y_old
);
    wire [31:0] cout;
    reg crst;

    initial begin
        {x_new,y_new} <= {10'd1,10'd2};
        {x_old,y_old} <= {10'd1,10'd2};
    end
    

    counter c1 (
        .clk(clk),
        .rst(rst),
        .crst(crst),
        .cout(cout)
    );

    always @(posedge clk) begin
        if(rst)
            begin
                {x_new,y_new} <= {10'd1,10'd2};
            end
        else
            begin
                if (cout == 5000000 && en)
                    begin
                        case (mov)
                            4'b0001 : if (x_old+1 < 48) x_new <= x_old + 1;
                            4'b0010 : if (y_old+1 < 48) y_new <= y_old + 1;
                            4'b0100 : if (y_old-1 >= 0) y_new <= y_old - 1;
                            4'b1000 : if (x_old-1 >= 0) x_new <= x_old - 1;
                            default: {x_new,y_new} <= {x_old,y_old};
                        endcase
                    end
            end
    end

    always @(posedge clk) begin
        if(rst)
            begin
                {x_old,y_old} <= {10'd1,10'd2};
                crst <= 1'b0;
            end
        else
            if (cout == 5000000)
                begin
                    if(q)
                        {x_old,y_old} <= {x_new,y_new};
                    else
                        {x_old,y_old} <= {x_old,y_old};
                    crst <= 1'b1;
                end
            else
                crst <= 1'b0;
    end



endmodule