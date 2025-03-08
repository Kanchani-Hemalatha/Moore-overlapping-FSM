
//================================================================================================
//					TESTBENCH																	  
//================================================================================================
`timescale 1ns/1ps
module tb;
  reg clk=0,reset=0,din=0;
  wire dout;
  moore_fsm_overlapping dut(clk,reset,din,dout);
  always #5clk= ~clk;
  initial begin
    reset=1;
    #10;
    reset=0;
    @(posedge clk);
    din = 1;
    #10;
    din = 0;
    #10;
    din = 1;
    #10;
    din = 0;
    #10;
    din = 1;
    #10;
    din = 0;
    #10;
    din = 1;
    #10;
    din = 0;
    #10;
    din = 1;
    #10;
    din = 0;
    #10;
    din = 1;
    #10;
    din = 0;
    #100;
    $finish;
  end
  initial begin
    $monitor(" Time=%0t din=%0d,dout=%0d",$time,din,dout);
  end
   initial begin//wave form dumping
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule:tb
