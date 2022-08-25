package data_pkg;
	class statistics;
		int unsigned start_time;
		int unsigned finish_time;
		function statistics copy();
			copy = new this;
			//copy = new();
			//copy.start_time = start_time;
			//copy.finish_time = finish_time;
		endfunction
	endclass

	class transaction;
		int unsigned addr;
		int unsigned crc;
		int unsigned data[8];
		statistics stat;
		function new();
			stat = new();
		endfunction
		function transaction copy();
			copy = new this;
			//copy = new();
			//copy.addr = addr;
			//copy.crc = crc;
			//copy.data = data;
			//copy.stat = stat;
			copy.stat = stat.copy();
		endfunction
		function void print(string name = "transaction");
			$display("%s addr = %0x,crc = %0x,data = %0p",name,addr,crc,data);
		endfunction
	endclass
endpackage

module tb;
	import data_pkg::*;
	transaction t1,t2,t3;
	initial begin
		t1 = new();
		t1.addr = 'h400;
		t1.crc = 'hEEFF;
		t1.data = '{0:1,1:2,2:3,3:4,default:'hf};
		t1.print("t1");
		t2 = new t1;
		t2.print("t2");
		t3 = t2.copy;
		t3.print("t3");
		$finish();
	end
endmodule
