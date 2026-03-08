module TRCUTwithLFSR(SE,CLK,SO);
	input SE,CLK;
	output SO;
	wire SO;
	wire [7:0] LFSR;
	
	LFSR8_11D LFSRinst(.clk(CLK),.LFSR(LFSR));
	
	TRCUT TRCUTinst(.SI(LFSR[3]),.SE(SE),.CLK(CLK),.SO(SO));
	
endmodule