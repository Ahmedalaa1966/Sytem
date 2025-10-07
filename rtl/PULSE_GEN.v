module PULSE_GEN (
    //=================== inputs =======================
    input      wire        RST ,                                // ACTIVE LOW async reet 
    input      wire        CLK ,                                // clock for all the module
    input      wire        LVL_SIG ,                            // level signal fromthe uart tx

    // ============= outputs ==========================
    output     wire        PULSE_SIG                            // pulse signal to the fifo
);

    reg DFF1 ,DFF2 ;


    always @(posedge CLK or negedge RST) begin
        if(!RST) begin
           DFF1 <= 'b0 ;
           DFF2 <= 'b0 ;
        end
        else begin
            DFF1 <= LVL_SIG ;
            DFF2 <= DFF1 ;
        end
    end

    assign PULSE_SIG = DFF1 && !DFF2 ;

    

    
endmodule