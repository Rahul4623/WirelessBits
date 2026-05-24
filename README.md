# WirelessBits


# What This Project Does
An 8-bit ASCII value is set using the DIP switches on the Boolean FPGA board. Pressing a button transmits that value as a UART serial frame. The output can be viewed in two ways simultaneously - on the laptop via Tera Term (wired USB) and on the phone via Serial Bluetooth Terminal (wireless Bluetooth).
Example: Set switches to 01000001 (decimal 65) -> press button -> A appears on Tera Term and on the phone.

# Hardware Used
HardwarePurpose
Digilent Boolean FPGA board-Runs the UART transmitter design, has onboard Bluetooth
USB cable -Connect Boolean board to laptop - for programming and UART output
Laptop with Vivado + Tera TermFlash bitstream, monitor UART output on PC.
Android/iOS phone-Receive UART output wirelessly via Bluetooth

No external modules or jumper wires needed - the Boolean board handles everything onboard.


How It Works
Laptop (Vivado)
      |
      | USB - flash bitstream
      |
   Boolean FPGA Board
      |
   sw[7:0]  <-- set 8-bit ASCII value on DIP switches
   btn1     <-- press to transmit one UART frame
      |
      |-------------------------------------|
      |                                     |
   USB (COM port)                   Onboard Bluetooth
      |                                     |
   Tera Term on laptop              Serial Bluetooth Terminal
   (wired - sees output             (wireless - phone scans,
    immediately)                     finds board, connects)

Step 1 - Generate and Flash the Bitstream

Open Vivado, create a new RTL project.
Add all source files:

top.v
transmitter.v
transmit_debouncing.v
Boolean_UART.xdc


Run Synthesis -> Implementation -> Generate Bitstream.
Connect the Boolean board to laptop via USB.
Click Open Hardware Manager -> Program Device to flash the bitstream onto the board.


Step 2 - View Output on Laptop via Tera Term

Open Tera Term on your laptop.
Go to File -> New Connection -> Serial.
Select the COM port that appears for the Boolean board (e.g. COM4, COM5).
Go to Setup -> Serial Port and set:

Baud rate: 9600
Data bits: 8
Parity: None
Stop bits: 1
Flow control: None


Click OK - Tera Term is now ready to display received characters.


Step 3 - View Output on Phone via Serial Bluetooth Terminal

Install Serial Bluetooth Terminal by Kai Morich (free - Play Store / App Store).
Open the app -> tap the menu -> Devices.
Select the Bluetooth LE tab.
Tap SCAN - the Boolean board appears as -unnamed-.
Tap it to connect.
Once connected, the terminal is live and ready to receive.


Step 4 - Send a Character
Set the DIP switches SW0-SW7 on the Boolean board to the binary value of your character.
Press the transmit button (btn1) on the board.
The character appears on Tera Term (laptop) and Serial Bluetooth Terminal (phone) at the same time.
Press again -> same character is sent again. Each button press = one UART frame.

Ascii Reference
<img width="937" height="889" alt="image" src="https://github.com/user-attachments/assets/1ad6b8ab-aa79-4cbc-a5fa-87aa29933bed" />
UART Configuration
Parameter  Value
Baud rate -9600bps
Data bits- 8
Parity - NoneStop 
bits  -  1
Clock -  100 MHz (Boolean board onboard oscillator)
Baud rate counter = 100,000,000 / 9600 - 1 = 10,415 cycles per bit

Project Files
FileDescription
top.v Top-level module - connects all sub-modules
transmitter.vUART FSM - loads 8-bit data, shifts out 10-bit frame at 9600 baud LSB first
transmit_debouncing.vButton debouncer - ensures one clean UART frame per button press
Boolean_UART.xdcVivado constraints - all pin assignments for Boolean board


Implemented Image
<img width="1861" height="1056" alt="image" src="https://github.com/user-attachments/assets/7fba7b54-a441-4b12-bf25-f4f6e6a08825" />

Author R Shahishnu Rahul
ECE @SRM UNIVERSITY 
