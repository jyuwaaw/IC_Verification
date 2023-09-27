
module add4(output [3:0] Sum, output Co, 
		input [3:0] Ain, Bin, input Cin);  

wire [2:0] Cy;

//S, Cy, input A, B, Ci
FA fa0(.S(Sum[0]), .Cy(Cy[0]), .A(Ain[0]), .B(Bin[0]), .Ci(Cin));
FA fa1(.S(Sum[1]), .Cy(Cy[1]), .A(Ain[1]), .B(Bin[1]), .Ci(Cy[0]));
FA fa2(.S(Sum[2]), .Cy(Cy[2]), .A(Ain[2]), .B(Bin[2]), .Ci(Cy[1]));
FA fa3(.S(Sum[3]), .Cy(Co),    .A(Ain[3]), .B(Bin[3]), .Ci(Cy[2]));

endmodule
