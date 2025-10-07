module SYS_CNTRL (
    //===================== inputs ==================
    input           wire               CLK          ,                 // refrence clock for  the system control module
    input           wire               RST          ,                 // Asynchrous reset for the module
    input           wire               RdData_Valid ,                 // input from the regfile that indicates that the data sent is valid 
    input           wire    [15:0]     ALU_OUT      ,                 // ALU result
    input           wire               OUT_Valid    ,                 // input from the ALU module to indicate that the ALU result is valid 
    input           wire    [7:0]      RdData       ,                 // read data bus from the register file 
    input           wire    [7:0]      RX_P_DATA    ,                 // reading the frames from the uart TX
    input           wire               RX_D_VLD     ,                 // to ensure that the data on RX_P_Data is valid 
    input           wire               FIFO_FULL    ,

    //===================== outputs ===================
    output         reg     [7:0]       TX_P_DATA    ,                 // port to send the output on the uart TX 
    output         reg                 TX_D_VLD     ,                 // to ensure that the data send on the tx port is valid 
    output         reg                 clk_div_en   ,                 // control signal which enables the clk division and is the input of the clkdiv module
    output         reg     [3:0]       ALU_FUN      ,                 // choose which operation to be done on the ALU 
    output         reg                 ALU_EN       ,                 // ALU enable signal
    output         reg                 CLK_EN       ,                 // clock gate enable 
    output         reg     [3:0]       Adrress      ,                 // Address bus to the register file 
    output         reg                 WrEn         ,                 // write enable which is input to the refister file 
    output         reg                 RdEn         ,                 // read enable which is input to the register file 
    output         reg     [7:0]       WrData                         // write data bus which is input to the register file 
);

    //========== defining FSM states =========
    localparam  IDLE      = 4'b0000 ,  //0
                Wr_Addr   = 4'b0001 ,  //1
                Wr_Data   = 4'b0010 ,  //2
                Rd_Addr   = 4'b0011 ,  //3
                OP_A      = 4'b0100 ,  //4
                OP_B      = 4'b0101 ,  //5
                ALU_OP   = 4'b0110  ,  //6
                Rd_Data   = 4'b0111 ,  //7
                Wr_FIFO   = 4'b1000 ,  //8
                ALU_valid = 4'b1001 ,  //9
                Write_LSB = 4'b1010 ,  //10
                Write_MSB = 4'b1011 ;  //11



    //=========== FSM state regiter ============
    reg [3:0] cs,ns ;
    reg [3:0] Address_comb ;



    // ======== state transition ===========
    always @(posedge CLK or negedge RST) begin
        if(!RST)
            cs <= IDLE ;
        else 
            cs <= ns ;
    end


    // =========== next state logic =======
    always @(*) begin
        case (cs)

            IDLE : begin
                if(RX_D_VLD) begin

                    case (RX_P_DATA)
                        'hAA: ns = Wr_Addr ;       // register file write command
                        'hBB: ns = Rd_Addr ;       // register file read command 
                        'hCC: ns = OP_A    ;       // Alu operation command with 2 operand (4 frames)
                        'hDD: ns = ALU_OP ;       // Alu operation with no  command (2 frames)
                        default: ns = IDLE ;
                    endcase

                end
                else 
                    ns = IDLE ;
            end

            Wr_Addr: begin
                if(RX_D_VLD)                        // no any transition until the data valid is asserted from the TX   
                    ns = Wr_Data ;
                else 
                    ns = Wr_Addr ;  
            end

            Wr_Data: begin
                if(RX_D_VLD)
                    ns = IDLE ;
                else 
                    ns = Wr_Data ;
            end

            Rd_Addr: begin
                if(RX_D_VLD)
                    ns = Rd_Data ;
                else 
                    ns = Rd_Addr ;
            end

            Rd_Data: begin
                if(RdData_Valid)
                    ns = Wr_FIFO ;
                else 
                    ns = Rd_Data ; 
            end

            Wr_FIFO: begin
                if(!FIFO_FULL)
                    ns = IDLE ;
                else 
                    ns = Wr_FIFO ;
            end

            OP_A : begin
                if(RX_D_VLD)
                    ns = OP_B ;
                else 
                    ns = OP_A ; 
            end

            OP_B: begin
                if(RX_D_VLD)
                    ns = ALU_OP ;
                else 
                    ns = OP_B ; 
            end

            ALU_OP : begin
                if(RX_D_VLD)
                    ns= ALU_valid ;
                else 
                    ns = ALU_OP ;
            end

            ALU_valid : begin
                if(OUT_Valid)
                    ns = Write_LSB ;
                else 
                    ns = ALU_valid ;
            end

            Write_LSB : begin
                if(!FIFO_FULL)
                    ns = Write_MSB ;
                else 
                    ns = Write_LSB ; 
            end

            Write_MSB : begin
                if(!FIFO_FULL)
                    ns = IDLE ;
                else 
                    ns = Write_MSB ;  
            end

            default: ns =  IDLE ;
        endcase
    end


    // =========================================== output logic ===============================
    always @(*) begin

        ALU_FUN      = 'b0 ;
        ALU_EN       = 'b0 ;
        CLK_EN       = 'b0 ;
        Address_comb = 'b0 ;
        WrEn         = 'b0 ;
        RdEn         = 'b0 ;
        WrData       = 'b0 ;
        TX_P_DATA    = 'b0 ;
        TX_D_VLD     = 'b0 ;
        clk_div_en   = 'b1 ;


        case (cs)
            IDLE: begin
                if(RX_D_VLD && RX_P_DATA == 'hCC)
                    Address_comb = 'b0 ;                     // address fro operand A  
                else 
                    Address_comb = 'b1 ;
            end

            OP_A: begin
                if(RX_D_VLD) begin
                    Address_comb = 'b00000001 ;            // address for operand B 
                    WrData = RX_P_DATA  ;
                    WrEn    = 'b1        ;
                end 
                else begin
                    WrEn    = 'b0 ;
                    WrData = 'b0 ;
                    Address_comb = 'b0 ;
                end
            end

            OP_B: begin
                if(RX_D_VLD) begin

                    WrData = RX_P_DATA ;
                    WrEn    =  'b1 ;
                end
                else begin
                   WrData = 'b0 ;
                   WrEn    = 'b0 ;
                end
            end

            ALU_OP: begin
                CLK_EN = 'b1 ;                         // enables the ALU clock 
                if(RX_D_VLD) begin
                    ALU_FUN = RX_P_DATA[3:0] ;
                    ALU_EN      = 'b1        ;
                end
                else begin
                    ALU_FUN = 'b0 ;
                    ALU_EN  = 'b0 ;
                end
            end

            ALU_valid : begin
                CLK_EN ='b1 ;
                if(OUT_Valid) begin
                    ALU_EN = 0;
                    CLK_EN = 0; 
                end
                else  begin
                    ALU_EN = 1;
                    CLK_EN = 1;
                end  
            end

            Write_LSB : begin
                if(!FIFO_FULL) begin
                    TX_P_DATA    = ALU_OUT[7:0];
			        TX_D_VLD     = 1'b1;
                end
                else begin
                    TX_P_DATA    = 0;
			        TX_D_VLD     = 1'b0;
                end
            end

            Write_MSB : begin
                 if(!FIFO_FULL) begin
                    TX_P_DATA    = ALU_OUT[15:8];
			        TX_D_VLD     = 1'b1;
                end
                else begin
                    TX_P_DATA    = 0;
			        TX_D_VLD     = 1'b0;
                end
            end

            Wr_Addr : begin
                if(RX_D_VLD) begin
                    Address_comb = RX_P_DATA[3:0] ;   
                end
                else begin
                    Address_comb = 'b0 ;
                end
            end

            Wr_Data : begin
                if(RX_D_VLD) begin
                    WrEn    = 'b1 ;
                    WrData = RX_P_DATA ;
                end
                else begin
                    WrEn    = 'b0 ;
                    WrData = 'b0 ;
                end
            end

            Rd_Addr : begin
                if(RX_D_VLD)
                    Address_comb = RX_P_DATA[3:0] ;
                else 
                    Address_comb = 'b0 ;
            end

            Rd_Data : begin
                if(RdData_Valid)
                    RdEn = 0;
                else 
                    RdEn = 1;
            end

            Wr_FIFO: begin
                if(!FIFO_FULL) begin
                    TX_P_DATA = RdData ;
                    TX_D_VLD = 'b1 ;
                end
                else begin
                    TX_P_DATA = 0 ;
                    TX_D_VLD = 'b0 ;
                end
            end

            default: begin
                ALU_FUN      = 'b0 ;
                ALU_EN          = 'b0 ;
                CLK_EN       = 'b0 ;
                Address_comb = 'b0 ;
                WrEn         = 'b0 ;
                RdEn         = 'b0 ;
                WrData       = 'b0 ;
                TX_P_DATA    = 'b0 ;
                TX_D_VLD     = 'b0 ;
                clk_div_en   = 'b0 ;
            end 

        endcase
    end

    // ============= output register =============
    always @(negedge CLK or negedge RST) begin
        if(!RST) 
            Adrress <= 'b0 ;
        else
            Adrress <= Address_comb ;
    end

endmodule
