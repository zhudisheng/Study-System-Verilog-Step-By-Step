module tb;
	logic [7:0] vec1;
	logic [7:0] vec2;
	byte b1;
	integer i1;
	int unsigned i2;

	initial begin
		b1 = -1; $display("b1 = %0d",b1);
		i1 = b1; $display("i1 = %0d",i1);
		i2 = b1; $display("i2 = %0d",i2);

		vec1 = b1;
		vec2 = b1;
		i1 = 32'h00XXZZFF;
		i2 = i1;
		$display("i2 = %0d",i2);
		b1 = -1;
		i2 = int'(b1);
		$display("i2 = %0d",i2);
		$finish();
	end
endmodule
