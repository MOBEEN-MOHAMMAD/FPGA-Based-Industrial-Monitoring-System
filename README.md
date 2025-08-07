# FPGA-Based-Industrial-Monitoring-System
Verilog-based Industrial Hazard Monitoring System using Artix-7 FPGA
# Industrial Monitoring System Using Artix-7 FPGA

This project is a Verilog-based industrial monitoring system that integrates fire, gas, and infrared (IR) sensors with motor control and a real-time display system using a 4-digit 7-segment display. The system is implemented on an Artix-7 FPGA development board (e.g., Digilent Basys 3).

## 🚀 Project Overview

The goal of this project is to monitor critical industrial safety parameters and take appropriate actions using an FPGA:

- 🔥 Detects fire using a flame sensor
- 🛢️ Detects gas leaks using a gas sensor
- 👤 Counts people using an IR sensor
- 🚨 Activates buzzer and LEDs on hazardous conditions
- 🔁 Controls motor operation (e.g., exhaust fan)
- 🧮 Displays count of detected IR pulses (people) on a 4-digit 7-segment display

## 🔧 Hardware Requirements

- **FPGA Board**: Artix-7 (Basys 3 or equivalent)
- **Sensors**:
  - Gas Sensor (e.g., MQ-series)
  - Flame/Fire Sensor
  - IR Sensor
- **Actuators**:
  - Buzzer
  - LEDs
  - DC Motor (via motor driver)
- **Display**:
  - 4-digit 7-segment display (common cathode)

## 🗂️ Project Structure

| File                      | Description                                         |
|---------------------------|-----------------------------------------------------|
| `monitoring.v`            | Top-level module connecting all submodules         |
| `final.v`                 | Core logic: sensor monitoring, counter, buzzer     |
| `motor.v`                 | Motor control based on fire sensor                 |
| `seg_encoder.v`           | Encodes BCD digits into 7-segment display signals  |
| `seg_display_mux_4digit.v`| Time-multiplexing for 4-digit 7-segment display    |
| `README.md`               | Project documentation                              |

## 🔁 System Behavior

| Condition            | Action                                |
|----------------------|----------------------------------------|
| Gas Detected         | LED1 ON                                |
| Fire Detected        | Motor stops, LED2 ON, Buzzer ON        |
| Person Detected (IR) | Counter increments                     |
| Reset Buttons        | Reset counter or LED status manually   |

## 🖥️ Simulation / Testing

Simulation can be done using tools like:
- ModelSim
- Vivado Simulation

**Note**: Buzzer and motor logic can be observed through waveform or LEDs during testbench simulation.

## 📌 Future Enhancements

- Add UART interface to send data to a PC
- Integrate real-time clock (RTC)
- Add LCD or OLED for advanced monitoring

## 📃 License

This project is open-source and available under the [MIT License](LICENSE) (or specify your own license if needed).

---

**Developed by**: [Your Name or Team]  
**Date**: August 2025  
