/*
 * 
 *
 * This is an automatically generated file. Do not edit.
 *
 * Copyright 2011 ARM Limited.
 *
 * All rights reserved.
 */

/* Includes */
#include <scx/scx.h>

#include "scx_evs_Cortex.h"

#include "Cortex__AMBAPV_ClassDef.h"


namespace Cortex_NMS {

/* Externs */
extern sg::ComponentFactory * Cortex_GetFactory();

/* Functions */

/*
 * Slave port class constructors TLM2 draft 1 and Signal Protocols (TLM1).
 */


/*
 * Slave port class constructors TLM2 final.
 */


/*
 * Slave port class destructors. TLM2 draft 1 and Signal Protocols (TLM1).
 */


/*
 * Slave port class destructors TLM2 final.
 */


/*
 * Master port class constructors TLM2 final.
 */
sc_master_port_class_amba_pv_m::sc_master_port_class_amba_pv_m(const std::string &portname): amba_pv::amba_pv_master_base(portname.c_str())
{
	sg_port = new Cortex__AMBAPV;
}


/*
 * Master port class destructors TLM2 final.
 */
sc_master_port_class_amba_pv_m::~sc_master_port_class_amba_pv_m()
{
	delete sg_port;
}


/*
 * Constructor.
 */
scx_evs_Cortex::scx_evs_Cortex(sc_core::sc_module_name name_):
    sc_core::sc_module(name_),
    scx::scx_evs_base(sc_core::sc_module::name(), Cortex_GetFactory())


,amba_pv_m("amba_pv_m")
,sc_master_port_amba_pv_m("amba_pv_m")

 {

    /* Allocate Master ports  */
    	publish_master_port("sg_master_port_amba_pv_m", * sc_master_port_amba_pv_m.sg_port);


    /* Bind slave exports to slave_base implementations TLM2 draft1*/
    

    /* Bind slave exports to slave_base implementations TLM2 final*/
    

    /* Bind master sockets to master base implementation (TLM2 final) */
    	amba_pv_m(sc_master_port_amba_pv_m);
	publish_master_port("amba_pv_m", *(sc_master_port_amba_pv_m.sg_port));

}

/*
 * Destructor.
 */
scx_evs_Cortex::~scx_evs_Cortex() {
    /* free master port pointers (TLM2 draft1) */
    

    /* If deprecation warnings were issued tell user how to turn them off */
    if (sc_core::sc_report_handler::get_count(scx::SCX_ID_FM_DEPRECATION) > 0) {
        SC_REPORT_INFO(scx::SCX_ID_FM_DEPRECATION,
                       "You can turn off warnings about\n"
                       "              Fast Models deprecated features by "
                       "placing this method call\n"
                       "              as the first statement in your sc_main() "
                       "function:\n\n  "
                       "sc_report_handler::set_actions(\"/ARM_FastModels/deprecated\", "
                       "SC_DO_NOTHING);\n\n");
    }
}

/*
 * sc_module override-able.
 * Returns the kind string of this SystemGenerator sub-system SystemC
 * wrapper.
 */
const char * scx_evs_Cortex::kind() const {
    return "scx_evs_Cortex";
}

/*
 * sc_module override-able.
 * Triggered before end of elaboration.
 */
void scx_evs_Cortex::before_end_of_elaboration() {
    scx::scx_evs_base::before_end_of_elaboration();

    /* Bind master ports (must be done after the exported subsystem has been
     * created) and slave ports TLM2 draft 1  */
    

    /* TLM2 final (bind slave ports) */
    

    /* TLM2 final (bind master ports) */
    	find_sg_port("amba_pv_m").connectTo(*(sc_master_port_amba_pv_m.sg_port));
	bind_method(*(sc_master_port_amba_pv_m.sg_port), read, (&amba_pv::amba_pv_master_socket<64>::read), &amba_pv_m);
	bind_method(*(sc_master_port_amba_pv_m.sg_port), write, (&amba_pv::amba_pv_master_socket<64>::write), &amba_pv_m);
	bind_method(*(sc_master_port_amba_pv_m.sg_port), debug_read, (&amba_pv::amba_pv_master_socket<64>::debug_read), &amba_pv_m);
	bind_method(*(sc_master_port_amba_pv_m.sg_port), debug_write, (&amba_pv::amba_pv_master_socket<64>::debug_write), &amba_pv_m);
	bind_method(*(sc_master_port_amba_pv_m.sg_port), b_transport, (&amba_pv::amba_pv_master_socket<64>::b_transport), &amba_pv_m);
	bind_method(*(sc_master_port_amba_pv_m.sg_port), transport_dbg, (&amba_pv::amba_pv_master_socket<64>::transport_dbg), &amba_pv_m);
	bind_method(*(sc_master_port_amba_pv_m.sg_port), get_direct_mem_ptr, (&amba_pv::amba_pv_master_socket<64>::get_direct_mem_ptr), &amba_pv_m);

}

/*
 * sc_module override-able.
 * Triggered after elaboration.
 */
void scx_evs_Cortex::end_of_elaboration() {
    scx::scx_evs_base::end_of_elaboration();
}

/*
 * sc_module override-able.
 * Triggered before simulation.
 */
void scx_evs_Cortex::start_of_simulation() {
    scx::scx_evs_base::start_of_simulation();
}

/*
 * sc_module override-able.
 * Triggered after simulation.
 */
void scx_evs_Cortex::end_of_simulation() {
    scx::scx_evs_base::end_of_simulation();
}

/*
 * Slave port wrapper functions.
 *
 * TLM2 draft 1 and for signals
 */


/*
 * Slave port wrapper functions.
 *
 * TLM2 final and for signals.
 */


/*
 * Master port wrapper functions.
 *
 * TLM2 final.
 */
void sc_master_port_class_amba_pv_m::invalidate_direct_mem_ptr(int socket_id, sc_dt::uint64 start_range, sc_dt::uint64 end_range)
{
	return sg_port->invalidate_direct_mem_ptr(socket_id, start_range, end_range);
}



}   /* namespace Cortex_NMS */

/* End of file */
