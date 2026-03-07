module CUT(a, b, c, d, i, j);
	input a, b, c, d;
	output i, j;
	wire a,b,c,d,e,f,g,h,i,j;
	
	xor x0(e,a,b);
	xor x1(f,c,d);
	xor x2(g,a,c);
	xor x3(h,b,d);
	and a0(i,e,f);
	or o0(j,g,h);
	
endmodule