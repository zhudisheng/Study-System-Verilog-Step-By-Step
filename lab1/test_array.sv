class Array;
	int array[9:0];
	function new();
		for(int i = 0;i < 10;i++)
			array[i] = i;
	endfunction:new

	function void print();
		foreach(array[i]) begin
			$display("array[%d] = %d",i,array[i]);
		end
		for(int i = 0;i < 10;i++) begin
			$write("**");
		end
		$display();
	endfunction: print

	function void funcs();
		int pos[$];
		$display("the sum is %d ",array.sum());
		$display("the and is %d ",array.and());
		$display("the  or is %d ",array.or());
		$display("the xor is %d ",array.xor());
		$display("the product is %d ",array.product());

		$display("max value is %d",array.max());
		$display("min value is %d",array.min());

		pos = array.find with(item == 7);
		$display("pos : %d ? value :%d",pos[0],array[pos[0]]);

		array.shuffle();
		$display("shuffled:");
		print();
		array.sort();
		$display("Sorted:");
		print();
		array.rsort();
		$display("Resorted:");
		print();
		array.reverse();
		$display("Reversed:");
		print();
	endfunction:funcs

endclass:Array
module top;
	Array array;
	int arr[];
	initial begin
		array = new();
		array.print();
		array.funcs();
		arr = new[20];
		foreach(arr[i]) $display("arr[%2d] = %d",i,arr[i]);
		$display("*********************");
		arr.delete();
	end
endmodule
