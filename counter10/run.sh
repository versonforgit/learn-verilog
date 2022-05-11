echo "开始编译"
iverilog -o wave -c file_list.txt
echo "编译完成"

echo "生成波形图"
vvp -n wave 
cp wave.vcd wave1.vcd
vvp -n wave -lxt2
cp  wave.vcd wave.lxt
echo "生成波形图完成"

echo "打开波形图"
open -a gtkwave wave.vcd