module RX_test ();


    // DUT signals
    reg        RX_IN;
    reg  [5:0] prescale;
    reg        PAR_EN;
    reg        PAR_TYP;
    reg        CLK;
    reg        RST;
    wire [7:0] P_DATA;
    wire       parity_error;
    wire       stop_error;
    wire       data_valid;

    // Instantiate DUT
  UART_RX_TOP DUT (
    .RX_IN        (RX_IN),
    .prescale     (prescale),
    .PAR_EN       (PAR_EN),
    .PAR_TYP      (PAR_TYP),
    .clk          (CLK),
    .rst          (RST),
    .P_DATA       (P_DATA),
    .parity_error (parity_error) ,
    .stop_error   (stop_error)   ,
    .data_valid   (data_valid)
  );

    initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  end

  initial begin
    
    RX_IN    = 1;      // idle
    prescale = 8;      // oversampling
    PAR_EN   = 1;      // enable parity
    PAR_TYP  = 0;      // even parity
    RST      = 0;

    #20 RST = 1;       // release reset
    #20;

    /////////////////////////////// PRESCALE = 8 ///////////////////////////////////


    @(posedge CLK) ;

    
    // Data = 0xA5 = 1010_0101 
    RX_IN = 0; #(80);
    RX_IN = 1; #(80);  // bit0
    RX_IN = 0; #(80);  // bit1
    RX_IN = 1; #(80);  // bit2
    RX_IN = 0; #(80);  // bit3
    RX_IN = 0; #(80);  // bit4
    RX_IN = 1; #(80);  // bit5
    RX_IN = 0; #(80);  // bit6
    RX_IN = 1; #(80);  // bit7
    RX_IN = 0; #(80);  //parity
    RX_IN = 1; #(80);  //stop    
    check_output(8'hA5) ;

    #80    //delay


    // Data = 0x3C (0011_1100)
    RX_IN = 0; #(80);  //start bit
    RX_IN = 0; #(80);  // bit0
    RX_IN = 0; #(80);  // bit1
    RX_IN = 1; #(80);  // bit2
    RX_IN = 1; #(80);  // bit3
    RX_IN = 1; #(80);  // bit4
    RX_IN = 1; #(80);  // bit5
    RX_IN = 0; #(80);  // bit6
    RX_IN = 0; #(80);  // bit7
    RX_IN = 0; #(80);  // parity (even)    
    RX_IN = 1; #(80);  // stop
    check_output(8'h3C) ;

    //  Data = 0x55
    RX_IN = 0; #(80);  //start bit
    RX_IN = 1; #(80);  
    RX_IN = 0; #(80);
    RX_IN = 1; #(80);
    RX_IN = 0; #(80);
    RX_IN = 1; #(80);
    RX_IN = 0; #(80);
    RX_IN = 1; #(80);
    RX_IN = 0; #(80);
    RX_IN = 0; #(80);  // parity
    RX_IN = 1; #(80);  // stop
    check_output(8'h55) ;

    // Data = 0x96 = 1001_0110
    RX_IN = 0; #(80);   // start
    RX_IN = 0; #(80);   // bit0
    RX_IN = 1; #(80);   // bit1
    RX_IN = 1; #(80);   // bit2
    RX_IN = 0; #(80);   // bit3
    RX_IN = 1; #(80);   // bit4
    RX_IN = 0; #(80);   // bit5
    RX_IN = 0; #(80);   // bit6
    RX_IN = 1; #(80);   // bit7
    RX_IN = 1; #(80);   // parity
    RX_IN = 0; #(80);   // stop            // error in the stop bit
    check_output(8'h96);


    // Data = 0x7E = 0111_1110
    RX_IN = 0; #(80);   // start
    RX_IN = 0; #(80);   // bit0
    RX_IN = 1; #(80);   // bit1
    RX_IN = 1; #(80);   // bit2
    RX_IN = 1; #(80);   // bit3
    RX_IN = 1; #(80);   // bit4
    RX_IN = 1; #(80);   // bit5
    RX_IN = 1; #(80);   // bit6
    RX_IN = 0; #(80);   // bit7
    RX_IN = 1; #(80);   // parity      //error in the parity bit 
    RX_IN = 1; #(80);   // stop
    check_output(8'h7E);



    // Data = 0x01 = 0000_0001
    RX_IN = 0; #(80);  //start bit
    RX_IN = 1; #(80);  
    RX_IN = 0; #(80);  
    RX_IN = 0; #(80);  
    RX_IN = 0; #(80);  
    RX_IN = 0; #(80);  
    RX_IN = 0; #(80);  
    RX_IN = 0; #(80);  
    RX_IN = 0; #(80);  
    RX_IN = 1; #(80);  // parity   
    RX_IN = 1; #(80);  // stop
    check_output(8'h01) ;

    PAR_EN   = 0;      // disable the parity  
    #80                // delay

    // Test Data = 0xF0 = 1111_0000 
    RX_IN = 0; #(80);  //start bit
    RX_IN = 0; #(80);  // bit0
    RX_IN = 0; #(80);  // bit1
    RX_IN = 0; #(80);  // bit2
    RX_IN = 0; #(80);  // bit3
    RX_IN = 1; #(80);  // bit4
    RX_IN = 1; #(80);  // bit5
    RX_IN = 1; #(80);  // bit6
    RX_IN = 1; #(80);  // bit7
    RX_IN = 1; #(80);  // stop
    check_output(8'hF0) ;


    

    /////////////////////////////// PRESCALE = 16 ///////////////////////////////////

    RX_IN    = 1;      // idle
    prescale = 16;     // oversampling
    PAR_EN   = 1;      // enable parity
    PAR_TYP  = 0;      // even parity
    RST      = 0;

    #20 RST = 1;       // release reset
    #20;

    
    // Test 1: Data = 0xA5 = 1010_0101 (LSB first)
    @(posedge CLK);
    RX_IN = 0; #(160);  // start bit
    RX_IN = 1; #(160);  // bit0
    RX_IN = 0; #(160);  // bit1
    RX_IN = 1; #(160);  // bit2
    RX_IN = 0; #(160);  // bit3
    RX_IN = 0; #(160);  // bit4
    RX_IN = 1; #(160);  // bit5
    RX_IN = 0; #(160);  // bit6
    RX_IN = 1; #(160);  // bit7
    RX_IN = 0; #(160);  // parity bit (even parity for 0xA5 = 0)
    RX_IN = 1; #(160);  // stop bit
    check_output(8'hA5) ;


    // Test 2: Data = 0x3C = 0011_1100 (LSB first)
    RX_IN = 0; #(160);  // start bit
    RX_IN = 0; #(160);  // bit0
    RX_IN = 0; #(160);  // bit1
    RX_IN = 1; #(160);  // bit2
    RX_IN = 1; #(160);  // bit3
    RX_IN = 1; #(160);  // bit4
    RX_IN = 1; #(160);  // bit5
    RX_IN = 0; #(160);  // bit6
    RX_IN = 0; #(160);  // bit7
    RX_IN = 0; #(160);  // parity bit (even parity for 0x3C = 0)
    RX_IN = 1; #(160);  // stop bit
    check_output(8'h3C) ;
    #160

    // Data = 0x5A = 0101_1010 (LSB first)
    RX_IN = 0; #(160);  // start bit
    RX_IN = 0; #(160);  // bit0
    RX_IN = 1; #(160);  // bit1
    RX_IN = 0; #(160);  // bit2
    RX_IN = 1; #(160);  // bit3
    RX_IN = 1; #(160);  // bit4
    RX_IN = 0; #(160);  // bit5
    RX_IN = 1; #(160);  // bit6
    RX_IN = 0; #(160);  // bit7
    RX_IN = 0; #(160);  // parity (even)
    RX_IN = 1; #(160);  // stop
    check_output(8'h5A);

    // Test 4: Data = 0x81 = 1000_0001 (LSB first)
    RX_IN = 0; #(160);  // start bit
    RX_IN = 1; #(160);  // bit0
    RX_IN = 0; #(160);  // bit1
    RX_IN = 0; #(160);  // bit2
    RX_IN = 0; #(160);  // bit3
    RX_IN = 0; #(160);  // bit4
    RX_IN = 0; #(160);  // bit5
    RX_IN = 0; #(160);  // bit6
    RX_IN = 1; #(160);  // bit7
    RX_IN = 0; #(160);  // parity (even requires 0)
    RX_IN = 1; #(160);  // stop
    check_output(8'h81) ;

   //no delay 

    // Test 5: Data = 0x7F = 0111_1111 (LSB first)
    RX_IN = 0; #(160);  // start bit
    RX_IN = 1; #(160);  // bit0
    RX_IN = 1; #(160);  // bit1
    RX_IN = 1; #(160);  // bit2
    RX_IN = 1; #(160);  // bit3
    RX_IN = 1; #(160);  // bit4
    RX_IN = 1; #(160);  // bit5
    RX_IN = 1; #(160);  // bit6
    RX_IN = 0; #(160);  // bit7
    RX_IN = 1; #(160);  // parity (even requires 1)
    RX_IN = 1; #(160);  // stop
    check_output(8'h7F) ;


    /////////////////////////////// PRESCALE = 32 ///////////////////////////////////

    RX_IN    = 1;      // idle
    prescale = 32;     // oversampling
    PAR_EN   = 1;      // enable parity
    PAR_TYP  = 0;      // even parity
    RST      = 0;

    #20 RST = 1;       // release reset
    #20;


    // Test 1: Data = 0x55 = 0101_0101 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 1; #(320);  // bit0
    RX_IN = 0; #(320);  // bit1
    RX_IN = 1; #(320);  // bit2
    RX_IN = 0; #(320);  // bit3
    RX_IN = 1; #(320);  // bit4
    RX_IN = 0; #(320);  // bit5
    RX_IN = 1; #(320);  // bit6
    RX_IN = 0; #(320);  // bit7
    RX_IN = 0; #(320);  // parity (even → 0)
    RX_IN = 1; #(320);  // stop
    check_output(8'h55) ;

    #320;
    // Data = 0xAA = 1010_1010 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 0; #(320);  // bit0
    RX_IN = 1; #(320);  // bit1
    RX_IN = 0; #(320);  // bit2
    RX_IN = 1; #(320);  // bit3
    RX_IN = 0; #(320);  // bit4
    RX_IN = 1; #(320);  // bit5
    RX_IN = 0; #(320);  // bit6
    RX_IN = 1; #(320);  // bit7
    RX_IN = 0; #(320);  // parity (even → 0)
    RX_IN = 0; #(320);  // stop                   //error in the stop bit 
    check_output(8'hAA);


    // Test 2: Data = 0x0F = 0000_1111 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 1; #(320);  // bit0
    RX_IN = 1; #(320);  // bit1
    RX_IN = 1; #(320);  // bit2
    RX_IN = 1; #(320);  // bit3
    RX_IN = 0; #(320);  // bit4
    RX_IN = 0; #(320);  // bit5
    RX_IN = 0; #(320);  // bit6
    RX_IN = 0; #(320);  // bit7
    RX_IN = 1; #(320);  // parity (even → 0)             //error in the parity bit
    RX_IN = 1; #(320);  // stop
    check_output(8'h0F) ;
    //no delay

    // Data = 0x0F = 0000_1111 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 1; #(320);  // bit0
    RX_IN = 1; #(320);  // bit1
    RX_IN = 1; #(320);  // bit2
    RX_IN = 1; #(320);  // bit3
    RX_IN = 0; #(320);  // bit4
    RX_IN = 0; #(320);  // bit5
    RX_IN = 0; #(320);  // bit6
    RX_IN = 0; #(320);  // bit7
    RX_IN = 0; #(320);  // parity (even → 0)
    RX_IN = 1; #(320);  // stop
    check_output(8'h0F);

    // Data = 0x7E = 0111_1110 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 0; #(320);  // bit0
    RX_IN = 1; #(320);  // bit1
    RX_IN = 1; #(320);  // bit2
    RX_IN = 1; #(320);  // bit3
    RX_IN = 1; #(320);  // bit4
    RX_IN = 1; #(320);  // bit5
    RX_IN = 1; #(320);  // bit6
    RX_IN = 0; #(320);  // bit7
    RX_IN = 0; #(320);  // parity (even → 0)    
    RX_IN = 1; #(320);  // stop
    check_output(8'h7E);
    #320
    
     // Data = 0x99 = 1001_1001 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 1; #(320);  // bit0
    RX_IN = 0; #(320);  // bit1
    RX_IN = 0; #(320);  // bit2
    RX_IN = 1; #(320);  // bit3
    RX_IN = 1; #(320);  // bit4
    RX_IN = 0; #(320);  // bit5
    RX_IN = 0; #(320);  // bit6
    RX_IN = 1; #(320);  // bit7
    RX_IN = 0; #(320);  // parity (even → 0)
    RX_IN = 1; #(320);  // stop
    check_output(8'h99);

    // Test 3: Data = 0xC3 = 1100_0011 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 1; #(320);  // bit0
    RX_IN = 1; #(320);  // bit1
    RX_IN = 0; #(320);  // bit2
    RX_IN = 0; #(320);  // bit3
    RX_IN = 0; #(320);  // bit4
    RX_IN = 0; #(320);  // bit5
    RX_IN = 1; #(320);  // bit6
    RX_IN = 1; #(320);  // bit7
    RX_IN = 0; #(320);  // parity (even → 0)
    RX_IN = 1; #(320);  // stop             
    check_output(8'hC3) ;

    //no delay

    // Test 4: Data = 0x19 = 0001_1001 (LSB first)
    RX_IN = 0; #(320);  // start
    RX_IN = 1; #(320);  // bit0
    RX_IN = 0; #(320);  // bit1
    RX_IN = 0; #(320);  // bit2
    RX_IN = 1; #(320);  // bit3
    RX_IN = 1; #(320);  // bit4
    RX_IN = 0; #(320);  // bit5
    RX_IN = 0; #(320);  // bit6
    RX_IN = 0; #(320);  // bit7
    RX_IN = 1; #(320);  // parity (even → 1)
    RX_IN = 1; #(320);  // stop            
    check_output(8'h19) ;
  
    #200;
    $stop;
  end




  /////////////////// TASKS ///////////////////

  task check_output;
    input  [7:0] expected_data;
    begin
        if (P_DATA === expected_data) begin
            $display("TEST PASSED: Data = %h",
                      P_DATA);
        end else begin
            $display("TEST FAILED: Data = %h (Expected %h)",
                      P_DATA, expected_data);
        end
    end
endtask

endmodule