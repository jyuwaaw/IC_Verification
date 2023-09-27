program automatic test (arb_if arbif);

task reset_test();
  begin
   $display("Task reset_test: asserting and checking reset");

// LAB: Add reset logic  here


  end
endtask


task request_grant_test();

  // Test out bit 0
  $display("Task request_grant_test: asserting and checking reset");
  ##1 arbif.cb.request <= 2'b01;
  @arbif.cb;
  @arbif.cb;
  @(arbif.cb) a2: assert (arbif.cb.grant == 2'b01);

  // LAB: Add your grant test here for the rest of the bits


endtask


initial begin
  repeat (10) @arbif.cb;

  reset_test();
  request_grant_test();

  repeat (10) @arbif.cb;
  $finish;

end
endprogram

