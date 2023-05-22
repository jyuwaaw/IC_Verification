class ramp_env;
  ramp_generator gen;
  ramp_driver drv;
  ramp_receiver rec;
  ramp_scoreboard sc;
  mailbox mbgd,mbds,mbrs;
  virtual ramp_iface inter;
  
  function new( virtual ramp_iface inter);
    mbgd=new();
    mbds=new();
    mbrs=new();
    gen=new(mbgd);
    drv=new(mbgd,mbds,inter);
    rec=new(mbrs,inter);
    sc=new(mbds,mbrs); 
    this.inter=inter;
endfunction   

task run;
  fork
  gen.gen();
  drv.dri();
  rec.rec();
  sc.scbd(); 
  join  
endtask

endclass