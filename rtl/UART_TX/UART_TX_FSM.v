//======================================================================
//  Module      : FSM
//  Designer    : Ahmed Alaa
//  Description : UART TX Finite State Machine
//                Controls busy flag, serializer enable, and mux select
//======================================================================



module FSM (
    input  wire      Data_valid  ,          // when asserted the data on the signal is conserdered
    input  wire      ser_done    ,          // from the serializer block 
    input  wire      clk         ,          // global clock for all the blocks
    input  wire      rst         ,          // astnchrounus active low reset
    input  wire      PAR_EN      ,          // asserted when the bits has an even/odd parity extra bit
    output reg       busy        ,          // bit which is asserted when the tx is transimitng
    output reg       ser_en      ,          // enable signal is asserted when the data valid comes
    output reg [1:0] mux_select             // mux select which choose the output  of the TX_out
);

    // FSM state declaration 
    localparam  IDLE      =3'b000 ,          // IDLE and reset state
                st_trans  =3'b001 ,          // start the transmition state which allow the start bit 
                trans     =3'b011 ,          // transmition state which the data bits are sent 
                parity    =3'b010 ,          // parity state in which the parity bit is sent depending on the parity enable 
                end_trans =3'b110 ;          // end transmtion state in which the end bit is end 



    //internal wire declaration
    reg [2:0] ns,cs           ;                // next state and current state declaration 
    reg       busy_comp       ;                // the combinational signal of busy 
    reg       ser_en_comp     ;                // the combinational signal of serial enable 



    // state transition akways block
    always @(posedge clk or negedge rst) begin
        if(!rst) begin
            cs <= IDLE ;                      // IDLE is the reset state                         
        end
        else
            cs <= ns ;                       // state transition logic 
    end

    // next state and output logic
    always @(*) begin

        // giving a default vaues to the output siignals in order prevent latches 
        busy_comp = 0          ;                     
        ser_en_comp = 0        ;      
        mux_select = 'b00 ;

        case (cs)
            IDLE:
            begin
                //reset all signals 
                mux_select = 'b01 ;
                busy_comp = 0          ;
                ser_en_comp = 0        ;
                if(Data_valid)                         // when the data valid is asserted so it means the transmition starts
                    ns = st_trans;
                else
                    ns = IDLE ;                        // if the data valid is not asserted we will still in the IDLE state untill it is asserted to start the transmition
            end

            st_trans:
            begin
                ser_en_comp = 1        ;                 
                mux_select = 'b00 ;                    // mux select to get the start bit
                busy_comp = 1          ;               // all the transmition stages the busy is asserted
                ns = trans             ;               // moving to the next state directly which means the we will stay in the st_trans for inly ine clock cycle
            end

            trans:
            begin
                mux_select = 'b10 ;                    // mux select to the serializer out 
                busy_comp = 1          ;               // all the transmition stages the busy is asserted
                if(ser_done) begin 
                    ser_en_comp = 0;                   // counter in the sequential always block to count the width of the data 
                    if(PAR_EN)
                        ns = parity ;
                    else
                        ns = end_trans ;
                end
                else begin
                    ns= trans ;
                    ser_en_comp = 1; 
                end
            end

            end_trans:
            begin
                busy_comp = 1         ;              // all the transmition stages the busy is asserted
                ser_en_comp = 0        ;      
                mux_select = 'b01 ;                  // select to get the end bit
                ns = IDLE ;                       // only one clock cycle in this state  
            end

            parity:
            begin 
                busy_comp = 1               ;                   // all the transmition stages the busy is asserted
                mux_select = 'b11      ;                   // select the parity bit which comes befor the end bit
                ns = end_trans         ;                   // only one clock cycle in this state
            end

            default: ns = IDLE ;
        endcase
    end

    // always block to register the output 
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            busy       <= 0 ;                       // reset the busy F/F
            ser_en     <= 0;
        end

        else  begin      
            busy       <= busy_comp   ;
            ser_en     <= ser_en_comp ;
        end
    end


    
endmodule


