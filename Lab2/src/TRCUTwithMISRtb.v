module TRCUTwithMISRtb();
	reg CLK;
	reg SE;
	reg CTRL;
	wire sign_tb;
	integer i, clk_counter;
	reg [1:0] actual_outs;
	reg [15:0] correct_signature = 0;
	
	
	TRCUTwithMISR TRCUTwithMISRinst(.SE(SE),.CLK(CLK),.CTRL(CTRL),.sign(sign_tb));
	
	initial begin
		 CLK=0;
		 forever begin
			#20 CLK=!CLK;
		 end
	end
	
	
	initial begin
		SE = 1;
		CTRL = 1;
		clk_counter = 1;
		
		repeat (4) begin
			@(negedge CLK);
			clk_counter = clk_counter + 1;
		end
		SE = 0;
		CTRL = 0;
		
		for(i=1; i<=32; i=i+1) begin			
			@(negedge CLK) SE = 1;
			clk_counter = clk_counter + 1;
			
			repeat (2) begin 
				@(negedge CLK);
				clk_counter = clk_counter + 1;
			end
			@(posedge CLK) actual_outs[1] = TRCUTwithMISRinst.TRCUTinst.SO;   
			
			@(negedge CLK) clk_counter = clk_counter + 1;
			
			@(posedge CLK) actual_outs[0] = TRCUTwithMISRinst.TRCUTinst.SO;
			
			@(negedge CLK) clk_counter = clk_counter + 1;
			SE = 0;
		end
		
		
		CTRL = 1;
		correct_signature[0] = sign_tb;
		
		for(i=1; i<16; i=i+1) begin
			@(negedge CLK);
			correct_signature[i] = sign_tb;
			clk_counter = clk_counter + 1;
		end
		@(negedge CLK);
		$stop;
	end
	
endmodule

