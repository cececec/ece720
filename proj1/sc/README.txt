ECE 720 - Electronic System Level & Physical Design
ARM Fast Models CORTEX M3 TestBench
(c) 2012-2014 By W. Rhett Davis

Certain files in this archive are Copyright ARM, Ltd. and are for use
only by NCSU Students.  For these files, appropriate copyright notices
are included in the header.  We are not licensed to distribute these files!

This directory contains the files necessary to execute SystemC & TLM
2.0 simulations with the ARM Fast Models for the Cortex M3 processor.
The "image" subdirectory contains the files to compile the source
program using the ARM compiler, while the "sgc" subdirectory cotains
the files to compile and execute SystemC simulations with ARM System
Generator Canvas.


Files:

image/fibonacci.c    - Code to compute Fibonacci numbers, to be used to compare
                         RTL simulation time to TLM simulation time.
image/Makefile       - Makefile for the fibonacci.c program using armcc
image/setup.csh      - Setup script for ARM DS5 and C-compilation.

sgc/src/             - This directory contains the SystemC TLM-2.0 files
                         to setup instance of a Cortex-M3 processor and
                         connect it to a memory through an AMBA-PV socket
                         to a TLM 2.0 socket.
sgc/Cortex-M3.lisa   - ARM System Generator Canvas system description
                         for a simple Cortex-M3 processor with a 100 MHx
                         clock and AMBA-PV transaction port.
sgc/Cortex-M3.sgproj - ARM System Generator Canvas project file corresonding
                         to the Cortex-M3.lisa file.  This was a generated
                         file that is copied to allow compilaiton without
                         using the System Generator Canvas GUI.
sgc/Makefile         - Makefile to build and execute the simulation
sgc/makefile.include - Common makefile rules.  This file comes from the 
                        ARM Fast Models distribution and is not to be 
                        distributed outside NCSU.
sgc/setup.csh        - Setup script for ARM DS5 and System Generator Canvas


Directions:

1) Change to the "image" directory
2) Use "source setup.csh" to setup your environment
3) Use "make" to build the fibonacci.axf file
4) Change to the "../sgc" directory
5) Use "source setup.csh" to setup your environment, if needed
     (note that it is identical to the file in the "image" directory)
6) Use "make" to build the simulation
7) Use "make sim" to execute the simulation
8) Repeat these steps as needed to re-build and re-simulate
     the image and simulation

Notes:

*  Use the "make clean" command to delete all generated files, in order
   to prepare the directory for archiving.

*  Use "make dbg" and "make gdb" in the place of "make" and "make sim"
   to build a debuggable execuable and to launch the GNU Debugger.

*  The fibonacci.c program is identical to the one in the v/ subtree
   and is copied here to help debug differences in the files.

*  The "console" is implemented in the mem.cpp file, which outputs 
   characters written to location 0x40000000 to stdout.  This module
   also ends the simulation when the end-of-file character (0x0D) is 
   written to this location.

*  Activate transaction-dumping to output a convenient trace of all
   bus transactions.  To activate this process, uncomment the line that
   defines the macro XACT_DUMP at the top of the sgc/src/mem.cpp file.

*  Address access statistics are printed out automatically by the mem module
   at the end of the simulation.  Three address ranges are included, 
   corrsponding to the program memory, stack memory, and console.
   The ranges cover the entire 32-bit address space to help identify
   unwanted transactions to other locations.

*  Change the CPROGRAM variable in the Makefile to switch between building
   the fibonacci.c program and a different program.

*  Change the ITERATIONS macro in fibonacci.c to increase or decrease its
   simulation time, as needed to make interesting comparisons to the
   Verilog simulation.


