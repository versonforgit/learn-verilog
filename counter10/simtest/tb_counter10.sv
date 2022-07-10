
`timescale 1ns/1ps

module tb_counter10 (); /* this is automatically generated */

	// clock
	logic clk;
	initial begin
		clk = '0;
		forever #(0.5) clk = ~clk;
	end

	// asynchronous reset
	logic rstn;
	initial begin
		rstn <= '0;
		#10
		rstn <= '1;
	end

	// synchronous reset
	logic srstb;
	initial begin
		srstb <= '0;
		repeat(10)@(posedge clk);
		srstb <= '1;
	end

	// (*NOTE*) replace reset, clock, others

	logic [3:0] cnt;
	logic       cout;

	counter10 inst_counter10 (.rstn(rstn), .clk(clk), .cnt(cnt), .cout(cout));

	task init();
	endtask

	task drive(int iter);
		for(int it = 0; it < iter; it++) begin
			@(posedge clk);
		end
	endtask

	initial begin
		// do something

		init();
		repeat(10)@(posedge clk);

		drive(20);

		repeat(10)@(posedge clk);
		$finish;
	end

	// dump wave
	initial begin
		$display("random seed : %0d", $unsigned($get_initial_random_seed()));
		if ( $test$plusargs("fsdb") ) begin
			$fsdbDumpfile("tb_counter10.fsdb");
			$fsdbDumpvars(0, "tb_counter10", "+mda", "+functions");
		end
	end

endmodule
