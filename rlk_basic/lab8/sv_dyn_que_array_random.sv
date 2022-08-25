package data_pkg;
	typedef struct {
		rand bit[31:0] addr;
		rand bit[31:0] data;
	} data_pair_t;
	class packet;
		rand data_pair_t pair_arr[];
		constraint cstr {
			pair_arr.size() inside {[10:15]};
			foreach (pair_arr[i]) {
				pair_arr[i].addr inside {['h20:'h40]};
				pair_arr[i].addr[1:0] == 0;
				^(pair_arr[i].data) == 1;
			}
		}
		function bit xored(bit[31:0] d);
			return ^d;
		endfunction
	endclass
endpackage

module tb;
	import data_pkg::*;
	packet p;
	initial begin
		p = new();
		void '(p.randomize() with {
			pair_arr.size() == 12;
			foreach(pair_arr[i]) {
				pair_arr[i].data[31:8] == 0;
			}
		});
		$finish();
	end
endmodule
