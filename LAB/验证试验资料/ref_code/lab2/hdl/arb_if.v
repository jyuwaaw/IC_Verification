interface arb_if(input bit clk); 
  logic [1:0] grant, request; 
  logic reset; 

  clocking cb @(posedge clk); 
    output request; 
    input grant; 
  endclocking

  modport DUT (input request, reset,
               output grant);

  modport TEST (clocking cb,
                output reset);

endinterface
