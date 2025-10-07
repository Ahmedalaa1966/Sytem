# Sytem
 The system consists of a central control unit (SysCtrl) managing data flow between modules, with a UART transmitter for serial communication, a TX clock divider for baud rate generation, and a reset synchronizer for reliable initialization. Power efficiency is achieved using clock gating. A register file stores operands and results, while an ALU performs arithmetic and logic operations. Data synchronization modules ensure safe data transfer across clock domains.
 # Final Digital System – ALU, RegFile, and UART

## 📌 Overview
This project implements a digital system that performs **ALU and Register File operations** controlled via a **UART interface**.  
The design has two clock domains (REF_CLK and UART_CLK) and uses synchronizers (Reset Sync, Data Sync, Async FIFO) to ensure reliable operation.  

- **Clock Domain 1 (REF_CLK):** RegFile, ALU, Clock Gating, SysCtrl  
- **Clock Domain 2 (UART_CLK):** UART_TX, UART_RX, Pulse Generator, Clock Divider  

---

## ⚙️ Supported Operations  
- **ALU:** Add, Sub, Mul, Div, AND, OR, NAND, NOR, XOR, XNOR, Compare (A=B, A>B), Shifts  
- **Register File:** Read / Write  

---

## 🖥️ Supported Commands  
- Register File Write (3 frames)  
- Register File Read (2 frames)  
- ALU Operation with operands (4 frames)  
- ALU Operation without operands (2 frames)  

---

## 🔧 System Specs  
- REF_CLK = 50 MHz  
- UART_CLK = 3.6864 MHz  
- Clock Divider (default ratio = 32, always enabled)  
- Register File reserved addresses:  
  - 0x0 → Operand A  
  - 0x1 → Operand B  
  - 0x2 → UART Config (parity, prescale)  
  - 0x3 → Division ratio  
  - 0x4 – 0x15 → General use  

---

## 🔄 Operation Flow  
1. Configure system via RegFile (addresses 0x2, 0x3).  
2. Master sends commands through **UART_RX**.  
3. **SYS_CTRL** decodes commands and triggers ALU/RegFile.  
4. Results are sent back to master via **UART_TX**.  
<img width="1085" height="671" alt="image" src="https://github.com/user-attachments/assets/047195da-4012-47eb-9f7d-0646961a7630" />
