//======================================================================
//  Module      : strt_check
//  Designer    : Ahmed Alaa
//  Description : Start Bit Checker for UART RX.
//                Detects glitches during the start bit sampling.
//  Date        : 23-Sep-2025
//
//  Ports:
//    sampled_bit : Serial input bit being sampled.
//    strt_chk_en : Enable signal for start bit check.
//    CLK         : System clock.
//    RST         : Asynchronous active-low reset.
//    strt_glitch : Output flag indicating a start bit glitch.
//
//  Notes:
//    - strt_glitch is asserted when sampled_bit = 1
//      during the enabled start check window.
//======================================================================

module strt_check (
    input        wire             sampled_bit ,  // Sampled input bit
    input        wire             strt_chk_en ,  // Enable start bit check
    input        wire             clk         ,  // System clock
    input        wire             rst         ,  // Asynchronous active-low reset
    output       reg              strt_glitch    // Start bit glitch flag
);

    //==================================================================
    // Start Bit Check Logic
    //==================================================================
    always @(posedge clk or negedge rst) begin
        if (!rst) 
            strt_glitch <= 0;
        else begin
            if (strt_chk_en)
                strt_glitch <= sampled_bit;  // Capture glitch if line is high
            else 
                strt_glitch <= 0;
        end
    end

endmodule
