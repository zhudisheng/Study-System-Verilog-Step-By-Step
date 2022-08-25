package data_pkg;
	class days;
		typedef enum {SUN,MON,TUE,WED,THU,FRI,SAT} days_t;
		days_t choices[$];
		rand days_t cho;
		constraint cstr {
			cho inside {choices};
		}
	endclass
endpackage

module tb;
	import data_pkg::*;
	days d;
	initial begin
		d = new();
		d.choices = {days::SUN, days::MON};
		d.cstr.constraint_mode(0);
		repeat(10) begin
			assert (d.randomize()) begin
				$display("cho is %s",d.cho);
			end
			else $error("days object randomization failure!");
		end
		$finish();
	end
endmodule
