class ramp_receiver;
   virtual ramp_iface inter;
    ramp_transaction trns;
    mailbox mbrs;
    
    function new(mailbox mbrs,virtual ramp_iface inter);
      this.mbrs=mbrs;
      this.inter=inter;
      
    endfunction
    
    task rec;
      repeat(`num_tr)
      begin
      repeat(3)
       begin 
         @(posedge inter.pclk);
       end
      trns=new();
        if(inter.pwrite == 0) begin  
      		$display($time,"RECEIVER BEFORE prdata=%d",inter.prdata);
      		trns.pready=inter.pready;
      		$display($time,"RECEIVER PREADY=%0d",inter.pready);
      		trns.prdata=inter.prdata;
      		$display($time,"RECEIVER PRDATA=%0d",inter.prdata);
      		mbrs.put(trns);    
        end    
      end
    endtask
    
  endclass