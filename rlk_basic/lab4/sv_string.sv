module tb;
	string str;
	string info;
	bit [3:0][7:0] i1;
	initial begin
		if(str == "")
			$display("str is empty");
		str = "Hello World!";
		foreach(str[i])
			info = {info, str[i]};
		$display("info is %s",info);
		str = "10";
		i1[0] = str[0];
		i1[1] = str[1];
		$display("i1 is %p",i1);
		i1 = str.atoi();
		$display("i1 is %p",i1);
		i1 = str.atohex();
		$display("i1 is %p",i1);
		i1 = str.atobin();
		$display("i1 is %p",i1);
		info = $sformatf("%s:%s:'b%0b",info,str,i1);
		$display("info is %s",info);
		$finish;
	end
endmodule
