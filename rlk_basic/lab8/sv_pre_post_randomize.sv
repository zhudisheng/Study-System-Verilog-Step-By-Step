package data_pkg;
	typedef struct {
		bit[31:0] min;
		bit[31:0] max;
	} range_t;
	class packet;
		rand bit[31:0] addr;
		rand bit[31:0] data;
		range_t addr_range;
		range_t data_range;

		function new();
			addr_range.min = '1;
			data_range.min = '1;
		endfunction

		constraint cstr{
			if(addr_range.min != 'hFFFF_FFFF && addr_range.min <= addr_range.max)
				addr inside {[addr_range.min:addr_range.max]};
			else
				addr inside {[100:200],[300:400]};
			if(data_range.min != 'hFFFF_FFFF && data_range.min <= data_range.max)
				data inside {[data_range.min:data_range.max]};
			else {
				data[1:0] == 0;
				data[31:8] <= 4;
			}
		}
		function void pre_randomize();
			addr_range.min = 250;
			addr_range.max = 270;
			data_range.min = 'h20;
			data_range.max = 'h40;
			$display("pre_randomize function auto called");
		endfunction

		function void post_randomize();
			$display("randomized value addr = 'h%0x,data = 'h%0x",addr,data);
			addr += 'h10;
			data += 'h20;
			$display("post-randomized value addr = 'h%0x, data = 'h%0x",addr,data);
			$display("post_randomize function auto called");
		endfunction
	endclass
endpackage

module tb;
	import data_pkg::*;
	packet p;
	initial begin
		//void '(p.randomize());
		//- p.addr_range.min = 250;
		//- p.addr_range.max = 270;
		//- p.data_range.min = 'h20;
		//- p.data_range.max = 'h40;
	//	void '(p.randomize());
		$finish();
	end
endmodule
