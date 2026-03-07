`timescale 1ns / 1ps

module TRCUTtb();
	reg CLK, SI, SE;
	reg [3:0] DATA_IN;
	reg [3:0]  DATA_IN_previous;
	reg [1:0] expected_outs;
	reg [1:0] actual_outs;
	reg isExpected;
	wire SO;
	integer i;

	TRCUT TRCUT_instance(SI, SE, CLK, SO);

	initial begin
		 CLK=0;
		 forever begin
			#50 CLK=!CLK;
		 end 
	end
	
	
	initial begin
	  // i=(a)xor(b) and (c)xor(d)
	  // j=(a)xor(c) or (b)xor(d)
	  isExpected = 0;
		SI = 1;
		DATA_IN = 4'b0101;
		//load abcd=0101 (test vector)
		SE = 1;
		@(negedge CLK) SI = 0;
		@(negedge CLK) SI = 1;
		@(negedge CLK) SI = 0;
		// capture 
		@(negedge CLK) SE = 0;
		// load abcd=0000 get i=1, j=0 from abcd=0101 (test)
		@(negedge CLK) SE = 1;	 
		DATA_IN_previous = DATA_IN;
		DATA_IN = 4'b0000;
		
		for(i=0; i<17; i=i+1) begin
      SI = DATA_IN[0];
      
      @(negedge CLK) SI = DATA_IN[1];
          
      @(negedge CLK) SI = DATA_IN[2];
      actual_outs[1] = SO;
         
      @(negedge CLK) SI = DATA_IN[3];
          actual_outs[0] = SO;
          expected_outs[1] = (DATA_IN_previous[3]^DATA_IN_previous[2]) & (DATA_IN_previous[1]^DATA_IN_previous[0]);
          expected_outs[0] = (DATA_IN_previous[3]^DATA_IN_previous[1]) | (DATA_IN_previous[2]^DATA_IN_previous[0]);
          if(actual_outs == expected_outs) begin
            isExpected = 1;
          end else begin
            isExpected = 0;
          end
      @(negedge CLK) SE = 0;
      @(negedge CLK) SE = 1;
           DATA_IN_previous = DATA_IN;
           DATA_IN = DATA_IN + 1'b1;
    end
    $stop;
	end
	
endmodule

