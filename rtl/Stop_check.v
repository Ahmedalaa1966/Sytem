//======================================================================
//  Module      : stop_check
//  Designer    : Ahmed Alaa
//  Description : Stop Bit Checker for UART RX.
//                Validates the stop bit; flags error if low.
//  Date        : 23-Sep-2025
//
//  Ports:
//    stp_chk_en  : Enable signal for stop bit check.
//    sampled_bit : Serial input bit being sampled.
//    CLK         : System clock.
//    RST         : Asynchronous active-low reset.
//    stop_error  : Output flag indicating stop bit error.
//
//  Notes:
//    - stop_error is asserted when sampled_bit = 0
//      during the enabled stop check window.
//======================================================================

module stop_check (
    input  wire stp_chk_en  ,  // Enable stop bit check
    input  wire sampled_bit ,  // Sampled input bit
    input  wire clk         ,  // System clock
    input  wire rst         ,  // Asynchronous active-low reset
    output reg  stop_error     // Stop bit error flag
);

    //==================================================================
    // Stop Bit Check Logic
    //==================================================================
    always @(posedge clk or negedge rst) begin
        if (!rst) 
            stop_error <= 0;
        else if (stp_chk_en) 
            stop_error <= !sampled_bit;  // Error if stop bit is low
        else
            stop_error <= 0;
    end

endmodule
