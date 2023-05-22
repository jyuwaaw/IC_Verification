class ramp_generator;
 ramp_transaction ob_tr;
 mailbox mbgd;
 
 function new(mailbox m1);
    this.mbgd=m1; //mailbox created
 endfunction
 
 task gen;
   begin
   //create transaction
   ob_tr=new();
   //randomize inputs
   if(ob_tr.randomize() with {ob_tr.presetn==1'b0;}) //reset asserted
     $display("tr gen pass");
   else
     $display("tr gen failed");
   mbgd.put(ob_tr);  
   
   repeat(`num_tr-1) 
   begin
   ob_tr=new();
   if(ob_tr.randomize() with {ob_tr.presetn==1'b1;}) //reset de-asserted
     $display("tr gen pass");
   else
     $display("tr gen failed");
  
   mbgd.put(ob_tr);  
   end
  end  
 endtask

endclass