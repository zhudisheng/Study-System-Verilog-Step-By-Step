module coarr;
	bit[63:0] rom[bit[63:0]];
	bit[63:0] idx;
	function automatic void print(bit[63:0] pos, ref bit[63:0] rom[bit[63:0]]);
		$display("rom[%d] = %d ",pos,rom[pos]);
	endfunction:print

	initial begin
		idx = 1;
		repeat(64) begin
			rom[idx] = idx;
			idx = idx << 1;
		end

		if(rom.first(idx)) begin
			print(idx,rom);
			while(rom.next(idx)) print(idx,rom);
		end
	end
endmodule:coarr
