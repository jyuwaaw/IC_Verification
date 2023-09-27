/*******************************************************************************
 *
 * File:        $RCSfile: mem.v,v $
 * Revision:    $Revision: 1.7 $  
 * Date:        $Date: 2003/07/15 15:18:31 $
 *
 *******************************************************************************
 *
 *  Top-level module for the memory-mapped register in a dut
 *
 *******************************************************************************
 * Copyright (c) 1991-2005 by Synopsys Inc.  ALL RIGHTS RESERVED.
 * CONFIDENTIAL AND PROPRIETARY INFORMATION OF SYNOPSYS INC.
 *******************************************************************************
 */

module mem(apb_if.Slave apb);



//
// Memory
//
   apb_data_t memory ['h0000:'hffff];

  function apb_data_t memory_read(input apb_addr_t addr);
    return memory[addr];
  endfunction
  
//
// Hardware reset
//
always
begin: do_reset
   integer i;
   
   wait (apb.Rst === 1'b0);
   // Reset the register file
   //for (i = 'h00; i <= 'hffff; i = i + 1) begin
   //   memory[i] = 32'h00;
   //end
   // Disable all blocks
   disable mgmt_if;

   wait (apb.Rst !== 1'b0);
end


//
// Management interface
//

   // Output driver - must be 4-state for Z-drive
   reg [APB_DATA_WIDTH-1:0] Data_out;
   assign apb.PRData = Data_out;

   always
     begin: mgmt_if
	Data_out = 'z;
	
	// Wait for reset to go away
	wait (apb.Rst === 1'b1);

	// Normal operation
	forever begin
	   
	   @ (posedge apb.PClk)
	     if(apb.PSel === 1'b1) begin
		if (apb.PWrite === 1'b1) begin
		   // PWriteite cycle
		   if(apb.PEnable === 1'b0)
		      @(posedge apb.PEnable)
		   memory[apb.PAddr] = apb.PWData;
		end
		else begin
		   // Read cycle
		   if(apb.PEnable === 1'b0)
		      @(posedge apb.PEnable)
		   Data_out <= memory[apb.PAddr];
		end
	     end
	end
     end
endmodule
