//======================================================================
//  Module      : edge_bit_counter
//  Designer    : Ahmed Alaa
//  Description : Edge and Bit Counter for UART RX.
//                Counts edges within one bit duration and increments
//                bit counter when a full bit period is completed.
//  Date        : 23-Sep-2025
//
//  Ports:
//    edge_bit_enable : Enable signal for counting.
//    PAR_EN          : Parity enable (not used directly here).
//    CLK             : System clock.
//    RST             : Asynchronous active-low reset.
//    prescale        : Number of clock cycles per bit.
//    edge_cnt        : Edge counter (counts up to prescale).
//    bit_cnt         : Bit counter (increments per bit).
//
//  Notes:
//    - edge_cnt resets every prescale cycles.
//    - bit_cnt increments once per completed bit.
//======================================================================

module edge_bit_counter (
    input  wire       edge_bit_enable ,  // Enable edge/bit counting
    input  wire       PAR_EN         ,   // Parity enable (not used here)
    input  wire       clk            ,   // System clock
    input  wire [5:0] prescale       ,   // Prescale value
    input  wire       rst            ,   // Asynchronous active-low reset
    output reg [4:0]  edge_cnt       ,   // Edge counter
    output reg [3:0]  bit_cnt            // Bit counter
);

    wire edge_count_done;  // Flag when edge counter completes prescale

    //==================================================================
    // Edge Counter Logic
    //==================================================================
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            edge_cnt <= 'b0;
        end
        else if (edge_bit_enable) begin
            if (edge_count_done)
                edge_cnt <= 'b0;
            else
                edge_cnt <= edge_cnt + 'b1;
        end
        else begin
            edge_cnt <= 'b0;
        end
    end

    // Edge count complete when edge_cnt reaches prescale - 1
    assign edge_count_done = (edge_cnt == (prescale - 6'b1)) ? 1'b1 : 1'b0;

    //==================================================================
    // Bit Counter Logic
    //==================================================================
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            bit_cnt <= 'b0;
        end
        else if (edge_bit_enable) begin
            if (edge_count_done)
                bit_cnt <= bit_cnt + 'b1;
        end
        else begin
            bit_cnt <= 'b0;
        end
    end

endmodule
