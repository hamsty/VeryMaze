`timescale 1ns/1ns

module dual_port_rom
    #(parameter mem_init = "rom.mem", parameter data_width=24, parameter addr_width = 15, parameter size=19200)
    (
    input [addr_width-1:0] addr_a, addr_b,
    input clk,
    output reg [(data_width-1):0] q_a, q_b
);
    reg [data_width-1:0] rom[size-1:0];
    initial
    begin
        $readmemh(mem_init, rom,0,size-1);
    end
    always @ (posedge clk)
    begin
        q_a <= rom[addr_a];
        q_b <= rom[addr_b];
    end
endmodule