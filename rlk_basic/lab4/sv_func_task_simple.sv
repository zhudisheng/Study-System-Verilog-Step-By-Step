module tb;
	function int get_string_length(input string s);
		return s.len();
	endfunction

	function int get_one_counts(input int unsigned a);
		get_one_counts = $countones(a);
	endfunction

	task automatic get_dynarr_size(ref int dyn[], output int size);
		#5ns;
		size = dyn.size();
	endtask

	int len,count,size;
	int ones = 32'h0000_07F0;
	string str = "hello world!\n";
	int dyn [] = '{100,200,300};
	initial begin
		len  = get_string_length(str);
		$display("len = %d\n",len);
		count = get_one_counts(ones);
		$display("count = %d\n",count);
		get_dynarr_size(dyn,size);
		$display("size = %d\n",size);
		#10ns;
		$finish();
	end

	bit dynarr_incr;
	bit dynarr_decr;
	initial begin
		forever
			@(posedge dynarr_incr) dyn = new[dyn.size() + 1](dyn);
	end

	initial begin
		forever 
			@(posedge dynarr_decr) dyn = new[dyn.size() - 1](dyn);
	end
endmodule
