ECE 720 - Electronic System Level & Physical Design
ARM DesignStart CORTEX M0 TestBench 
(c) 2012-2014 By W. Rhett Davis

Certain files in this archive are Copyright ARM, Ltd. and are for use
only by NCSU Students.  For these files, appropriate copyright notices
are included in the header.  We are not licensed to distribute these files!

This directory contains the files necessary to compile a C-program to run
on the ARM DesignStart Cortex M0 processor. 

Files:
 
src/rtl/            - This directory contains two files from the original
                        Design Start Cortex-M0 distribution from ARM.  They
                        are copyrighted by ARM and should not be distributed
                        outside NCSU.  They define an RTL model for the 
                        processor.
sim/fibonacci.c     - Code to compute Fibonacci numbers, to be used to compare
                        RTL simulation time to TLM simulation time.
sim/Makefile        - Makefile for the fibonacci.c program and verilog 
                        simulation with Mentor Graphics Questa
sim/cortexm0ds_tb.v - Test-bench to load ram.bin (the compiled binary for
                        fibonacci.c)into memory and simulate with the 
                        processor.  This file has been modified from the 
                        original ARM DesignStart Cortex-M0 distribution to
                        include a "Transaction-Dump" process. (see below)
sim/modelsim.ini    - Setup file for Mentor Graphics Modelsim/Questa
sim/setup.csh       - Setup script for Mentor Graphics Questa and ARM DS5
                        for verilog simulation and ARM C-compilation.
sim/expected.out    - Expected output of "make sim" (see below)
sim/addr_stat.py    - Python script to print out address-access statistics
                        to be used with the "Transaction Dump" process. 

Directions:

1) Change to the "sim" directory
2) Use "source setup.csh" to setup your environment
3) Use "make" to build the ram.bin file
4) Use "make sim" to execute the Verilog simulation

Notes:

*  Use the "make clean" command to delete all generated files, in order
   to prepare the directory for archiving.

*  Use "make gui" to execute the Questa graphical user interface.
   In this mode, you must enter the command "run -all" to execute the 
   simulation, after adding the desired waveforms to the viewer.
   (Be sure to answer "no" when asked if you are sure that you
   want to end the simulation.  Answer "yes" will exit the GUI.)
   It is possible to use the command in conjunction with "make sim"
   to avoid restarting the GUI, by entering the command "restart"
   after rebuilding the simulation.

*  Use the Transaction-Dump process to dump a convenient trace of all bus
   transactions.  To activate this process, uncomment the line that
   defines the macro XACT_DUMP at the top of the cortexm0ds_tb.v file.

*  To generate address access statistics, activate the transaction-dump
   process and parse the simulaiton output with addr_stat.py as follows:

     % make sim > sim.out
     % python addr_stat.py sim.out

   Three address ranges are included, corrsponding to the program memory, 
   stack memory, and console.  The ranges cover the entire 32-bit address 
   space to help identify unwanted transactions to other locations.
   To modify the ranges, change the "logs" variable in the Python script.

*  Note that the program memory resides in the range 0x00000000 - 0x1fffffff,
   as recommended in the DesignStart Cortex-M0 release notes, but that the
   fibonacci.c code limits the program to a 128 KB program memory. 
   Note also that the console is mapped to address 0x40000000, which lies 
   within the address range 0x40000000 - 0x5fffffff as recommended in the 
   DesignStart Cortex-M0 release notes for peripherals.  Code to print 
   characters sent to address 0x40000000 is used to model console
   communication through a UART.  The test bench also ends the simulation 
   when the end-of-file character (0x0D) is written to this location.

*  Change the CPROGRAM variable in the Makefile to switch between building
   the fibonacci.c program and a different program.

*  Change the ITERATIONS macro in fibonacci.c to increase or decrease its
   simulation time, as needed to make interesting comparisons to the
   SystemC simulation.  Note that "make gui" could take considerably longer
   to execute than "make sim", because all optimations are turned off.

