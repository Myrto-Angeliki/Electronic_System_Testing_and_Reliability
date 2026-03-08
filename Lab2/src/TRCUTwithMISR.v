module TRCUTwithMISR(SE,CLK,CTRL,sign);
	input SE,CLK, CTRL;
	output sign;
	wire SO;
	wire [7:0] LFSR;
	wire [15:0] MISR;
	
	LFSR8_11D LFSRinst(.clk(CLK),.LFSR(LFSR));
	TRCUT TRCUTinst(.SI(LFSR[3]),.SE(SE),.CLK(CLK),.SO(SO));	
	MISR16 MISRinst(.clk(CLK),.SO(SO),.CTRL(CTRL),.MISR(MISR));
	
	wire sign = MISR[7];
	
endmodule