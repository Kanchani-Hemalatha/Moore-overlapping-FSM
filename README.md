# Moore FSM Overlapping Sequence Detector

## Overview
This Verilog module implements a **Moore finite state machine (FSM) with overlapping sequence detection**. The FSM detects a specific sequence of input bits (`din`) and outputs `dout = 1` upon detection. 

## Features
- **Moore FSM**: Output depends only on the current state.
- **Overlapping Sequence Detection**: Allows sequence reuse for efficiency.
- **Five-State Implementation**: Uses states `s0` to `s4`.
- **Clock Synchronous**: State transitions occur on the rising edge of `clk`.
- **Asynchronous Reset**: FSM resets to `s0` when `reset` is high.

## State Diagram
The FSM transitions through five states:

- `s0` (Idle state)
- `s1`, `s2`, `s3` (Intermediate states for pattern detection)
- `s4` (Final state where `dout = 1` is asserted)

## State Transition Table

| Current State | `din = 0` Next State | `din = 1` Next State | Output `dout` |
|--------------|--------------------|--------------------|------------|
| `s0`        | `s0`               | `s1`               | `0`        |
| `s1`        | `s2`               | `s1`               | `0`        |
| `s2`        | `s0`               | `s3`               | `0`        |
| `s3`        | `s4`               | `s1`               | `0`        |
| `s4`        | `s0`               | `s3`               | `1`        |

## Inputs & Outputs
### Inputs:
- `clk`: Clock signal for synchronous state transitions.
- `reset`: Asynchronous reset to initialize FSM.
- `din`: Serial input bit stream.

### Output:
- `dout`: Output signal, set to `1` when the target sequence is detected.
##  edapalyground link
https://www.edaplayground.com/x/8PjP

## simulation output
![image](https://github.com/user-attachments/assets/5a2f85e8-807b-47bc-882f-2aab4bb16474)

## waveform
![image](https://github.com/user-attachments/assets/808b6fe4-3477-46e6-ad41-c6fa97b512a1)
