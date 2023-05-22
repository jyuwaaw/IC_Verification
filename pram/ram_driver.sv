class ramp_driver;
ramp_transaction ob_tr1;
mailbox mbgd,mbds;
virtual ramp_iface vif;

function new(mailbox m1,mailbox m2, virtual ramp_iface vintf);
  this.mbgd=m1;
  this.mbds=m2;
  this.vif=vintf;
endfunction

task dri;
  repeat(`num_tr) begin
    @(negedge vif.pclk);

  //get the generated transaction from mailbox GD 
  mbgd.get(ob_tr1);
  
  //drive input into DUT
  vif.presetn<=ob_tr1.presetn;
    $display($time,"DRIVER PRESETN=%0d",ob_tr1.presetn);
  /* Drive control signals*/  
  vif.psel<=1'b1;
    $display($time,"DRIVER psel=%0d",1'b1);
  
  @(posedge vif.pclk);  
  vif.penable<=1'b1;
    $display($time,"DRIVER enable=%0d",1'b1);
    
  wait(vif.pready == 1'b1); //wait till slave ready  
  /*Drive addr and data*/
  vif.pwrite<=ob_tr1.pwrite;
    $display($time,"DRIVER pwrite=%0d",ob_tr1.pwrite);
  vif.pwdata<=ob_tr1.pwdata;
    $display($time,"DRIVER PWDATA=%0d",ob_tr1.pwdata);
  vif.paddr<=ob_tr1.paddr;
    $display($time,"DRIVER Paddr=%0d",ob_tr1.paddr);
  //put the transaction into mailbox DS
 
  mbds.put(ob_tr1);
  repeat(2) begin
  @(negedge vif.pclk);
  end
  end

 endtask

endclass