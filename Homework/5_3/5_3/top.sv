module top;
bit clk;

assign preset_n = 1'b0;
always #10 clk = ~clk;

apb_if apbinterface(clk);
apb_ram ram32(
    .pclk(apbinterface.pclk),
    .preset_n(apbinterface.preset_n),
    .paddr(apbinterface.paddr),
    .psel(apbinterface.psel),
    .penable(apbinterface.penable),
    .pwdata(apbinterface.pwdata),
    .prdata(apbinterface.prdata),
    .pwrite(apbinterface.pwrite),
    .pready(apbinterface.pready)
);

tb_ram tb(apbinterface);

endmodule