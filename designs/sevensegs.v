`timescale 1ns/1ns

module seven_segment (
    input wire clk,
    input wire rst,
    input [3:0] digit, 
    input dp_enable,      
    output reg [7:0] segments
);
    
    always @(*) begin
        case (digit)
            4'h0: segments[6:0] = 7'b1000000; 
            4'h1: segments[6:0] = 7'b1111001; 
            4'h2: segments[6:0] = 7'b0100100; 
            4'h3: segments[6:0] = 7'b0110000; 
            4'h4: segments[6:0] = 7'b0011001; 
            4'h5: segments[6:0] = 7'b0010010; 
            4'h6: segments[6:0] = 7'b0000010; 
            4'h7: segments[6:0] = 7'b1111000; 
            4'h8: segments[6:0] = 7'b0000000; 
            4'h9: segments[6:0] = 7'b0010000; 
            4'hA: segments[6:0] = 7'b0001000; 
            4'hB: segments[6:0] = 7'b0000011; 
            4'hC: segments[6:0] = 7'b1000110; 
            4'hD: segments[6:0] = 7'b0100001; 
            4'hE: segments[6:0] = 7'b0000110; 
            4'hF: segments[6:0] = 7'b0001110; 
            default: segments[6:0] = 7'b1111111; 
        endcase

        segments[7] = dp_enable ? 1'b0 : 1'b1; 
    end
endmodule

