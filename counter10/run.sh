echo "开始编译"
iverilog -o wave -c file_list.txt
echo "编译完成"

echo "生成波形图"
vvp -n wave -lxt2
echo "生成波形图完成"
