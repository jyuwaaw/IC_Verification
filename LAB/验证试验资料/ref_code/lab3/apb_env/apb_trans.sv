/***************************************************************************
 *
 * File:        $RCSfile: apb_trans.sv,v $
 * Revision:    $Revision: 1.5 $  
 * Date:        $Date: 2003/07/02 15:47:08 $
 *
 *******************************************************************************
 *
 * APB Transaction Structure
 *
 *******************************************************************************
 * Copyright (c) 1991-2005 by Synopsys Inc.  ALL RIGHTS RESERVED.
 * CONFIDENTIAL AND PROPRIETARY INFORMATION OF SYNOPSYS INC.
 *******************************************************************************
 */

class apb_trans;
    rand apb_addr_t addr;
    rand apb_data_t data;
    rand trans_e                 transaction;
    static int count=0;
    int id, trans_cnt;

    function new;
    id = count++;
    endfunction

    function void display(string prefix);
        case (this.transaction)
          READ:
            $display($time, ": %s Read  Addr=0x%02X Data=0x%02X id=%0d",
                   prefix, addr, data, id);
          WRITE:
            $display($time, ": %s Write Addr=0x%02X Data=0x%02X id=%0d",
                   prefix, addr, data, id);
          default:
            $display($time, ": %s Idle  --------------------------", prefix);
        endcase
  endfunction: display
    
  function apb_trans copy();
    apb_trans to   = new();
    to.addr        = this.addr;
    to.data        = this.data;
    to.transaction = this.transaction;
    copy = to;
  endfunction: copy
  
endclass
