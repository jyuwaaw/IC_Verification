module tb_ram(apb_if.master apbinterface);

//assign #10 apbinterface.preset_n = 1'b1;
//assign #20 apbinterface.preset_n = 1'b1;
//#10 assign apbinterface.preset_n = 1'b0;

initial begin
    force apbinterface.preset_n = 1'b0;
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 0;
    apbinterface.master_cb.pwdata   <= 0;
    apbinterface.master_cb.psel     <= 0;
    apbinterface.master_cb.penable  <= 0;
//data test
#10 
    force apbinterface.preset_n = 1;
#10 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd0;
    apbinterface.master_cb.pwdata   <= 'd1;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd1;
    apbinterface.master_cb.pwdata   <= 'd2;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd2;
    apbinterface.master_cb.pwdata   <= 'd3;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;          
#20 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd3;
    apbinterface.master_cb.pwdata   <= 'd4;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd4;
    apbinterface.master_cb.pwdata   <= 'd5;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd5;
    apbinterface.master_cb.pwdata   <= 'd6;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd6;
    apbinterface.master_cb.pwdata   <= 'd7;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20 
    apbinterface.master_cb.pwrite   <= 1;
    apbinterface.master_cb.paddr    <= 'd7;
    apbinterface.master_cb.pwdata   <= 'd8;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
//address test
#100    
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd0;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd1;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd2;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd3;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd4;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd5;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd6;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#20
    apbinterface.master_cb.pwrite   <= 0;
    apbinterface.master_cb.paddr    <= 'd7;
    apbinterface.master_cb.psel     <= 1;
    apbinterface.master_cb.penable  <= 1;
#500
    //apbinterface.preset_n;
$finish;
end

endmodule