module deserializer  (
    input    wire                sampled_bit , 
    input    wire                deser_en    ,
    input    wire   [4:0]        edge_cnt    ,
    input    wire                clk         ,
    input    wire                rst         ,
    input    wire   [5:0]        prescale    ,
    input    wire                PAR_EN      ,
    output   reg    [7:0]        P_DATA       
);
   
   always @(posedge clk or negedge rst ) begin
        if(!rst)
            P_DATA <= 'b0 ;
        else if(deser_en) begin
            if(edge_cnt == prescale-1) begin
                P_DATA <= {sampled_bit , P_DATA[7:1]} ;
            end
        end
   end




endmodule