module MUX (
    input  wire       ser_data   ,
    input  wire       par_bit    ,
    input  wire       clk        ,
    input  wire       rst        ,
    input  wire [1:0] mux_select ,
    output reg        TX_OUT 
);
    reg TX_OUT_comb ;
    
    always @(*) begin
        case (mux_select)
            2'b00:    TX_OUT_comb = 0 ;
            2'b01:    TX_OUT_comb = 1  ;
            2'b10:    TX_OUT_comb = ser_data  ;
            2'b11:    TX_OUT_comb = par_bit   ;  
            default : TX_OUT_comb = 1 ;
        endcase
    end


    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            TX_OUT <= 'b0 ;
        end
        else 
            TX_OUT <= TX_OUT_comb ;
    end
endmodule
