package data_pkg;
	class transction;
		int unsigned data;
		int unsigned addr;

		function new(int unsigned val);
			data = val;
			addr = 'h4;
		endfunction

		virtual function bit get_data_xored();
			return ^data;
		endfunction
		virtual function int unsigned get_addr_shifted(int bits = 2);
			return addr << bits;
		endfunction
	endclass

	class user_trans extends transction;
		int unsigned shifted = 3;

		function new(int unsigned val);
			super.new(val);
			data = val << 1;
			//super.new();
		endfunction

		function bit get_data_xored();
			return !(^data);
		endfunction

		function int unsigned get_addr_shifted(int bits = 2);
			addr <<= shifted;
			return super.get_addr_shifted(bits);
		endfunction
	endclass
endpackage
module tb;
	import data_pkg::*;

	transction t1,t2;
	user_trans u1,u2;

	initial begin
		int unsigned addr;
		bit xored;

		t1 = new(10);
		t1.addr = 'h210;
		t1.data = 'h111;
		xored = t1.get_data_xored();
		$display("xored = %b",xored);
		addr = t1.get_addr_shifted();
		$display("addr = %x",addr);

		u1 = new(20);
		u1.addr = t1.addr;
		t1.data = t1.data;
		u1.shifted = 4;
		xored = u1.get_data_xored();
		$display("xored = %b",xored);
		addr = u1.get_addr_shifted();
		$display("addr = %x",addr);


		t2 = u1;
		t2.addr = 'h120;
		t2.data = 'h345;
		xored = t2.get_data_xored();
		$display("xored = %b",xored);
		addr = t2.get_addr_shifted();
		$display("addr = %x",addr);

		if(!$cast(u2,t2))
			$fatal("TYPE CASTING ERROR!");
		u2.addr = 'h230;
		u2.data = 'h456;
		u2.shifted = 1;
		xored = u2.get_data_xored();
		$display("xored = %b",xored);
		addr = u2.get_addr_shifted();
		$display("addr = %x",addr);
		$finish();
	end
endmodule
