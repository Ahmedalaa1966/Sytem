module UART_RX_TOP (
    input  wire       RX_IN        ,
    input  wire [5:0] prescale     ,
    input  wire       PAR_EN       ,
    input  wire       PAR_TYP      ,
    input  wire       clk          ,
    input  wire       rst          ,
    output wire [7:0] P_DATA       ,
    output wire       parity_error ,
    output wire       stop_error   ,
    output wire       data_valid   

);
    
    wire [4:0] edge_cnt ;
    wire [3:0] bit_cnt  ;
    wire       data_sample_en , edge_bit_enable, deser_en ;
    wire       stp_chk_en, strt_chk_en, par_chk_en, strt_glitch ;
    wire       sampled_bit ;
    wire       no_gap_r ;


    RX_FSM R1 (
        .data_sample_en    (data_sample_en) ,
        .edge_cnt          (edge_cnt)     ,
        .bit_cnt            (bit_cnt)      ,
        .edge_bit_enable    (edge_bit_enable),
        .deser_en          (deser_en)     ,
        .data_valid        (data_valid) ,
        .stp_chk_en        (stp_chk_en)   ,
        .strt_chk_en       (strt_chk_en)  ,
        .par_chk_en        (par_chk_en)   ,
        .prescale          (prescale)     ,
        .stop_error        (stop_error)   ,
        .parity_error      (parity_error) ,
        .strt_glitch       (strt_glitch)  ,
        .clk               (clk)          ,
        .RX_IN             (RX_IN)        ,
        .PAR_EN            (PAR_EN)       ,
        .rst               (rst)             
    ) ;

    edge_bit_counter e1 (
        .bit_cnt  (bit_cnt)  ,
        .edge_bit_enable(edge_bit_enable) ,
        .edge_cnt (edge_cnt) ,
        .prescale (prescale) ,
        .PAR_EN   (PAR_EN)   ,
        .clk      (clk)      ,
        .rst      (rst)       
    ) ;

    data_sampling d1 (
        .sampled_bit  (sampled_bit)  ,
        .prescale     (prescale)     ,
        .edge_cnt     (edge_cnt)     ,
        .data_sample_en (data_sample_en) ,
        .RX_IN        (RX_IN)        ,
        .clk          (clk)          ,
        .rst          (rst)                 
    ) ;

    deserializer DE1(
        .deser_en    (deser_en)    ,
        .sampled_bit (sampled_bit) ,
        .edge_cnt    (edge_cnt)    ,
        .PAR_EN      (PAR_EN)      ,
        .prescale    (prescale)    ,
        .P_DATA      (P_DATA)      ,
        .clk         (clk)         ,
        .rst         (rst)        
    ) ;

    parity_check p1 (
        .PAR_TYP     (PAR_TYP)      ,
        .sampled_bit (sampled_bit)  ,
        .parity_error(parity_error) ,
        .P_DATA      (P_DATA)       ,
        .par_chk_en  (par_chk_en)   ,
        .clk         (clk)          ,
        .rst         (rst)  
    );


    strt_check s1 (
        .strt_chk_en (strt_chk_en) ,
        .sampled_bit (sampled_bit) ,
        .strt_glitch (strt_glitch) ,
        .clk         (clk)         ,
        .rst         (rst)  

    );

    stop_check st1 (
        .sampled_bit (sampled_bit) ,
        .stp_chk_en  (stp_chk_en)  ,
        .stop_error  (stop_error)  ,
        .clk         (clk)         ,
        .rst         (rst)  
    );

    
endmodule