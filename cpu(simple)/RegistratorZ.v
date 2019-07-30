module RegistratorZ (Tz, outy, clk, out);
	
	input wire clk;
	input wire [3:0] outy;
	input wire [2:0] Tz;
	output reg [3:0] out;
	
	parameter HOLD = 3'b000;
	parameter LOAD = 3'b001;
	parameter SHIFTR = 3'b010;
	parameter SHIFTL = 3'b011;
	parameter RESET = 3'b100;
	
	always @ (posedge clk) begin
		case (Tz)
			HOLD : begin
				out <= out;
				end
			LOAD : begin
				out <= outy;
				end
			SHIFTR : begin
				out <= (out >> 1);
				end
			SHIFTL : begin
				out <= (out << 1);
				end
			RESET : begin
				out <= 4'b0000;
				end
		endcase	
	
			end
endmodule