`timescale 1ns/1ps

module SYS_TOP_tb;

  // Signals
  reg  RST_N;
  reg  REF_CLK;
  reg  UART_CLK;
  reg  UART_RX_IN;
  wire UART_TX_O;
  wire parity_error, framing_error;

  // Instantiate DUT
  SYS_TOP dut (
    .RST_N(RST_N),
    .UART_CLK(UART_CLK),
    .REF_CLK(REF_CLK),
    .UART_RX_IN(UART_RX_IN),
    .UART_TX_O(UART_TX_O),
    .parity_error(parity_error),
    .framing_error(framing_error)
  );

  // Clock Generation
  always #10 REF_CLK = ~REF_CLK;      // 50 MHz
  always #136 UART_CLK = ~UART_CLK;   // 3.6864 MHz

  // Reset
  initial begin
    RST_N = 0;
    REF_CLK = 0;
    UART_CLK = 0;
    UART_RX_IN = 1;   // idle high
    #200;
    RST_N = 1;
  end

  // UART send task (1 start + 8 data + 1 parity + 1 stop)
// Parity = even parity
task send_uart_byte(input [7:0] data);
  integer i;
  reg parity_bit;
  begin
    // Start bit
    UART_RX_IN = 0;
    repeat(32)@(posedge dut.UART_inst.RX_CLK);

    // Data bits (LSB first)
    parity_bit = 0;
    for (i=0; i<8; i=i+1) begin
      UART_RX_IN = data[i];
      parity_bit = parity_bit ^ data[i]; // accumulate parity (XOR of all bits)
      repeat(32)@(posedge dut.UART_inst.RX_CLK);
    end

    // Even parity bit (so total number of 1's is even)
    UART_RX_IN = parity_bit;
    repeat(32)@(posedge dut.UART_inst.RX_CLK);

    // Stop bit
    UART_RX_IN = 1; 

    repeat(64)@(posedge dut.UART_inst.RX_CLK); // idle
  end
endtask


    //===============================
    // Main Test Sequence
    //===============================
    initial begin
    @(posedge RST_N);
    #1000;


    // -------------------------------------------------
    // 1) Register File Write command (0xAA, Addr=0x04, Data=0x55)
    // -------------------------------------------------
    $display("TESTCASE 1: Register File Write");
    send_uart_byte(8'hAA);  // RF_Wr_CMD
    send_uart_byte(8'h04);  // Addr
    send_uart_byte(8'h55);  // Data
    #5000;

    // -------------------------------------------------
    // 2) Register File Read command (0xBB, Addr=0x04)
    // -------------------------------------------------
    $display("TESTCASE 2: Register File Read");
    send_uart_byte(8'hBB);  // RF_Rd_CMD
    send_uart_byte(8'h04);  // Addr
    #5000;

    // -------------------------------------------------
    // 3) ALU Operation with operands (0xCC, A=0x0A, B=0x05, FUN=ADD)
    // -------------------------------------------------
    $display("TESTCASE 3: ALU Operation with operands (ADD)");
    send_uart_byte(8'hCC);  // ALU_OPER_W_OP_CMD
    send_uart_byte(8'h0A);  // Operand A
    send_uart_byte(8'h05);  // Operand B
    send_uart_byte(8'h00);  // ALU_FUN = ADD
    repeat(100)@(posedge UART_CLK) ;
    // -------------------------------------------------
    // 4) ALU Operation with no operand (0xDD, FUN=NOT)
    // -------------------------------------------------
    $display("TESTCASE 4: ALU Operation with no operands (NOT)");
    send_uart_byte(8'hDD);  // ALU_OPER_W_NOP_CMD
    send_uart_byte(8'h02);  // ALU_FUN = NOT
    #5000;

    $display("All testcases executed");
    $stop;
  end

endmodule
