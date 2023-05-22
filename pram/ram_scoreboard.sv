class ramp_scoreboard;
  mailbox mbds,mbrs;
  ramp_transaction tr1,tr2;
  int errors;
  
  reg [31:0]local_ram[31:0];
  bit [31:0]local_data;
  function new(mailbox mbds, mailbox mbrs);
    this.mbds=mbds;
    this.mbrs=mbrs;
  endfunction
  
  task scbd;
    repeat(`num_tr)
    begin
      mbds.get(tr1);
      if(tr1.pwrite == 0) begin
      	mbrs.get(tr2);
        $display($time,"prdataSB=%d",tr2.prdata);
      end
      
      if(tr1.pwrite==1)
        local_ram[tr1.paddr]=tr1.pwdata;
      else
        calc();
    end
    if(errors==0)
      $display($time,"===============TEST PASSED================");
    else
      $display($time,"=======TEST FAILED with %0d errors========",errors);
    endtask
    
    task calc;
      local_data=local_ram[tr1.paddr];
      $display($time,"local_data=%d",local_data);

      compare();
    endtask
    
    task compare;
      if(tr2.prdata==local_data)
          $display($time,"pass scbd");
        else begin
          $display($time,"failed scbd");
          errors++;
        end
    endtask
endclass