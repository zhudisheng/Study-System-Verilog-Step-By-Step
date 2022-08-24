module tb;
	typedef struct packed {
		logic [7:0] r;
		logic [7:0] g;
		logic [7:0] b;
	} pixel_t;
	pixel_t pixel_a, pixel_b, pixel_c;

	initial begin
		pixel_a = {8'h12,8'h24,8'h36};
		print_pixel(pixel_a);
		pixel_b = pixel_a;
		print_pixel(pixel_b);
		pixel_b = {g:8'haa,b:8'hbb,r:8'hcc};
		print_pixel(pixel_b);
	end

	function void print_pixel(pixel_t pixel_a);
		$display("r = %0x, g = %0x, b = %0x",pixel_a.r, pixel_a.g, pixel_a.b);
	endfunction
endmodule

