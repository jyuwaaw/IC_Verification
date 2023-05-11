module apb_ram (
    logic preset_n,
    input pclk,
    input [ 3:0] paddr,
    input [31:0] pwdata,
    input pwrite,
    input psel,
    input penable,

    output reg [31:0] prdata,
    output            pready

);
wire apb_write = psel && penable && pwrite;
wire apb_read  = psel && !pwrite; 

reg [31:0] ram [15:0];

//address configuration
always @(posedge pclk) begin
    if (apb_write) begin
        ram[paddr] <= pwdata;
    end
    else begin
        ram[paddr] <= 32'd1;
    end
end

always @(posedge pclk or negedge preset_n) begin
    if(!preset_n) begin
        prdata <= 'b0;
    end
    else if(apb_read) begin
        prdata <= ram[paddr];
    end
end

endmodule