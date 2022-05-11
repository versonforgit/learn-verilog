`timescale 1 ns/1 ns
module counter10_tb ;

reg 		rstn;
reg 		clk;
wire [3:0]	cnt;
wire		cout;

counter10 C10(
	.rstn(rstn),
	.clk(clk),
	.cnt(cnt),
	.cout(cout)
	);
	
	
initial
begin
	clk = 1'b0;
	rstn = 1'b0;
	#11 ;
	rstn = 1'b1;
	
end

always
begin
	#10 ;
	clk = ~clk;
end
	
/*iverilog */
initial
begin            
    $dumpfile("wave.vcd");        //生成的vcd文件名称
    $dumpvars(0, counter10_tb);     //tb模块名称
end


/*duration of the simulation*/

initial
#800 $finish;



endmodule