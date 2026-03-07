`timescale 1ns/1ps	

module MyDFF(CLK, D, Q);
  
  input CLK, D;
  output Q;
  
  wire CLK, D;
  reg Q;
  
  //
  always @ (posedge CLK)
  begin
    Q<=D;
  end
  
endmodule
  
  
