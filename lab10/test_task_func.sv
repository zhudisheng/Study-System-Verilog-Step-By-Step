module test_task_func;

task test_ref(ref int a);
	a=a+1;
endtask

function void disp(int x);
	$display("DISP: %d",x);
endfunction

initial begin
	int a = 10;
	#10 $display("a=%d",a);
	#20 test_ref(a);
	#30 $display("a=%d",a);
	disp(a);
end
endmodule
