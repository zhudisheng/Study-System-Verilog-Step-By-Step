module tb;
	bit signed [7:0] bv;
	byte bt;

	initial begin
		bt = -1;
		bv = bt;
		$display("bv = 'b%b, 'd%d",bv,bv);
	end
endmodule
