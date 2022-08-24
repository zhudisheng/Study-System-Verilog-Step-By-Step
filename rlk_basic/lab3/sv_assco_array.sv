module tb;
	int asc_arr_idx_int [int];
	string asc_arr_idx_str [string];
	int idx_int;
	string idx_str;

	initial begin
		asc_arr_idx_int[100] = 200;
		asc_arr_idx_int[101] = 210;
		asc_arr_idx_int[102] = 220;
		asc_arr_idx_int[103] = 230;
		asc_arr_idx_int[104] = 240;
		asc_arr_idx_int[105] = 250;
		asc_arr_idx_int[106] = 260;
		asc_arr_idx_int[107] = 270;
		asc_arr_idx_int[108] = 280;
		asc_arr_idx_int[109] = 290;
		foreach(asc_arr_idx_int[i])
			$display("asc_arr_idx_int[%0d] = %0d",i,asc_arr_idx_int[i]);
		asc_arr_idx_int.first(idx_int);
		$display("asc_arr_idx_int first index is %0d",idx_int);
		asc_arr_idx_int[1000] = 2000;
		asc_arr_idx_str["100"] = "num_200";
		asc_arr_idx_str["110"] = "num_210";
		asc_arr_idx_str["120"] = "num_220";
		asc_arr_idx_str["130"] = "num_230";
		asc_arr_idx_str["140"] = "num_240";
		asc_arr_idx_str["150"] = "num_250";
		asc_arr_idx_str["160"] = "num_260";
		asc_arr_idx_str["170"] = "num_270";
		asc_arr_idx_str["180"] = "num_280";
		asc_arr_idx_str["190"] = "num_290";
		asc_arr_idx_str["1000"] = "num_2000";
		foreach(asc_arr_idx_str[i])
			$display("asc_arr_idx_str[%s] = %s",i,asc_arr_idx_str[i]);
		asc_arr_idx_str.first(idx_str);
		$display("asc_arr_idx_str first index is %s",idx_str);
	end
endmodule
