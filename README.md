# Moore-overlapping-FSM
The Moore FSM Overlapping Detector is a finite state machine that recognizes a specific sequence pattern in an input stream while allowing overlapping occurrences. 
# 📦 Moore Overlapping FSM 📦

## 📝 Overview
📌 This repository contains the Verilog implementation of a **Moore Finite State Machine (FSM) with Overlapping Sequence Detection**. The FSM is designed to recognize an overlapping sequence using the Moore machine model, where the output depends only on the current state.

## 📌 Module: `moore_fsm_overlapping`
### 🏗️ Functionality
🟢 The FSM detects a specific sequence pattern with overlapping capability.
📌 It consists of five states (`s0` to `s4`), transitioning based on the input signal (`din`).
🔴 The output (`dout`) is asserted when the FSM reaches `s4`.

### 🔄 State Diagram
📍 The FSM transitions through different states based on the input signal (`din`):
```
┌───────┐     1      ┌───────┐     1      ┌───────┐
│   S0  │ ─────────▶ │   S1  │ ─────────▶ │   S1  │
└───────┘            └───────┘            └───────┘
   │ 0                 │ 0                    │ 0
   ▼                   ▼                      ▼
┌───────┐     1      ┌───────┐     1      ┌───────┐
│   S2  │ ─────────▶ │   S3  │ ─────────▶ │   S1  │
└───────┘            └───────┘            └───────┘
   │ 0                 │ 0                    │ 0
   ▼                   ▼                      ▼
┌───────┐     1      ┌───────┐
│   S4  │ ◀──────── │   S3  │
└───────┘            └───────┘
   │ 0
   ▼
┌───────┐
│   S0  │
└───────┘
```

## 💻 Verilog Code
🔧 The Verilog implementation consists of:
- **State transition logic** (based on `din` input)
- **State memory** (register to hold the current state)
- **Output logic** (dependent only on the current state)

```verilog
module moore_fsm_overlapping(input clk, input reset, input din, output reg dout);
     parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
     
     reg [2:0] current_state, next_state;
  
  always @(posedge clk or posedge reset) begin
    if (reset)
      current_state <= s0;
    else
      current_state <= next_state;
  end

  always @(*) begin
    case (current_state)
      s0: next_state = (din) ? s1 : s0;
      s1: next_state = (din) ? s1 : s2;
      s2: next_state = (din) ? s3 : s0;
      s3: next_state = (din) ? s1 : s4;
      s4: next_state = (din) ? s3 : s0;
      default: next_state = s0;
    endcase
  end

  always @(current_state) begin
    case (current_state)
      s0, s1, s2, s3: dout = 0;
      s4: dout = 1;
      default: dout = 0;
    endcase
  end
endmodule
```

## 🚀 Usage
1. 📥 Clone the repository:
   ```sh
   git clone https://github.com/yourusername/moore_fsm_overlapping.git
   ```
2. 🛠️ Use any Verilog simulator (e.g., ModelSim, Xilinx Vivado, or Icarus Verilog) to simulate the FSM behavior.
3. ✅ Compile and run the testbench to verify the sequence detection.

##  edapalyground link
https://www.edaplayground.com/x/8PjP

## simulation output
![image](https://github.com/user-attachments/assets/5a2f85e8-807b-47bc-882f-2aab4bb16474)

## waveform
![image](https://github.com/user-attachments/assets/0e44a920-e66b-4de2-8d78-861b47f55093)

