module tb;
	typedef enum bit[7:0] {
		ADD   = 8'b0000_0001
		,OR   = 8'b0000_0010
		,AND  = 8'b0000_0100
		,MUL  = 8'b0000_1000
		,DEC  = 8'b0001_0000
		,CNT  = 8'b0010_0000
		,LOAD = 8'b0100_0000
		,IDLE = 8'b1000_0000
	}alu_op_t;

	alu_op_t op;
	bit[7:0] vec;
	initial begin
		$display("op current value is %s",op);
		std::randomize(vec);
		std::randomize(op);
		case(op)
			AND : op  = alu_op_t'(op << 1);
			OR  : op  = alu_op_t'(op << 3);
			MUL : op  = alu_op_t'(op << 5);
			DEC : op  = alu_op_t'(op << 2);
			default: $display("op %s keeps current value",op);
		endcase
		$display("op current value is %s",op);
	end
endmodule
