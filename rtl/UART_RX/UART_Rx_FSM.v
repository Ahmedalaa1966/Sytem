//======================================================================
//  Module      : RX_FSM
//  Designer    : Ahmed Alaa
//  Description : Finite State Machine for UART Receiver Control Logic.
//                Controls the flow of RX operations including start,
//                data, parity, stop, and error checking stages.
//
//  Date        : 23-Sep-2025
//
//  Ports:
//    RX_IN         : Serial input data from RX line.
//    PAR_EN        : Enables parity bit checking when high.
//    edge_cnt      : Edge counter for oversampling (from edge counter).
//    bit_cnt       : Bit counter for received bits.
//    parity_error  : Asserted when parity check fails.
//    strt_glitch   : Asserted if start bit glitch is detected.
//    stop_error    : Asserted when stop bit is invalid (logic 0).
//    prescale      : Oversampling rate (number of edges per bit).
//    clk           : System clock.
//    rst           : Asynchronous active-low reset.
//
//  Outputs:
//    edge_bit_enable : Enables edge counter.
//    data_sample_en  : Enables data sampling logic.
//    par_chk_en      : Enables parity check logic.
//    strt_chk_en     : Enables start bit check logic.
//    stp_chk_en      : Enables stop bit check logic.
//    deser_en        : Enables deserializer logic.
//    data_valid      : Indicates that a complete valid frame is received.
//
//  Notes:
//    - FSM States: IDLE, R_st_bit, R_data, R_parity_bit, R_stop_bit, R_err_check.
//    - Oversampling is performed based on prescale parameter.
//    - Stop bit number depends on parity enable.
//======================================================================


module RX_FSM  (
    //======================== Inputs =====================
    input         wire                 RX_IN            ,               // input comes from the pad
    input         wire                 PAR_EN           ,               // signal to enable the parity bit
    input         wire    [4:0]        edge_cnt         ,               // signak comes from edge bit counter module to identify the edge number in order to make a correct oversampling
    input         wire    [3:0]        bit_cnt          ,               // signal comes from edge bit counter module to identify the bit number counter
    input         wire                 parity_error     ,               // control signal from the parity error module that is asserted when the parity bit doest match the calculated parity bit 
    input         wire                 strt_glitch      ,               // control signal that is asserted whhen the a start gitch happens 
    input         wire                 stop_error       ,               // control signal that is asserted when the stop bit is 0
    input         wire    [5:0]        prescale         ,               // the oversampling parameter
    input         wire                 clk              ,               // clock for all the UART_RX modules
    input         wire                 rst              ,               // rst for all the UART_RX modules 
    
    //======================== outputs =====================
    output        reg               edge_bit_enable     ,               // control signal to enable the edge bit counter module 
    output        reg               data_sample_en      ,               // control signal to enable the data sampling module
    output        reg               par_chk_en          ,               // con trol signal to enable the parity check module
    output        reg               strt_chk_en         ,               // control signal to enable the parity check module
    output        reg               stp_chk_en          ,               // control signal to enable the stop check module
    output        reg               deser_en            ,               // control signal to enable the deserializer module
    output        reg               data_valid                          // control signal sent to the uart TX that indicates that the data on the bus is valid
);



    //==================declaration of current state and next state registers  ===================
    reg [3:0] stop_bit_number ;                                         // the stop bit number which is dependant on the parity enable                 
    reg       RX_IN_r ;                                                 // a register to protect the input 
    reg [2:0] cs ,ns ;                                                  // current stae and the next  state of the FSM 



    //======================== defining the states of the FSM  ========================
    localparam IDLE         = 3'b000    ,
               R_st_bit     = 3'b001    ,
               R_data       = 3'b011    ,
               R_parity_bit = 3'b010    ,
               R_stop_bit   = 3'b110    ,
               R_err_check  = 3'b111    ;




    //======================== state transition always block  ========================
    always @(posedge clk or negedge rst) begin
        if(!rst) 
            cs <= IDLE ;
        else 
            cs <= ns   ;
    end



    
    //======================== next state logic + output ogic  always block  ========================
    always @(*) begin
        
        // intialinzing the outputs 
        edge_bit_enable               ='b0;
        data_sample_en                ='b0;
        par_chk_en                    ='b0;
        strt_chk_en                   ='b0;
        stp_chk_en                    ='b0;
        deser_en                      ='b0;
        data_valid                    ='b0;


        case (cs)
            
            IDLE : begin
                if(!RX_IN_r) begin
                    ns                   = R_st_bit   ;
                    edge_bit_enable      = 'b1        ;                 // the edge counter is enabled once the RX_IN is zero 
                    data_sample_en       = 'b1        ;               
                    stop_bit_number      = 0          ;
                end
                else    
                    ns = IDLE ;
            end

            R_st_bit : begin                 
                edge_bit_enable  = 'b1;
                data_sample_en   = 'b1;
                strt_chk_en      = 'b1;
                if(bit_cnt==0 && edge_cnt==prescale-1) begin                   
                    if(!strt_glitch)                                          // check the start glitch
                        ns = R_data ;
                    else    
                        ns=IDLE ;
                end
                else 
                    ns = R_st_bit ;
            end

            R_data : begin
                edge_bit_enable  = 'b1;
                data_sample_en   = 'b1;
                deser_en         = 'b1;

                if(bit_cnt=='d8 && (edge_cnt == prescale-1)) begin
                    if(PAR_EN)
                        ns = R_parity_bit ;
                    else
                        ns = R_stop_bit ;
                end
                else 
                    ns = R_data; 
            end

            R_parity_bit : begin
                data_sample_en = 'b1;
                edge_bit_enable  = 'b1;
                par_chk_en     = 'b1;
                if( bit_cnt=='d9 && (edge_cnt == prescale-1) ) begin
                    ns = R_stop_bit ;
                end
                else 
                    ns = R_parity_bit;
            end
                
            R_stop_bit : begin
                data_sample_en ='b1;
                edge_bit_enable  = 'b1;
                stp_chk_en     ='b1;

                stop_bit_number = (PAR_EN) ? 'd10 : 'd11 ; 
                    if( bit_cnt== stop_bit_number && (edge_cnt == prescale-2)) begin
                        ns = R_err_check ;
                    end
                    else 
                        ns = R_stop_bit ;

            end

            R_err_check : begin
                 data_sample_en ='b1;
                if(stop_error | parity_error)
                    data_valid = 0; 
                else
                    data_valid = 1;

                // next stae logic 
                if(!RX_IN_r)
                    ns = R_st_bit ;
                else if(RX_IN_r && edge_cnt==0) 
                    ns = IDLE ;
                else    
                    ns = R_err_check;
            end

            default: ns = IDLE ;
        endcase
    end    


        //======================== input isolation always block  ========================
        always @(posedge clk or negedge rst) begin
            if(!rst) begin
                RX_IN_r    <= RX_IN ; 
            end
            else begin
                RX_IN_r    <= RX_IN ;
            end
        end
endmodule