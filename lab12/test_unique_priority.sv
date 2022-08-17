`timescale 1ns/100ps
module test_unique_priority;
reg clk;
bit [2:0] a;

/*
always @(posedge clk)
begin :p_unique_if
	unique if((a == 0)||(a==1)) $display("0 or 1");
	else if(a == 2) $display("2");
	else if(a == 4) $display("4");	 //value 3,5,6,7 cause an error
end :p_unique_if

always @(posedge clk)
begin :p_priority_if
	priority if((a[2:1] == 0)||(a==1)) $display("0 or 1");
	else if(a[2] == 0) $display("2");
	else $display("4 to 7");	 //covers all other possible values,so no error
end :p_priority_if

always @(posedge clk)
begin 
	unique case(a) //value 3,5,6,7 cause a run-time warning
	0,1: $display("0 or 1");
	2: $display("2");
	4: $display("4");
	endcase
end 
*/
always @(posedge clk)
begin 
	priority casez(a) 
	3'b00?: $display("0 or 1");
	3'b0??: $display("2 or 3");
	endcase
end 

initial begin
	a=0;
	@(posedge clk);
	a=1;
	@(posedge clk);
	a=2;
	@(posedge clk);
	a=3;
	@(posedge clk);
	a=4;
	@(posedge clk);
	a=5;
	@(posedge clk);
	a=6;
	@(posedge clk);
	a=7;
	@(posedge clk);
	$finish;
end
initial begin
	clk = 0;
	forever begin
		#10 clk = ~clk;
	end
end

endmodule
