# Design-of-Error-Compensation-MAC-unit-for-low-voltage-DNN-accelerators
Verilog codes for the Error compensation MAC unit

The Compensation MAC  (CMAC) unit has:
1. Weight and activation - two 8-bit inputs
2. Partial Sum Input - 24-bit input
3. Error Product Input - 16-bit input 
4. Partial Sum Output - 24-bit output
5. Error Product Output - 16-bit output

The basic MAC unit has been improved on to create 4-grouped and 8-grouped architectures, which reduce the hardware overhead, in exchange for a drop in the accuracy of the MAC result.

The weight and activation are floating point inputs, which are converted to integers through a Python script. The Python script generates a .coe file which can be used in Block RAMs in FPGA applications.
