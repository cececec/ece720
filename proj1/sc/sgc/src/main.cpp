/*************************************************
ECE 720 - Electronic System Level & Physical Design
SystemC / TLM 2.0 Simulation with ARM Fast Models
(c) 2012-2014 By W. Rhett Davis
**************************************************/

// Note: For documentation on the functions defined in the
// scx:: namespace, refer to the comments in the header
// files in $PVLIB_HOME/include/fmruntime/scx
//#define USE_STUB

#include <cstring>
#include <cstdlib>
#ifndef USE_STUB
  #include <amba_pv.h>
  #include <scx_evs_Cortex.h>
#endif
#include "stub.h"
#include "ahb_lite.h"
#include "mem.h"
#include "DW_memctl.h"

int sc_main(int argc , char * argv[]) {


    // Components  
    mem s("Memory", 0x60000000);
    #ifndef USE_STUB
      // Initialize simulation 
      scx::scx_initialize("Cortex");
      scx_evs_Cortex cpu("Cortex");
      amba_pv::amba_pv_to_tlm_bridge<64> amba2tlm("amba2tlm");
    #else
      stub stub("stub","xact_6k.out");
    #endif
      AHBlite<1, 1> bus("bus");
      DWmemctl<1, 1> dw("memctl");

    // Uncomment the following lines to set the simulation quantum, 
    // i.e. simulation time to run before synchronizing mxodules 
    //double instructions_per_quantum = 10000.0;
    //tlm::tlm_global_quantum::instance().set(
    //sc_core::sc_time(instructions_per_quantum/100000000,sc_core::SC_SEC));
            
    #ifndef USE_STUB
    // Simulation configuration
      scx::scx_parse_and_configure(argc, argv);
    #endif
    
    #ifndef USE_STUB    
    // Bindings
      cpu.amba_pv_m.bind(amba2tlm.amba_pv_s);
      amba2tlm.tlm_m.bind(bus.target_socket[0]);//mem,64,prot
    #else
      stub.master(bus.target_socket[0]);
    #endif
      bus.initiator_socket[0](dw.target_socket[0]);
      dw.initiator_socket[0](s.slave);//
      
    // Start of simulation
    sc_core::sc_start();
    std::cout << "Simulation Time: " << sc_core::sc_time_stamp() << std::endl;
    
 
    return EXIT_SUCCESS;
}

/*
 
Enable Static Memory Controller: No
Number of Chip Selects: 1 
AHB:
- AHB Data Width: 32
Controller:
- Add pipeline to address decoder outputs: No
- Address FIFO Depth: 4
- Write FIFO Depth: 8
- Enable EBI Interface: No
- Hard Wire SDRAM Parameters: No
- Hard Wire Chip-Select Parameters: No
SDRAM:
- Write Pipe for SDRAM: 0
- Read Pipe for SDRAM: 2
- Number of Clock Cycles between SDRAM refresh: 1040
- SDRAM INIT Cycles after power up: 8
- SDRAM Data Bus Width (Maximum): 16
- SDRAM Data Bus Width (Default Value): 16
- SDRAM Address Width (Maximum): 16
- Bank Address Width (Maximum): 2
- Use Higher AHB Address-bits for SDRAM Bank: No
- Number of Data Strobes for DDR SDRAM: 2
- Extended Mode Register Value: 0x0
- Row Address Width: 13
- Column Address Width: 12
- DDR-SDRAM Precharge Bit: A10
- Bank Address Width: 2
- Number of Banks to be kept open at any time: 4
- Set s_dout_valid signal to be deasserted when controller is idle: No
- Enable Ready Mode Read Operation (Use s_rd_ready): No
Controller ChipSelects:
- ChipSelect0
-- Block Size for ChipSelect0: 256 MB
-- Enable Remap for Chipselect0: No
-- Enable Aliasing for Chipselect0: No
*/
