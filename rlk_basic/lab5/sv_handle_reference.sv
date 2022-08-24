package pkg_a;
	class trans;
		int unsigned addr;
		int unsigned data;
	endclass

	class packet;
		trans tr[];
		function void locate_tr(int n);
			tr = new[n];
			foreach(tr[i]) begin
				if(i % 2) begin
					tr[i] = new();
					tr[i].addr = 'h10 + (i << 2);
					tr[i].data = 'h20 + i;
				end
			end
		endfunction
	endclass
endpackage

module tb;
	import pkg_a::*;
	packet p;
	initial begin
		p = new();
		p.locate_tr(8);
		foreach(p.tr[i]) begin
			if(p.tr[i] != null)
				$display("p.tr[%0d] addr = 'h%0x, data = 'h%0x",i,p.tr[i].addr,p.tr[i].data);
		end
	end
endmodule
