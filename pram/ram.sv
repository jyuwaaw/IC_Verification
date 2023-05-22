module ramp(pclk,presetn,paddr, psel, penable, pwrite, pwdata, pready,prdata);
input pclk,presetn, psel, penable, pwrite;
input  [31:0]pwdata,paddr;
output reg pready;
output reg[31:0]prdata;

reg [31:0]mem[31:0];

always@(posedge pclk)
begin
    if(!presetn) 
  		prdata<=32'b0;
 	else
        if(psel & penable)
                begin
                        if(pwrite)
                                begin
                                  //$display($time,"DBG::WRITE MEMORY");
                                  mem[paddr]<=pwdata;
                                end
                         else
                                begin
                                  //$display($time,"DBG::READ DATA");
                                  prdata<=mem[paddr];
                                  //$display($time,"DBG::DUT PRDATA=%0d",prdata);
                                end
                 end
 end 
 assign pready=1; //Device always ready to accept transactions
 
endmodule