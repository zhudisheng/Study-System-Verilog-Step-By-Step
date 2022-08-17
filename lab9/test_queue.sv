module test_queue;

int j = 2;
int q[$] = {0,1,3,6};
int b[$] = {4,5};
function void disp();
	$display("--------------------------");
	foreach(q[i]) begin
		$display("INDEX: %d Value: %d",i,q[i]);
	end
endfunction

initial begin
	disp();
	q.insert(2,j);
	disp();
	//q.insert(4,b);
	//disp();
	q.delete(1);
	disp();
	q.push_front(7);
	disp();
	j = q.pop_back();
	disp();
	$display(j);
	$display($size(q));
	q.delete();
	$display(q.size());
end


endmodule
