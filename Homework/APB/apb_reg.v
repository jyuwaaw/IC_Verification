//all APB module are APB slaves
//Simple APB register
module apb_reg#(
    parameter	SIZE_IN_BYTES = 1024
)
(
	input        		PRESETn,
	input        		PCLK,
    input          		PSEL,
    input [31:0]   	 	PADDR,
    input           	PENABLE,
    input          		PWRITE,
    input [31:0]        PWDATA,
    output reg [31:0]  	PRDATA
);

localparam	A_WIDTH = clogb2(SIZE_IN_BYTES);

reg [31:0]	mem[0:SIZE_IN_BYTES/4-1];
wire		wren;
wire		rden;
wire		addr;

function integer clogb2;
	input 	[31:0]	value;
	reg		[31:0]	tmp;
	reg 	[31:0]	rt;
begin
	tmp = value - 1;
	for(rt = 0; tmp > 0; rt = rt + 1)
		tmp = tmp >> 1;
	clogb2 = rt;
end
endfunction

//main code
assign wren = PWRITE && PENABLE && PSEL;
assign rden = ~PWRITE && ~PENABLE && PSEL;

assign addr = PADDR[A_WIDTH-1:2];

//write
always @(posedge PCLK)
begin
	if(wren)
		mem[addr] <= PWDATA;
end

//read
always @(posedge PCLK)
begin
	if(rden)
		PRDATA <= mem[addr];
	else
		PRDATA <= 'h0;
end

endmodule
