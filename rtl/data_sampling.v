//======================================================================
//  Module      : data_sampling
//  Designer    : Ahmed Alaa
//  Description : Data sampling block for UART Receiver.
//                Captures RX input at three different points around the
//                middle of the bit period to perform majority voting.
//
//  Date        : 23-Sep-2025
//
//  Ports:
//    prescale       : Oversampling parameter (number of edges per bit).
//    RX_IN          : Serial input data line.
//    edge_cnt       : Current edge count within the bit period.
//    data_sample_en : Enable signal for data sampling.
//    clk            : System clock.
//    rst            : Asynchronous active-low reset.
//    sampled_bit    : Output sampled bit after majority voting.
//
//  Notes:
//    - Captures RX at (half_edge-1), half_edge, (half_edge+1).
//    - Majority voting logic improves sampling robustness.
//======================================================================


module data_sampling (
    //======================== Inputs =====================
    input  wire [5:0] prescale        ,   // oversampling parameter
    input  wire       RX_IN           ,   // serial RX input
    input  wire [4:0] edge_cnt        ,   // edge counter
    input  wire       data_sample_en  ,   // enable data sampling
    input  wire       clk             ,   // system clock
    input  wire       rst             ,   // asynchronous reset
    
    //======================== Outputs =====================
    output wire       sampled_bit         // sampled bit after majority voting
);

    //======================== Internal Registers =====================
    reg        data_1, data_2, data_3 ;     // capture registers
    reg        RX_IN_r ;                    // registered RX input
    wire [4:0] half_edge, half_edge_plus1, half_edge_minus1 ;

    //======================== Half Edge Calculations =====================
    assign half_edge        = (prescale >> 1) - 4'b1 ; // center point (minus one for zero-based count)
    assign half_edge_plus1  = half_edge + 4'b1 ;       // right sample point
    assign half_edge_minus1 = half_edge - 4'b1 ;       // left sample point

    //======================== Sampling Logic =====================
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            data_1  <= 0;
            data_2  <= 0;
            data_3  <= 0;
            RX_IN_r <= 1;
        end
        else begin
            RX_IN_r <= RX_IN ;            // register input for stability
            if(data_sample_en) begin
                if(edge_cnt == half_edge) 
                    data_1 <= RX_IN_r ;   // capture at middle
                else if(edge_cnt == half_edge_minus1)         
                    data_2 <= RX_IN_r ;   // capture at left
                else if(edge_cnt == half_edge_plus1)
                    data_3 <= RX_IN_r ;   // capture at right
            end
            else begin
                data_1 <= 0;
                data_2 <= 0;
                data_3 <= 0;
            end
        end
    end

    //======================== Majority Voting =====================
    assign sampled_bit = (data_1 & data_2) | (data_1 & data_3) | (data_2 & data_3) ;

endmodule
