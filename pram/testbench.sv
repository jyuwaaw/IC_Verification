// Code your testbench here
// or browse Examples

`define num_tr 50  //Number of transactions
//`include "design.sv"
`include "ramp_iface.sv"
`include "ramp_transaction.sv"
`include "ramp_generator.sv" 
`include "ramp_driver.sv"
`include "ramp_receiver.sv"
`include "ramp_scoreboard.sv"
`include "ramp_env.sv"
`include "ramp_tb.sv"
`define MEM DUT.mem

module ramp_top;
  /*clk generation 100MHz */
  bit pclk;
  always #5 pclk=~pclk;

  /*interface instance*/
  ramp_iface intf(pclk);
  
  /*DUT instantiation*/
  ramp DUT(.pclk(intf.pclk),
           .presetn(intf.presetn),
           .paddr(intf.paddr),
           .psel(intf.psel),
           .penable(intf.penable),
           .pwrite(intf.pwrite),
           .pwdata(intf.pwdata),
           .pready(intf.pready),
           .prdata(intf.prdata));
  
  /*TB instantiation*/
  ramp_tb TB(intf);
  
  /*initialilze memory to all 0*/
  initial begin
    foreach(`MEM[i])
      `MEM[i]=0;
  end  
endmodule