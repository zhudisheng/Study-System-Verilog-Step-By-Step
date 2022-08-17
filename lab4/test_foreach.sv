module test_foreach;

initial begin
	int prod[1:8][1:3];
	foreach(prod[k,m]) begin
		prod[k][m] = k * m;
		$display("prod[k][m] = %d ",prod[k][m]);
	end
end
endmodule
