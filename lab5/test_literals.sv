`timescale 1ns/1ps
module test_literals;
reg [32:0] data;
initial begin
	data=32'hFFFFFFFF;
	$display("data=%h",data);
	data='0;
	$display("data=%h",data);
	data='1;
	$display("data=%h",data);
end
reg [3:0] a,b,c;
initial begin
	a=0;b=0;c=0;
	#10 a <=1;
	#1ns b <= 2;
	#40ns c <= 3;
end
initial begin
	$monitor("time:%t a = %d b = %d c = %d",$realtime,a,b,c);
end

endmodule
