//APB register code
module apb_regs1(
//system
input 	rst_n,
input	ena,	//clock gating
//APB
input	pclk,
input	[3:0]	paddr,	//ls 2 bits unused
input	pwrite,
input	psel,
input	penable,
input	[31:0]	pwdata,
output	reg	[31:0]	prdata,
output	pready,
output	pslverr,
//Interface
input	[31:0]	status32,
input	[15:0]	status16,
input	[7:0]	status8,
output	reg	[31:0]	control32,
output	reg [15:0]	control16,
output	reg [7:0]	control8
);

wire apb_write = psel & penable & pwrite;
wire apb_read = psel & ~pwrite;

assign pready = 1'b1;
assign pslverr = 1'b0;

always @(posedge pclk or negedge rst_n)
begin
	if(!rst_n)
	begin
		control32 <= 32'h0;
		control16 <= 16'h0;
		control8  <= 8'h0;
		prdata	<= 32'h0;
	end
	else if(ena)
	begin
		if(apb_write)
		