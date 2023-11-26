--- --- --- Room Occupancy Monitoring System --- --- ---

--- ---Overview --- ---

This VHDL project implements a digital system to monitor the occupancy of a room using 
a dual photocell setup at the entrance and exit points. 
It tracks the number of individuals in a room and compares this count against a predefined maximum threshold. 
When the occupancy exceeds this threshold, the system activates an indicator signal.


--- --- Features --- ---

Photocell Integration: Detects room entries and exits, generating binary signals.
Occupancy Threshold: Monitors occupancy against a maximum threshold of 63 individuals.
Indicator Signal: Activates a signal when the maximum occupancy threshold is reached.
Reset Functionality: Includes a reset mechanism to revert the system to its initial state for accurate tracking.

--- --- File Structure --- ---

Code.vhd: Main VHDL file containing the system architecture.
Ajuster.vhd: VHDL file for the Ajuster component.
Comparater.vhd: VHDL file for the Comparater component.
registers.vhd: VHDL file for the registers component.

--- --- Components --- ---

Ajuster: Manages the count of current and next occupancy.
Comparater: Compares the current occupancy against the maximum threshold.
Registers: Stores and updates occupancy data for the Maximum threshold and the current tracking.

--- --- How to Use --- ---

Clone the Repository: Download or clone this repository to your local machine.
Open the Project: Open the VHDL files in a compatible VHDL editor or IDE, such as ModelSim or Vivado.
Simulation: Simulate the VHDL code to observe the system's behavior under various scenarios using a testbench.
implementation: Generate a bitstream and program your fpga board to respong to the behaviour

--- --- Prerequisites --- ---

Knowledge of VHDL and digital system design.
VHDL-compatible simulation software (e.g., ModelSim, Vivado).
FPGA board.

--- --- Contact --- ---

Project Maintainer: Penoelo Thibeaud
Email: penoelothibeaud1@gmail.com 