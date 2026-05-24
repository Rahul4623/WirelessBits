# WirelessBits
## What This Project Does

Basys3-UART-Bluetooth-Transmitter
What This Project Does
An 8-bit ASCII value is set using the DIP switches on the Basys3 FPGA board. Pressing a button transmits that value as a UART serial frame. The output can be viewed in two ways simultaneously - on the laptop via Tera Term (wired USB) and on the phone via Serial Bluetooth Terminal (wireless Bluetooth).
Example: Set switches to 01000001 (decimal 65) -> press button -> A appears on Tera Term and on the phone.

Hardware Used
HardwarePurposeDigilent Basys3 FPGA boardRuns the UART transmitter design, has onboard BluetoothUSB cableConnect Basys3 to laptop - for programming and UART outputLaptop with Vivado + Tera TermFlash bitstream, monitor UART output on PCAndroid/iOS phoneReceive UART output wirelessly via Bluetooth

No external modules or jumper wires needed - the Basys3 board handles everything onboard.


How It Works
Laptop (Vivado)
      |
      | USB - flash bitstream
      |
   Basys3 Board
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
Basys3_UART.xdc


Run Synthesis -> Implementation -> Generate Bitstream.
Connect Basys3 to laptop via USB.
Click Open Hardware Manager -> Program Device to flash the bitstream onto the board.


Step 2 - View Output on Laptop via Tera Term

Open Tera Term on your laptop.
Go to File -> New Connection -> Serial.
Select the COM port that appears for the Basys3 (e.g. COM4, COM5).
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
Tap SCAN - the Basys3 board appears as -unnamed-.
Tap it to connect.
Once connected, the terminal is live and ready to receive.


Step 4 - Send a Character

Set the DIP switches SW0-SW7 on the Basys3 to the binary value of your character.
Press BTNU (btn1) - the up button on the board.
The character appears on Tera Term (laptop) and Serial Bluetooth Terminal (phone) at the same time.
Press again -> same character is sent again. Each button press = one UART frame.

Basys3-UART-Bluetooth-Transmitter
What This Project Does
An 8-bit ASCII value is set using the DIP switches on the Basys3 FPGA board. Pressing a button transmits that value as a UART serial frame. The output can be viewed in two ways simultaneously - on the laptop via Tera Term (wired USB) and on the phone via Serial Bluetooth Terminal (wireless Bluetooth).
Example: Set switches to 01000001 (decimal 65) -> press button -> A appears on Tera Term and on the phone.

Hardware Used
HardwarePurposeDigilent Basys3 FPGA boardRuns the UART transmitter design, has onboard BluetoothUSB cableConnect Basys3 to laptop - for programming and UART outputLaptop with Vivado + Tera TermFlash bitstream, monitor UART output on PCAndroid/iOS phoneReceive UART output wirelessly via Bluetooth

No external modules or jumper wires needed - the Basys3 board handles everything onboard.


How It Works
Laptop (Vivado)
      |
      | USB - flash bitstream
      |
   Basys3 Board
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
Basys3_UART.xdc


Run Synthesis -> Implementation -> Generate Bitstream.
Connect Basys3 to laptop via USB.
Click Open Hardware Manager -> Program Device to flash the bitstream onto the board.


Step 2 - View Output on Laptop via Tera Term

Open Tera Term on your laptop.
Go to File -> New Connection -> Serial.
Select the COM port that appears for the Basys3 (e.g. COM4, COM5).
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
Tap SCAN - the Basys3 board appears as -unnamed-.
Tap it to connect.
Once connected, the terminal is live and ready to receive.


Step 4 - Send a Character

Set the DIP switches SW0-SW7 on the Basys3 to the binary value of your character.
Press BTNU (btn1) - the up button on the board.
The character appears on Tera Term (laptop) and Serial Bluetooth Terminal (phone) at the same time.
Press again -> same character is sent again. Each button press = one UART frame.

Reset
Press BTNC (btn0) - center button - at any time to reset the transmitter back to idle.

UART Configuration
ParameterValueBaud rate9600 bpsData bits8ParityNoneStop bits1Clock100 MHz (Basys3 onboard oscillator)
Baud rate counter = 100,000,000 / 9600 - 1 = 10,415 cycles per bit

Project Files
FileDescription-top.vTop-level module - connects all sub-modulestransmitter.vUART FSM - loads 8-bit data, shifts out 10-bit frame at 9600 baud LSB first
transmit_debouncing.vButton debouncer - ensures one clean UART frame per button press
Basys3_UART.xdcVivado constraints - all pin assignments for Basys3

Reset
Press BTNC (btn0) - center button - at any time to reset the transmitter back to idle.

UART Configuration
ParameterValueBaud rate9600 bpsData bits8ParityNoneStop bits1Clock100 MHz (Basys3 onboard oscillator)
Baud rate counter = 100,000,000 / 9600 - 1 = 10,415 cycles per bit

Project Files
FileDescriptiontop.vTop-level module - connects all sub-modulestransmitter.vUART FSM - loads 8-bit data, shifts out 10-bit frame at 9600 baud LSB firsttransmit_debouncing.vButton debouncer - ensures one clean UART frame per button pressBasys3_UART.xdcVivado constraints - all pin assignments for Basys3

Implemented Image
<img width="1861" height="1056" alt="image" src="https://github.com/user-attachments/assets/7fba7b54-a441-4b12-bf25-f4f6e6a08825" />

Author R Shahishnu Rahul
ECE @SRM UNIVERSITY 
