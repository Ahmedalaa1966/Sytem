module UART_TX_TOP (
    input  wire [7:0] P_DATA ,
    input  wire       Data_valid ,
    input  wire       PAR_EN     ,
    input  wire       PAR_TYP    ,
    input  wire       clk        ,
    input  wire       rst        ,
    output wire       TX_OUT     ,
    output wire       BUSY       
);



    // internal signals 
    wire [1:0] mux_select ;
    wire       ser_data ;
    wire       par_bit ;
    wire       ser_done ,ser_en ;

   


    serializer s1 (
        .P_DATA(P_DATA)         ,
        .ser_done(ser_done)     ,
        .ser_en(ser_en)         ,
        .busy(BUSY)             ,
        .Data_Valid(Data_valid) ,
        .rst(rst)               ,
        .clk(clk)               ,
        .ser_data(ser_data)
    ) ;

    FSM f1 (
        .ser_done(ser_done)  ,
        .ser_en(ser_en)         ,
        .Data_valid(Data_valid) ,
        .clk(clk)               ,
        .rst(rst)               ,
        .PAR_EN(PAR_EN)         ,
        .mux_select(mux_select) ,
        .busy(BUSY)             
    );

    parity_calc p1 (
        .P_DATA(P_DATA)         ,
        .Data_valid(Data_valid) ,
        .busy(BUSY)             ,
        .PAR_TYP(PAR_TYP)       ,
        .rst(rst)               ,
        .clk(clk)               ,
        .par_bit(par_bit)        
    ) ;

    MUX m1 (
        .mux_select(mux_select) ,
        .ser_data(ser_data)     ,
        .rst(rst)               ,
        .clk(clk)               ,
        .par_bit(par_bit)       ,
        .TX_OUT(TX_OUT)         

    );









endmodule