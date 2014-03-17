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
      stub stub("stub","xact0.txt");
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


