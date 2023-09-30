module randomtest_add4();  //test fixture - no ports needed

//input s 
reg [3:0] A, B;
reg C_in;


wire [3:0] S;
wire C_out;


//dut
add4 dut(.Sum(S), .Co(C_out), .Ain(A), .Bin(B), .Cin(C_in));

task dumpwave;
    begin
	$dumpfile("randomtest_add4.vcd");
	$dumpvars();
    end
endtask

task random_512;
   integer test;
   begin
        {A, B, C_in} = 9'b000000000;
	#100;   //wait for 100 time units
	for(test = 0; test < 512; test = test + 1) //apply all input values
	begin
		{A, B, C_in} = test;
		#100;
	end
    end
endtask

initial
begin
    dumpwave; //dump vcd trace
    // add your  $mointor here
    $monitor("A=%d,B=%d,C_in=%b,Sum=%d,C_out=%b",A,B,C_in,S,C_out);
    random_512;
    $finish;
end

endmodule
