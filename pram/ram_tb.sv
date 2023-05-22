program ramp_tb( ramp_iface inter);
ramp_env env;

initial begin
  env=new(inter);
  env.run();
  #10 $finish;
end

endprogram
