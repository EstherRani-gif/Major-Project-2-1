`timescale 1ns/1ps
module tb_counter;
reg clk, rst, up_down;
wire [3:0] count;

counter uut(.clk(clk), .rst(rst), .up_down(up_down), .count(count));

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_counter);
    rst = 1; up_down = 1; #10;
    rst = 0; #100;
    up_down = 0; #100;
    $finish;
end
endmodule
