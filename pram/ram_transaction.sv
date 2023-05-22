class ramp_transaction;
logic pclk, psel, penable;
rand bit pwrite, presetn;
randc bit  [31:0]pwdata,paddr;
logic pready;
logic [31:0]prdata;
  constraint c_addr {paddr>=0; paddr<=4;}
endclass