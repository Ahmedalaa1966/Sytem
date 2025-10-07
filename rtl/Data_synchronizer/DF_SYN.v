module DF_SYN #(parameter P_SIZE = 4)(
    input  wire [P_SIZE-1:0] in     ,
    input  wire       Dclk   ,
    input  wire       Drst_n ,
    output wire [P_SIZE-1:0] out  

);

    reg [P_SIZE-1:0] DFF1 , DFF2 ;

    always @(posedge Dclk or negedge Drst_n) begin
        if(!Drst_n) begin
            DFF1 <= 'b0 ;
            DFF2 <= 'b0 ;
        end
        else begin
            DFF1 <= in   ;
            DFF2 <= DFF1 ;
        end
    end


    assign out = DFF2 ;

endmodule






