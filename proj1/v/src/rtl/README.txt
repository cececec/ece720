ECE 720 - Electronic System Level & Physical Design
ARM DesignStart CORTEX M0 System-on-Chip
(c) 2012-2014 By W. Rhett Davis

Certain files in this archive are Copyright ARM, Ltd. and Synopsys, Inc.
and are for use only by NCSU Students.  For these files, appropriate 
copyright notices are included in the header.  We are not licensed to 
distribute these files!

Files:
 
cortexm0ds_logic.v  - Verilog RTL code for the ARM DesignStart CORTEX M0
                        processor.  Copyright ARM, Ltd.
CORTEXM0DS.v        - Top-level module for the ARM DesignStart CORTEX M0 
                        processor.  Copyright ARM, Ltd.
AHB_Lite_2s.v       - Verilog RTL Code for an AHB-Lite interconnect with
                        two slaves, by Aparna Mohan.
DW_memctl.v         - Gate-level verilog netlist of a Synopsys DesignWare
                        DRAM controller, synthesized using coreConsultant
                        by David Huffman.  Copyright Synopsys, Inc.
AHBlite_stub.sv     - System-Verilog code for a stub to generate burst
                        transactions, by Brandon Dwiel.  This code is not 
                        RTL but is included here for convenience.
AHB_defines.v       - Macros used by the AHB-Lite stub
cortex_soc.v        - Top-level netlist for the SoC, including all designs

