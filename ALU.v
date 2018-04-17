module ALU( input [31:0] a,
            input [31:0] b,
            input [3:0] aluop,
            output zero,
            output reg [31:0] result);
            
            wire [31:0] sub = a-b;

            always @ (*) begin
                 case (aluop)
                    4'b0000 : result = a + b;
                    4'b0010 : result = a - b;
                    4'b0100 : result = a & b;
                    4'b0101 : result = a | b;
                    4'b0110 : result = a ^ b;
                    4'b0111 : result = ~(a | b);
                    4'b1010 : result = ( sub[31] == 1) ? 32'b1 : 32'b0;
                    default : result = 32'b0;
                 endcase
            end
                    
            assign zero = (result == 32'b0)? 1:0;
            

endmodule