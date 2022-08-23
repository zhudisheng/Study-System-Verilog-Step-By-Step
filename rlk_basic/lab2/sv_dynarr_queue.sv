module tb;
	int dynarr1[], dynarr2[];
	int que1[$], que2[$];

	function void dyn_test();
		int size;
		dynarr2 = '{1,2,3,4};
		size = dynarr2.size();
		dynarr2 = new[2*size](dynarr2);
		dynarr1 = new[3*size];
		foreach(dynarr1[i])
			dynarr1[i] = dynarr2[i%size];
		dynarr1.delete();
		dynarr1 = dynarr2;
		$finish();
	endfunction

	function void que_test();
		int d;
		que1 = {1,2,3,4};
		d = que1.pop_front();
		que1.pop_front();
		void '(que1.pop_front());
		que1.insert(0,3);
		que1.insert(0,2);
		que1.insert(0,1);
		que1.delete();
		que2 = {1,2,3};
		que1 = {que2,'hFF,que2};
		que2[1:$] = {4,5};
		$finish();
	endfunction

	initial begin
		que_test();
	end
endmodule
