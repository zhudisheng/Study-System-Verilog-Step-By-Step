module tb;
	int arr1[16];
	int arr2[16];
	int arr3[8];
	bit test_bit1 = 0;
	bit test_bit2 = 1;

	initial begin
		if(test_bit1) begin
			$display("arr1 content is %p",arr1);
			foreach(arr1[i])
				$display("arr1[%0d] is %0d",i,arr1[i]);
			arr2 = '{default: 'hf};
			arr2[0:3] = '{1,2,3,4};
			$display("arr2 content is %p",arr2);
			arr1 = arr2;
			$display("arr1 content is %p",arr1);
			arr3 = arr2[0:7];
			$display("arr3 content is %p",arr3);
		end
	end

	int arr_d3 [3][4][5];
	initial begin
		if(test_bit2) begin
			arr_d3 [0][0][3] = 4;
			arr_d3 [0][1][3] = 5;
			arr_d3 [0][2][3] = 6;
			arr_d3 [0][3][3] = 7;
			$display("arr_d3 dimension is [%0d][%0d][%0d]",$size(arr_d3,1),$size(arr_d3,2),$size(arr_d3,3));
			foreach(arr_d3[i,j])
				$display("arr_d3 [%0d][%0d] content is %p",i,j,arr_d3[i][j]);
		end
	end
endmodule
