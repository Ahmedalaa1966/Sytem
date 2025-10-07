module SYS_TOP (
    input           wire                 RST_N,
    input           wire                 UART_CLK,
    input           wire                 REF_CLK,
    input           wire                 UART_RX_IN,
    output          wire                 UART_TX_O,
    output          wire                 parity_error,
    output          wire                 framing_error
);

    // ========================== internal wires ==============================
    wire                                 RdData_Valid_T    ;
    wire           [15:0]                ALU_OUT_T  ;
    wire                                 OUT_Valid_T       ;
    wire           [7:0]                 RdData_T ,Wr_Data_T ;
    wire           [7:0]                 RX_P_DATA_T , TX_P_DATA_T ;
    wire                                 RX_D_VLD_T , FIFO_FULL_T , TX_D_VLD_T, clk_div_en_T ;
    wire           [3:0]                 ALU_FUN_T, Adrress_T ;
    wire                                 ALU_EN_T, CLK_EN_T, WrEn_T, RdEn_T ;
    wire           [7:0]                 REG0_T, REG1_T, REG2_T, REG3_T ;
    wire                                 GATED_CLK_T ; 
    wire                                 EMPTY_T ; 
    wire           [7:0]                 RX_OUT_P_T ;
    wire                                 RX_OUT_V_T ;
    wire                                 BUSY ;
    wire                                 SYNC_REF_RST, SYNC_UART_RST ;
    wire                                 TX_REF_CLK , RX_REF_CLK ;
    wire           [7:0]                 DIV_RATIO_RX ;
    wire           [7:0]                 RD_DATA_T ;




    /*======================================================================
    ================================= Sytem Control ===========================
    ===========================================================================*/
    SYS_CNTRL system_control(

    .CLK          (REF_CLK)                ,                 
    .RST          (SYNC_REF_RST)           ,                 
    .RdData_Valid (RdData_Valid_T)         ,                
    .ALU_OUT      (ALU_OUT_T)              ,               
    .OUT_Valid    (OUT_Valid_T)            ,                
    .RdData       (RdData_T)               ,                
    .RX_P_DATA    (RX_P_DATA_T)            ,                 
    .RX_D_VLD     (RX_D_VLD_T)             ,              
    .FIFO_FULL    (FIFO_FULL_T)            ,
    .TX_P_DATA    (TX_P_DATA_T)            ,                 
    .TX_D_VLD     (TX_D_VLD_T)             ,                
    .clk_div_en   (clk_div_en_T)           ,                 
    .ALU_FUN      (ALU_FUN_T)              ,                
    .ALU_EN       (ALU_EN_T)               ,               
    .CLK_EN       (CLK_EN_T)               ,               
    .Adrress      (Adrress_T)              ,                
    .WrEn         (WrEn_T)                 ,                
    .RdEn         (RdEn_T)                 ,                
    .WrData       (Wr_Data_T)    

    ); 

    /*======================================================================
    ================================= Register file ===========================
    ===========================================================================*/
    RegFile #(
    .WIDTH (8),
    .DEPTH (16),
    .ADDR  (4)
   ) RegFile_inst (

    .CLK        (REF_CLK)       ,
    .RST        (SYNC_REF_RST)  ,
    .WrEn       (WrEn_T)        ,
    .RdEn       (RdEn_T)        ,
    .Address    (Adrress_T)     ,
    .WrData     (Wr_Data_T)     ,
    .RdData     (RdData_T)      ,
    .RdData_VLD (RdData_Valid_T),
    .REG0       (REG0_T)        ,
    .REG1       (REG1_T)        ,
    .REG2       (REG2_T)        ,
    .REG3       (REG3_T)

    );


    /*======================================================================
    ================================= ALU ===========================
    ===========================================================================*/
    ALU #(
    .OPER_WIDTH (8),
    .OUT_WIDTH  (16)
    ) ALU_inst (

    .A        (REG0_T)         ,
    .B        (REG1_T)         ,
    .EN       (ALU_EN_T)       ,
    .ALU_FUN  (ALU_FUN_T)      ,
    .CLK      (GATED_CLK_T)    ,    
    .RST      (SYNC_REF_RST)          ,
    .ALU_OUT  (ALU_OUT_T)      ,
    .OUT_VALID(OUT_Valid_T)

    );


    /*======================================================================
    ===============================Clock Gating for ALU ====================
    ===========================================================================*/
    CLK_GATE CLK_GATE_inst (

    .CLK_EN    (CLK_EN_T)    ,
    .CLK       (REF_CLK)     ,
    .GATED_CLK (GATED_CLK_T)

    );

    /*======================================================================
    ================================= FIFO ==================================
    ===========================================================================*/
    /*ASYNC_FIFO #(
    .DATA_WIDTH (8)
    ) ASYNC_FIFO_inst (

    .W_CLK   (REF_CLK)        ,
    .W_RST   (SYNC_REF_RST)     ,
    .w_INC   (TX_D_VLD_T)     ,
    .R_CLK   (RX_REF_CLK)      ,
    .R_RST   (SYNC_UART_RST)     ,
    .R_INC   (R_INC_T)        ,
    .WR_DATA (TX_P_DATA_T)      ,
    .FULL    (FIFO_FULL_T)    ,
    .EMPTY   (EMPTY_T)        ,
    .RD_DATA (RD_DATA_T)

    );*/
    Async_fifo #(
    .D_SIZE (8),
    .A_SIZE (3),
    .P_SIZE (4),
    .F_DEPTH(8)
    ) Async_fifo_inst (

    .i_w_clk   (REF_CLK),        // write clock
    .i_w_rstn  (SYNC_REF_RST),   // write reset (active low!)
    .i_w_inc   (TX_D_VLD_T),     // write enable
    .i_r_clk   (RX_REF_CLK),     // read clock
    .i_r_rstn  (SYNC_UART_RST),  // read reset (active low!)
    .i_r_inc   (R_INC_T),        // read enable
    .i_w_data  (TX_P_DATA_T),    // write data
    .o_r_data  (RD_DATA_T),      // read data
    .o_full    (FIFO_FULL_T),    // FIFO full flag
    .o_empty   (EMPTY_T)         // FIFO empty flag

    );

    /*======================================================================
    =================================Pulse Generator===========================
    ===========================================================================*/
    PULSE_GEN PULSE_GEN_inst (

    .RST       (SYNC_UART_RST)        ,
    .CLK       (TX_REF_CLK)      ,
    .LVL_SIG   (BUSY)         ,
    .PULSE_SIG (R_INC_T)

);

    /*======================================================================
    ================================= UART ===========================
    ===========================================================================*/
    
    
    
    UART #(
    .DATA_WIDTH (8)
    ) UART_inst (

    .RST           (SYNC_UART_RST)           ,
    .TX_CLK        (TX_REF_CLK)      ,
    .RX_CLK        (RX_REF_CLK)      ,
    .RX_IN_S       (UART_RX_IN)      ,
    .RX_OUT_P      (RX_OUT_P_T)      , 
    .RX_OUT_V      (RX_OUT_V_T)      ,
    .TX_IN_P       (RD_DATA_T)       , 
    .TX_IN_V       (!EMPTY_T)       , 
    .TX_OUT_S      (UART_TX_O)      ,
    .TX_OUT_V      (BUSY)      ,  
    .Prescale      (REG2_T[7:2])      , 
    .parity_enable (REG2_T[0]) ,
    .parity_type   (REG2_T[1])   ,
    .parity_error  (parity_error)  ,
    .framing_error (framing_error)

    );

    /*======================================================================
    ================================= refrence reset sync ==================
    ========================================================================*/
    reset_sync #(
    .NUM_STAGES (2)
    ) reset_sync_inst1 (

    .RST      (RST_N)        ,
    .CLK      (REF_CLK)      ,
    .SYNC_RST (SYNC_REF_RST)
    );

    /*======================================================================
    ================================= UART reset sync ===========================
    ===========================================================================*/
    reset_sync #(
    .NUM_STAGES (2)
    ) reset_sync_inst2 (

    .RST      (RST_N)        ,
    .CLK      (UART_CLK)      ,
    .SYNC_RST (SYNC_UART_RST)
    );

    /*======================================================================
    ================================= Data sync ===========================
    ===========================================================================*/
    DATA_SYNC #(
    .NUM_STAGES (2),
    .BUS_WIDTH  (8)
    ) DATA_SYNC_inst (

    .CLK            (REF_CLK)        ,
    .RST            (SYNC_REF_RST)   ,
    .unsync_bus     (RX_OUT_P_T)     ,
    .bus_enable     (RX_OUT_V_T)     ,
    .sync_bus       (RX_P_DATA_T)    ,
    .enable_pulse_d (RX_D_VLD_T)

    );


    /*======================================================================
    ================================= clock dividor for the TX ==============
    ===========================================================================*/
    ClkDiv #(
    .RATIO_WD (8)
    ) ClkDiv_inst_TX (

    .i_ref_clk  (UART_CLK)        ,
    .i_rst      (SYNC_UART_RST)  ,
    .i_clk_en   (clk_div_en_T)   ,
    .i_div_ratio(REG3_T)         ,
    .o_div_clk  (TX_REF_CLK)

    );

    /*======================================================================
    ================================= Clock dividor for the RX =============
    ===========================================================================*/
    ClkDiv #(
    .RATIO_WD (8)
    ) ClkDiv_inst_RX (

    .i_ref_clk  (UART_CLK)        ,
    .i_rst      (SYNC_UART_RST)  ,
    .i_clk_en   (clk_div_en_T)   ,
    .i_div_ratio(DIV_RATIO_RX)   ,
    .o_div_clk  (RX_REF_CLK)

    );

    /*======================================================================
    ================================= Clock dividor mux =====================
    ===========================================================================*/
    CLKDIV_MUX U0_CLKDIV_MUX (
    .IN(REG2_T[7:2]),
    .OUT(DIV_RATIO_RX)
    );


    
endmodule