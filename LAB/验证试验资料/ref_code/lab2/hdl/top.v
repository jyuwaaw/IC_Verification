module arb_top;
  bit  clk;
  always #5 clk = !clk; 

  arb_if arbif(clk); 
  arb a1 (arbif, clk);
  test t1(arbif);

endmodule
