`timescale 1ns/1ns
module counter(
    input wire clk,
    input wire rst,
    input wire crst,
    output reg [31:0] cout
);

always @(posedge clk) begin
    if(rst || crst)
        cout <= 0;
    else
        cout <= cout +1;
end

    
endmodule
