ECE 720 - Electronic System Level & Physical Design
ARM CORTEX System-on-Chip 
(c) 2012-2014 By W. Rhett Davis

Certain files in this archive are Copyright ARM, Ltd. and Synopsys, Inc.
and are for use only by NCSU Students.  For these files, appropriate 
copyright notices are included in the header.  We are not licensed to 
distribute these files!

Directories:

v  - Contains the files needed to build and execute Verilog simulations
       for the ARM Cortex-M0-based System-on-Chip using the Mentor Graphics
       Questa Simulator.  Both RTL and Gate-Level simulations are supported.
sc - Contains the files needed to build and execute SystemC & TLM 2.0
       simulations using the ARM Fast Models for the Cortex M3 processor.
       This contents of this directory are currently identical to the
       cortexm0ds.tar.gz distribtion and have not been modified to model
       this SoC.  Put your project code here.
pr - Contains the files needed to place & route the design with Cadence
       Encounter, extract parasitics with Cadence QRC, and analyze the
       power distribution network with the Cadence Encounter Power System.
       The flow in this directory is also integrated with the v/synth
       directory for post-route analysis of timing, signal integrity, and
       power-analysis with Synopsys Prime-Time.  Power analysis is also
       integrated with Questa simulations in the v/sim directory to
       capture switching activity.

NOTE: Many of the files in this distribution have been copied from earlier
        tutorials and have not been updated for seamless execution.  It is
        expected that the user will need to update these files to complete
        the flow.

See the README.txt files in each subtree for more information
