//From Figure 6.6 - Verilog module for a 1-bit adder
`timescale 1ns/10ps
module FA(output S, Cy, input A, B, Ci);

assign S = A^B^Ci;
assign Cy = (A&B)|(A&Ci)|(B&Ci);

endmodule
