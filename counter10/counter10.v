module counter10 (
    //定义端口
		input 			rstn , 					//reset neg
		input 			clk , 					//clock 
		output [3:0] 	cnt , 					//counter
		output			cout  					//counter out
		);
		
		reg [3:0]		cnt_temp ; 				//counter temp
		
		always@(posedge clk	or negedge rstn) begin
				if(! rstn) begin 				//reset counter to zero
					cnt_temp 	<= 4'b0 ;
				end
				else if (cnt_temp==4'd9) begin  //counter from 9 to 0
                        cnt_temp        <=4'b000;
                end
                else begin                      //counter plus 1
                        cnt_temp        <= cnt_temp + 1'b1 ;
                end
        end

        assign  cout = (cnt_temp==4'd9) ;       //cycle times
        assign  cnt  = cnt_temp;
    
endmodule