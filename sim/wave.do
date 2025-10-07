vsim -voptargs=+acc work.SYS_TOP_tb
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB /SYS_TOP_tb/RST_N
add wave -noupdate -expand -group TB /SYS_TOP_tb/REF_CLK
add wave -noupdate -expand -group TB /SYS_TOP_tb/UART_CLK
add wave -noupdate -expand -group TB /SYS_TOP_tb/UART_RX_IN
add wave -noupdate -expand -group TB /SYS_TOP_tb/UART_TX_O
add wave -noupdate -expand -group TB /SYS_TOP_tb/parity_error
add wave -noupdate -expand -group TB /SYS_TOP_tb/framing_error
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/CLK
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/RST
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/RdData_Valid
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/ALU_OUT
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/OUT_Valid
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/RdData
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/RX_P_DATA
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/RX_D_VLD
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/FIFO_FULL
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/TX_P_DATA
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/TX_D_VLD
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/clk_div_en
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/ALU_FUN
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/ALU_EN
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/CLK_EN
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/Adrress
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/WrEn
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/RdEn
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/WrData
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/cs
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/ns
add wave -noupdate -group {System control} /SYS_TOP_tb/dut/system_control/Address_comb
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/CLK
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/RST
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/WrEn
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/RdEn
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/Address
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/WrData
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/RdData
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/RdData_VLD
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/REG0
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/regArr
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/REG1
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/REG2
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/REG3
add wave -noupdate -expand -group regfile /SYS_TOP_tb/dut/RegFile_inst/I
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/A
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/B
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/EN
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/ALU_FUN
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/CLK
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/RST
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/ALU_OUT
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/OUT_VALID
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/ALU_OUT_Comb
add wave -noupdate -group ALU /SYS_TOP_tb/dut/ALU_inst/OUT_VALID_Comb
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/W_CLK
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/W_RST
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/w_INC
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/R_CLK
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/R_RST
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/R_INC
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/WR_DATA
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/FULL
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/EMPTY
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/RD_DATA
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/waddr
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/raddr
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/wq2_rptr
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/rq2_wptr
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/wptr_g
add wave -noupdate -group FIFO /SYS_TOP_tb/dut/ASYNC_FIFO_inst/rptr_g
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/RST
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/TX_CLK
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/RX_CLK
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/RX_IN_S
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/RX_OUT_P
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/RX_OUT_V
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/TX_IN_P
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/TX_IN_V
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/TX_OUT_S
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/TX_OUT_V
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/Prescale
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/parity_enable
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/parity_type
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/parity_error
add wave -noupdate -group UART /SYS_TOP_tb/dut/UART_inst/framing_error
add wave -noupdate -group reset_sync2 /SYS_TOP_tb/dut/reset_sync_inst1/RST
add wave -noupdate -group reset_sync2 /SYS_TOP_tb/dut/reset_sync_inst1/CLK
add wave -noupdate -group reset_sync2 /SYS_TOP_tb/dut/reset_sync_inst1/SYNC_RST
add wave -noupdate -group reset_sync2 /SYS_TOP_tb/dut/reset_sync_inst1/sync_reg
add wave -noupdate -group reset_sync /SYS_TOP_tb/dut/reset_sync_inst2/RST
add wave -noupdate -group reset_sync /SYS_TOP_tb/dut/reset_sync_inst2/CLK
add wave -noupdate -group reset_sync /SYS_TOP_tb/dut/reset_sync_inst2/SYNC_RST
add wave -noupdate -group reset_sync /SYS_TOP_tb/dut/reset_sync_inst2/sync_reg
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/CLK
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/RST
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/unsync_bus
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/bus_enable
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/sync_bus
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/enable_pulse_d
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/sync_reg
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/enable_flop
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/enable_pulse
add wave -noupdate -group datasync /SYS_TOP_tb/dut/DATA_SYNC_inst/sync_bus_c
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {38299332 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {78892800 ps}
add wave -position insertpoint sim:/SYS_TOP_tb/dut/U0_CLKDIV_MUX/*
