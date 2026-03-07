module TRCUT(SI,SE,CLK,SO);
	input SI,SE,CLK;
	output SO;
	
	wire SI,SE,CLK,SO;
	wire a,b,c,d,i,j;
	
	SDFF sdff0(.CLK(CLK),.DI(j),.SI(SI),.SE(SE),.SO(a));
	SDFF sdff1(.CLK(CLK),.DI(i),.SI(a),.SE(SE),.SO(b));
	SDFF sdff2(.CLK(CLK),.DI(c),.SI(b),.SE(SE),.SO(c));
	SDFF sdff3(.CLK(CLK),.DI(d),.SI(c),.SE(SE),.SO(d));
	
	
	CUT CUT_instance(a,b,c,d,i,j);
	
	assign SO = d;
	
	
endmodule