//======================================================================
//  Module      : parity_check
//  Designer    : Ahmed Alaa
//  Description : Parity check block for UART Receiver.
//                Compares the received parity bit with the calculated
//                parity from received data to detect errors.
//
//  Date        : 23-Sep-2025
//
//  Ports:
//    par_chk_en     : Enable signal for parity checking.
//    PAR_TYP        : Parity type (0 = even, 1 = odd).
//    sampled_bit    : Received parity bit from RX.
//    clk            : System clock.
//    rst            : Asynchronous active-low reset.
//    P_DATA         : Parallel received data (8 bits).
//    parity_error   : Output flag asserted if parity check fails.
//
//  Notes:
//    - For even parity (PAR_TYP=0), parity is XOR of data.
//    - For odd parity (PAR_TYP=1), parity is inverted XOR of data.
//======================================================================


module parity_check (
    //======================== Inputs =====================
    input        wire                     par_chk_en    ,   // enable parity check
    input        wire                     PAR_TYP       ,   // parity type (0=even, 1=odd)
    input        wire                     sampled_bit   ,   // received parity bit
    input        wire                     clk           ,   // system clock
    input        wire                     rst           ,   // asynchronous reset
    input        wire     [7:0]           P_DATA        ,   // received parallel data
    
    //======================== Outputs =====================
    output reg                            parity_error      // asserted when parity mismatch occurs
);

    //======================== Internal Signals =====================
    wire parity_calculated ;             // calculated parity value

    //======================== Parity Error Logic =====================
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            parity_error <= 0;           // reset state
        end
        else begin
            if(par_chk_en) begin
                parity_error <= parity_calculated ^ sampled_bit ; // compare
            end
            else begin
                parity_error <= 0 ;      // disable check → no error
            end
        end
    end 

    //======================== Parity Calculation =====================
    assign parity_calculated = (PAR_TYP) ? !(^P_DATA[7:0]) : ^P_DATA[7:0] ;

endmodule
