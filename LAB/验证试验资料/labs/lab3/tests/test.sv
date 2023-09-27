/***************************************************************************
 *
 * File:        $RCSfile: test_00_debug.sv,v $
 * Revision:    $Revision: 1.2 $  
 * Date:        $Date: 2003/07/15 15:18:54 $
 *
 *******************************************************************************
 *
 * This test shows how to run sanity check (purely random)
 * based upon the default verif environment.
 *
 *******************************************************************************
 * Copyright (c) 1991-2005 by Synopsys Inc.  ALL RIGHTS RESERVED.
 * CONFIDENTIAL AND PROPRIETARY INFORMATION OF SYNOPSYS INC.
 *******************************************************************************
 */


program automatic test(apb_if.Master apb);

`include "apb_trans.sv"
`include "apb_if.sv"
`include "apb_master.sv"
`include "apb_gen.sv"

  apb_gen     gen;
  apb_master  mst;

  // APB transaction mailbox. Used to pass transaction
  // from APB gen to APB master (Layered approach)
  mailbox apb_mbox;


initial begin
// Initialize mailbox
   code_here1
    apb_mbox  = ; 
// Call constructor for gen with 3 random transactions, verbose on
// Call constructor for mst, verbose on
   gen      = new(apb_mbox, 3, 1);
   mst      = new(apb, apb_mbox, 1);


// Call reset method of mst
  code_here2
  fork
  // Call main method of mst
      code_here3
  // Call main meth of gen  
    gen.main();
  join_none

  // Wait until mailbox empties
  while (apb_mbox.num > 0)
    @apb.cb;

  // Wait some more clock cycles just to be sure
  repeat(10) @apb.cb;  

  $finish;
end 
endprogram
