interface ramp_iface(input pclk);
logic  psel, penable;
 logic pwrite, presetn;
  logic  [31:0]pwdata,paddr;
logic pready;
logic [31:0]prdata;
logic transfer;
/*
modport dut(input presetn,psel,penable,pwrite,pwdata,pclk,paddr ,output pready,prdata);
modport tb(output presetn,psel,penable,pwrite,pwdata,paddr,input pready,prdata,pclk); */
//modport dut_1(input pclk,transfer,presetn, output pselx, penable);
endinterface