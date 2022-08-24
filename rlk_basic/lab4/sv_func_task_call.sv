module tb;

	function void func1();
	endfunction

	task task_timed();
		#10ns;
	endtask

	task task_notimed();
	endtask

	function void func2();
		func1();
	endfunction

	function void func3();
		//task_timed();
	endfunction

	function void func4();
		task_notimed();
	endfunction

	task task1();
		func1();
		task_timed();
		task_notimed();
	endtask
endmodule
