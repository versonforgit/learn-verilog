iverilog -o wave pad.v test.v 
vvp  -n wave
open -a gtkwave ./wave.vcd 