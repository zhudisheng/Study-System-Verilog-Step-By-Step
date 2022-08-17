module test_struct_union;
typedef struct packed{
	logic [15:0] sa;
	logic [15:0] da;
	logic [31:0] data;
}packet_t;

union packed {
	packet_t data_packet;
	logic [63:0] bit_slice;
	logic [7:0][7:0] byte_slice;
}u_dreg;
initial begin
	u_dreg.data_packet.sa = '1;
	u_dreg.data_packet.data = 16'h33;
	$display("packet.sa = %h packet.data = %h",u_dreg.data_packet.sa,u_dreg.data_packet.data);
	$display("bit_slice = %h byte_slice[7] = %h",u_dreg.bit_slice,u_dreg.byte_slice);
end

endmodule
