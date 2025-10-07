module serializer (
    input  wire [7:0]  P_DATA   ,             // parralel data input it is usually a byte
    input  wire        ser_en   ,             // the serial enable comes form the FSM blovk to enable the parralel to serial conversion
    input  wire        clk      ,             // the global clock for all the block
    input  wire        rst      ,             // asynchronous active low reset
    input  wire        busy     ,             // 
    input  wire        Data_Valid,            // 
    output wire        ser_data ,             // the serial data output
    output wire        ser_done               // serial done it is high after the last bit is out thst ensures that the serializer task is done

);

    reg  [7:0]          DATA_isolate ;
    reg  [3:0]          ser_count ;
              
//isolate input 
        always @ (posedge clk or negedge rst) begin
            if(!rst)
                DATA_isolate <= 'b0 ;
            else if(Data_Valid && !busy)
                DATA_isolate <= P_DATA ;
            else if(ser_en)
                DATA_isolate <= DATA_isolate >> 1 ;         // shift register
        end
 

//counter
always @ (posedge clk or negedge rst) begin
    if(!rst)begin
        ser_count <= 'b0 ;
    end
    else
    begin
        if (ser_en)
            ser_count <= ser_count + 'b1 ;		 
        else 
            ser_count <= 'b0 ;		 	
    end
 end 

assign ser_done = (ser_count == 'b0111) ? 1'b1 : 1'b0 ;
assign ser_data = DATA_isolate[0] ;
    
endmodule

