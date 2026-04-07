`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 
// Design Name: 
// Module Name: timer_input
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module timer_input #(parameter BITS = 4)( 
    input clk,
    input reset_n,
    input enable,
    input [BITS-1:0] FINAL_VALUE,       
    output done
    );
    
    reg [BITS-1:0] Q_reg; 
    wire [BITS-1:0] Q_next;
    
    assign done = (Q_reg == FINAL_VALUE);
    assign Q_next = (done) ? {BITS{1'b0}} : Q_reg + 1;
    
    always @(posedge clk or negedge reset_n)
    begin
        if (~reset_n)
            Q_reg <= {BITS{1'b0}};
        else if (enable)
            Q_reg <= Q_next;
        else    
            Q_reg <= Q_reg; 
    end
    
endmodule