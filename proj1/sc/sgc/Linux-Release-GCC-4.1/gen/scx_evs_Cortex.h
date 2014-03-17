/*
 * 
 *
 * This is an automatically generated file. Do not edit.
 *
 * Copyright 2011 ARM Limited.
 *
 * All rights reserved.
 */

#ifndef scx_evs_Cortex__H
#define scx_evs_Cortex__H

/* Includes */
#if ! defined(SC_INCLUDE_DYNAMIC_PROCESSES)
#define SC_INCLUDE_DYNAMIC_PROCESSES
#endif
#include <systemc>
#include <tlm.h>

#include <scx/scx.h>

/* Includes from the 'includes' section of the protocols */
#line 9 "/ncsu/ds5-2013.06/FastModelsPortfolio_8.2/LISA/AMBAPVProtocol.lisa"

        #include <amba_pv.h>
    
#line 29 "./Linux-Release-GCC-4.1/gen/scx_evs_Cortex.h"


namespace Cortex_NMS {

/* Forward declarations */
class Cortex__AMBAPV;


/* Slave port classes TLM2 draft1*/


/* Slave port classes TLM2 final */


/* Master port clases TLM2 final */
class sc_master_port_class_amba_pv_m: public amba_pv::amba_pv_master_base
{
public:
	sc_master_port_class_amba_pv_m(const std::string &portname);
	~sc_master_port_class_amba_pv_m();
	Cortex__AMBAPV *sg_port;
	void invalidate_direct_mem_ptr(int socket_id, sc_dt::uint64 start_range, sc_dt::uint64 end_range);
};


/* System C wrapper class */
class scx_evs_Cortex:
    public sc_core::sc_module,
    public scx::scx_evs_base {

        /* Ports */
    public:

        /* Slave ports TLM2 final */


        /* Slave ports TLM2 draft 1 and TLM 1 (Signal port interfaces) */


        /* Master ports TLM2 final */
	amba_pv::amba_pv_master_socket<64> amba_pv_m;
	sc_master_port_class_amba_pv_m sc_master_port_amba_pv_m;


        /* Master ports TLM2 draft 1 and TLM 1 (Signal port interfaces ) */


    /* Construction */
        explicit scx_evs_Cortex(sc_core::sc_module_name);
        virtual ~scx_evs_Cortex();

    /* sc_object override-ables */
        virtual const char * kind() const;

    /* Implementation */
    protected:

        /* sc_module override-ables */
        virtual void before_end_of_elaboration();
        virtual void end_of_elaboration();
        virtual void start_of_simulation();
        virtual void end_of_simulation();
};

}   /* namespace Cortex_NMS */

using Cortex_NMS::scx_evs_Cortex;

#endif  /* defined(scx_evs_Cortex__H) */
