module reset_sync #(parameter NUM_STAGES = 2 ) (
    input      wire        RST ,
    input      wire        CLK ,
    output     wire        SYNC_RST 
);
    localparam DEACTIVE_VALUE = 1 ;
    reg [NUM_STAGES-1:0] sync_reg ;

    always @(posedge CLK or negedge RST ) begin
        if(!RST) begin
            sync_reg <= {NUM_STAGES{1'b0}} ;
        end
        else begin 
            sync_reg[NUM_STAGES-1] <= DEACTIVE_VALUE;
            sync_reg[NUM_STAGES-2:0] <= {sync_reg[NUM_STAGES-1:1]};
        end
    end
    
    assign SYNC_RST = sync_reg[0] ;
endmodule