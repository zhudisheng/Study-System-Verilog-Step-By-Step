package trans_pkg;
	class transaction;
		bit[31:2] addr;
		bit[31:0] data;
		function new(bit[31:0] addr,bit[31:0] data);
			this.addr = addr >> 2;
			this.data = data;
		endfunction

		function void print(string name = "transaction");
			$display("%s addr = %0x,data = %0x",name,addr,data);
		endfunction
	endclass

	class packet;
		transaction tr1,tr2;
		function new(bit[31:0] addr, bit[31:0] data);
			//tr1 = new();
			//tr1.addr = addr[31:2];
			//tr1.data = data;
			//tr2 = new tr1;
		endfunction

		function void print(string name = "packet");
			$display("%s sub children content is as follow:",name);
			tr1.print("tr1");
			tr2.print("tr2");
		endfunction
	endclass
endpackage
module tb;
	import trans_pkg::*;
	transaction tr1,tr2;
	packet p1,p2;
	initial begin
		tr1 = new("h404",'h302);

		tr1.print("tr1");
		tr2 = new tr1;
		tr2.print("tr2");
	end
endmodule
