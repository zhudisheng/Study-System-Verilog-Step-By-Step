`timescale 1ns/100ps
module test_threads;
	parameter simulation_cycle = 20;
	reg clk;
	reg A,B,C;
	task dispT1;
		@(posedge clk)
		$display("task T1 time:",$time);
	endtask
	task dispT2;
		@(posedge clk)
		$display("task T2 time:",$time);
	endtask
	task dispT3;
		@(posedge clk)
		$display("task T3 time:",$time);
	endtask
	task dispT4;
		@(posedge clk)
		$display("task T4 time:",$time);
	endtask
	initial begin
		for(int i = 0;i < 10;i++)
		begin
			fork
			begin
				dispT1;
			end
			begin
				dispT2;
			end

			join
		end
		$display("----------------");
		for(int i = 0;i < 10;i++)
		begin
			fork
				dispT3;
				dispT4;
			join
		end
		$display("--------------");
		for(int i = 0;i < 10;i++)
		begin
			fork
			begin
				dispT1;
				dispT2;
			end
			join
		end
		$display("--------------");
		for(int i = 0;i < 10;i++)
		begin
			fork
			begin
				dispT1;
				dispT2;
			end
			dispT3;
			join
		end
		$finish;
	end
	initial begin
		clk = 0;
		forever begin
			#(simulation_cycle/2)
				clk= ~clk;
		end
	end
	initial begin
		$vcdpluson;
	end


endmodule
