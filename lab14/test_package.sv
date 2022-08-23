module test_scop;
definitions::state_t State;
initial begin
	$display("STATE=%s",State.name());
end
endmodule

module test_import;
import definitions::*;
	state_t State;
	Complex in1,in2,res;

	initial begin
		$display("IMPORT: State=%s",State.name());
		in1.i=1.5;in1.r=2.4;
		in2.i=3.2;in2.r=5.1;
		res = Add(in1,in2);
		$display("IMPORT:ADD: i = %f r = %f",res.i,res.r);
	end
endmodule
