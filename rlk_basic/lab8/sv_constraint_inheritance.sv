package data_pkg;
	class packet;
		rand bit[31:0] addr;
		rand bit[31:0] data;
		constraint cstr {
			addr inside {['h20:'h40]};
			soft addr[1:0] == 0;
			soft data inside {['h50:'h60]};
		}
	endclass

	class user_packet extends packet;
		bit bad_packet;
		function new();
			bad_packet = 0;
		endfunction
		constraint cstr {
			if(bad_packet)
				addr[0] == 1;
		}
	endclass
endpackage

module tb;
	import data_pkg::*;
	user_packet up;
	packet p;
	initial begin
		up = new();
		up.bad_packet = 1;
		up.cstr.constraint_mode(0);
		if(!up.randomize())
			$error("UP RANDOMIZATION FAILURE!!");
		p = up;
		if(!p.randomize())
			$error("P RANDOMIZATION FAILURE!!!");
		$finish();
	end
endmodule
