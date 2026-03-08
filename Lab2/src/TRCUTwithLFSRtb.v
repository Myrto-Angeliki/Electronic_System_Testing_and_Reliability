module TRCUTwithLFSRtb();
	reg CLK;
	reg SE;
	wire SO;
	reg isExpected;
	integer i;
	reg [1:0] actual_outs;
	reg [1:0] expected_outs;
	reg [3:0] DATA_IN = 0;
	reg [3:0] DATA_IN_previous;
	
	TRCUTwithLFSR TRCUTwithLFSR_inst(.SE(SE),.CLK(CLK),.SO(SO));
	
	initial begin
		 CLK=0;
		 forever begin
			#20 CLK=!CLK;
		 end
	end
	
	
	initial begin
		SE = 1;
		@(posedge CLK) DATA_IN[0] = TRCUTwithLFSR_inst.TRCUTinst.SI;
		@(posedge CLK) DATA_IN[1] = TRCUTwithLFSR_inst.TRCUTinst.SI;
		@(posedge CLK) DATA_IN[2] = TRCUTwithLFSR_inst.TRCUTinst.SI;
		@(posedge CLK) DATA_IN[3] = TRCUTwithLFSR_inst.TRCUTinst.SI;
		@(negedge CLK) SE = 0;
		
		for(i=1; i<=32; i=i+1) begin
			@(negedge CLK) SE = 1;
			DATA_IN_previous = DATA_IN;
			@(posedge CLK) DATA_IN[0] = TRCUTwithLFSR_inst.TRCUTinst.SI;
			@(posedge CLK) DATA_IN[1] = TRCUTwithLFSR_inst.TRCUTinst.SI;
			@(posedge CLK) DATA_IN[2] = TRCUTwithLFSR_inst.TRCUTinst.SI;
			actual_outs[1] = SO;
			@(posedge CLK) DATA_IN[3] = TRCUTwithLFSR_inst.TRCUTinst.SI;
			actual_outs[0] = SO;
			
			expected_outs[1] = (DATA_IN_previous[3]^DATA_IN_previous[2]) & (DATA_IN_previous[1]^DATA_IN_previous[0]);
			expected_outs[0] = (DATA_IN_previous[3]^DATA_IN_previous[1]) | (DATA_IN_previous[2]^DATA_IN_previous[0]);  
			if(actual_outs == expected_outs) begin
				isExpected = 1;
			end else begin
				isExpected = 0;
			end
			
			@(negedge CLK) SE = 0;
		end
		#20
		$stop;
	end
	
endmodule

