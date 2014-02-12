/*************************************************
ECE 720 - Electronic System Level & Physical Design
SystemC / TLM 2.0 Simulation with ARM Fast Models
(c) 2012-2014 By W. Rhett Davis
**************************************************/

// Note: For documentation on the functions defined in the
// scx:: namespace, refer to the comments in the header
// files in $PVLIB_HOME/include/fmruntime/scx


#include <cstring>
#include <cstdlib>
#include <amba_pv.h>

#include <scx_evs_Cortex.h>
#include "mem.h"

int sc_main(int argc , char * argv[]) {

    // Initialize simulation 
    scx::scx_initialize("Cortex");

    // Components
    amba_pv::amba_pv_to_tlm_bridge<64> amba2tlm("amba2tlm");
    mem s("Memory", 0x60000000);
    scx_evs_Cortex cpu("Cortex");

    // Simulation configuration
    scx::scx_parse_and_configure(argc, argv);
   
    // Uncomment the following lines to set the simulation quantum, 
    // i.e. simulation time to run before synchronizing modules 
    //double instructions_per_quantum = 10000.0;
    //tlm::tlm_global_quantum::instance().set(
    //    sc_core::sc_time(instructions_per_quantum/100000000,sc_core::SC_SEC));

    // Bindings
    cpu.amba_pv_m.bind(amba2tlm.amba_pv_s);
    amba2tlm.tlm_m.bind(s.slave);

    // Start of simulation
    sc_core::sc_start();
    std::cout << "Simulation Time: " << sc_core::sc_time_stamp() << std::endl;
    return EXIT_SUCCESS;
}
