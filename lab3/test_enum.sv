module test_enum;
typedef enum{IDLE,TEST,START} state_t;
enum bit[2:0]{S0='b001,S1='b010,S2='b100}st;
state_t c_st,n_st = IDLE;
initial begin
	$display("st=%3b,n_st=%s",st,n_st.name());
	$display("st=%3b,n_st=%s",st,n_st.first());
end
endmodule
