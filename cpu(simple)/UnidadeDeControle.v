module UnidadeDeControle(status,clk,Opcode,tula,Tx,Ty,Tz);
	
	input wire clk,status;
	input wire [2:0] Opcode;
	output reg [2:0] Tx,Ty,Tz,tula;
	
	parameter HOLD = 3'b000;
	parameter LOAD = 3'b001;
	parameter SHIFTR = 3'b010;
	parameter SHIFTL = 3'b011;
	parameter RESET = 3'b100;
	
	 always @ (posedge clk) begin
		case (Opcode)
			3'b000: begin // CLDRD
				Ty <= RESET;
				Tx <= LOAD;
				Tz <= RESET;
				tula <= HOLD;
				end
			3'b001: begin // ADDLD
				Ty <= LOAD;
				Tx <= LOAD;
				Tz <= HOLD;
				tula <= HOLD;
				end
			3'b010: begin // ADD
				Ty <= LOAD;
				Tx <= HOLD;
				Tz <= HOLD;
				tula <= HOLD;
				end
			3'b011: begin // DIV2
				Ty <= SHIFTR;
				Tx <= HOLD;
				Tz <= HOLD;
				tula <= HOLD;
				end
			3'b100 : begin // DISPLAY 
				Ty <= HOLD;
				Tx <= HOLD;
				Tz <= LOAD;
				tula <= HOLD;
				end
			endcase
		end
endmodule