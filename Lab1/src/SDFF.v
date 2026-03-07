`timescale 1ns/1ps	

module SDFF(CLK, DI, SI, SE, SO);
  input CLK, DI, SI, SE;
  output SO;
  wire CLK,SE,DI,SI;
  wire muxoutput;
    
  assign muxoutput=(SE==1)?SI:DI;
  
  MyDFF dffinstance(CLK, muxoutput, SO); //CLK, D, Q
endmodule