`timescale 1ns/100ps

//*******************Adder Module******************
module adder(input [3:0] ain, bin,output[3:0] out,co);
	assign {co,out} = ain + bin;
endmodule:adder

//*******************Sub Module******************
module sub(input [3:0] ain, bin,output[3:0] out);
	assign out = ain - bin;
endmodule:sub

//*************Regs Module*******************
module regs(input [3:0] in1,in2,input sel,en,output logic [3:0] result,input clk,rstn);
always @(posedge clk or negedge rstn)
begin :p_REG_BLOCK
	if(!rstn) begin
		result<='0;
	end
	else begin
		if(en) begin
			if(sel) result <= in1;
			else result <= in2;
		end
	end
end
endmodule :regs

//================Top Module======================
module test_port_connection;
	parameter simulation_cycle = 10;
	reg [3:0] ain,bin;
	reg sel,en,clk,rstn;
	wire [3:0] adder_out,sub_out,result;
	wire co;
	adder U1(.ain(ain),.bin(bin),.out(adder_out),.co(co));
	sub U2(.ain,.bin,.out(sub_out));
	regs U3(.in1(adder_out),.in2(sub_out),.*);
	initial begin
		ain = 0; bin = 0;sel = 0;en = 0;rstn = 0;
		@(posedge clk);
		ain = 3; bin = 4;sel = 1;en = 1;rstn = 1;
		@(posedge clk);
		en = 0;
		@(posedge clk);
		ain = 6; bin = 5;sel = 0;en = 1;
		@(posedge clk);
		en = 0;
		repeat(10)@(posedge clk);
		$finish;
	end
	initial begin
		$monitor("aini=%d bin = %d adder_out = %d sub_out = %d sel = %b en = %b result = %d",ain,bin,adder_out,sub_out,sel,en,result);
	end
	initial begin
		clk = 0;
		forever begin
			#(simulation_cycle/2)
			clk = ~clk;
		end
	end
	initial begin
		$fsdbDumpfile("test_port_connection");
		$fsdbDumpvars;
		$vcdpluson;
	end

endmodule
