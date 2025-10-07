module parity_calc (
    input  wire       Data_valid    ,
    input  wire [7:0] P_DATA        ,
    input  wire       PAR_TYP       ,
    input  wire       PAR_EN        ,
    input  wire       busy          ,
    input  wire       clk           ,
    input  wire       rst           ,
    output wire       par_bit    
);

    reg       enable_flag , parity ;
    reg [7:0] P_DATA_ISO ;                  // register ti isolate the input P_DATA 


    // input isolate 
    always @(posedge clk or negedge rst ) begin
        if(!rst)
            P_DATA_ISO <= 'b0 ;
        else if(Data_valid && !busy)
            P_DATA_ISO <= P_DATA ;
    end

    always @ (posedge clk or negedge rst) begin
        if(!rst)
        begin
            parity <= 'b0 ;
        end
        else begin
            if (PAR_EN)
            begin
            case(PAR_TYP)
            1'b0 : begin                 
                    parity <= ^P_DATA_ISO  ;     // Even Parity
                    end
            1'b1 : begin
                    parity <= ~^P_DATA_ISO ;     // Odd Parity
                end		
            endcase       	 
            end
        end
    end 
    assign par_bit = parity ;
endmodule