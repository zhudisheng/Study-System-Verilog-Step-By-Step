module test_pack_unpack_array;

bit[15:0] memory[1023:0];
bit[15:0][1023:0] Frame;
initial begin
	memory[3] = 0;
	$display("memory[3] = %h",memory[3]);
	memory[3] = ~memory[3];
	$display("memory[3] = %h",memory[3]);
	memory[3][15:8] = 0;
	$display("memory[3] = %h",memory[3]);
	Frame=0;
	$display("Frame=%h",Frame);
	$display("Frame[3]=%h",Frame[3]);
	Frame=~Frame;
	$display("Frame=%h",Frame);
	$display("Frame[3] = %h",Frame[3]);
end
endmodule
