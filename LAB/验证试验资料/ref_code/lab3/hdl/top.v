/*******************************************************************************
 *
 * File:        $RCSfile: top.v,v $
 * Revision:    $Revision: 1.7 $  
 * Date:        $Date: 2003/07/15 15:18:31 $
 *
 *******************************************************************************
 *
 * Top level SystemVerilog file that instantiates the APB interface, testbench
 * and design under test
 *
 *******************************************************************************
 * Copyright (c) 1991-2005 by Synopsys Inc.  ALL RIGHTS RESERVED.
 * CONFIDENTIAL AND PROPRIETARY INFORMATION OF SYNOPSYS INC.
 *******************************************************************************
 */

module top;
  parameter simulation_cycle = 100;
  
  bit clk;
  always #(simulation_cycle/2) 
    clk = ~clk;

  apb_if apb(clk); // APB interafce
  test   t1(apb);  // Testbench program
  mem    m1(apb);  // Memory device

endmodule  
