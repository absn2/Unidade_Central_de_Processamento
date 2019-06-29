module RegistratorX (Tx, in, clk, outx);
	
	input wire clk;
	input wire [3:0] in;
	input wire [2:0] Tx;
	output reg [3:0] outx;
	
	parameter HOLD = 3'b000;
	parameter LOAD = 3'b001;
	parameter SHIFTR = 3'b010;
	parameter SHIFTL = 3'b011;
	parameter RESET = 3'b100;
	
	always @ (posedge clk) begin
		case (Tx)
			HOLD : begin
				outx <= outx;
				end
			LOAD : begin
				outx <= in;
				end
			SHIFTR : begin
				outx <= (outx >> 1);
				end
			SHIFTL : begin
				outx <= (outx << 1);
				end
			RESET : begin
				outx <= 4'b0000;
				end
		endcase	
	
			end
endmodule