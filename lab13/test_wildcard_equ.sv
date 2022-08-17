module test;
wire [3:0] a = 4'b10zx;
initial begin
	if(a===4'b10zx) $display("1 true");
	if(a==4'b10zx) $display("2 true");
	if(a=?=4'b10zx) $display("3 true");
	if(a!?=4'b10zx) $display("4 true");
	if(a=?=4'b10xz) $display("5 true");
	if(a=?=4'bzx10) $display("6 true");
	if(a===4'b10xz) $display("7 true");
	if(a===4'bzx10) $display("8 true");
end
endmodule
