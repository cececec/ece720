/*****************************************************************************

The following code is derived, directly or indirectly, from the SystemC
source code Copyright (c) 1996-2008 by all Contributors.
All Rights reserved.

The contents of this file are subject to the restrictions and limitations
set forth in the SystemC Open Source License Version 3.0 (the "License");
You may not use this file except in compliance with such restrictions and
limitations. You may obtain instructions on how to receive a copy of the
License at http://www.systemc.org/. Software distributed by Contributors
under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF
ANY KIND, either express or implied. See the License for the specific
language governing rights and limitations under the License.

*****************************************************************************/
//dw.target_socket same as s.slave   
//dw.source_socket same as bus.master
#ifndef __DWMEMCTL_H__
#define __DWMEMCTL_H__

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"
#include "tlm_utils/simple_initiator_socket.h"

template <int NR_OF_INITIATORS, int NR_OF_TARGETS>
class DWmemctl : public sc_core::sc_module
{
public:
  typedef tlm::tlm_generic_payload transaction_type;
  typedef tlm::tlm_phase phase_type;
  typedef tlm::tlm_sync_enum sync_enum_type;
  typedef tlm_utils::simple_target_socket<DWmemctl> target_socket_type;//same as slave <mem>
  typedef tlm_utils::simple_initiator_socket_tagged<DWmemctl> initiator_socket_type;//same as master.initiator

public:
  target_socket_type  target_socket[NR_OF_INITIATORS];//same as mem.h -> slave
  initiator_socket_type initiator_socket[NR_OF_TARGETS];
  
public:
  SC_HAS_PROCESS(DWmemctl);
  DWmemctl(sc_core::sc_module_name name) :
    sc_core::sc_module(name)
  {
    for (unsigned int i = 0; i < NR_OF_INITIATORS; ++i) {
      target_socket[i].register_b_transport(this, &DWmemctl::DWinitiatorBTransport);
      target_socket[i].register_transport_dbg(this, &DWmemctl::transportDebug);

    }
  }
  
  
void DWinitiatorBTransport ( tlm::tlm_generic_payload &trans, sc_core::sc_time &t )//int SocketId, 
  {
    initiator_socket_type* decodeSocket;
    decodeSocket = &initiator_socket[0];
    (*decodeSocket)->b_transport(trans, t);
  }
   sc_dt::uint64 getAddressMask(unsigned int portId)
  {
    return 0xfffffff;
  }
   
unsigned int transportDebug(transaction_type& trans)
  {
    unsigned int portId =0; //decode(trans.get_address());
    assert(portId < NR_OF_TARGETS);
    initiator_socket_type* decodeSocket = &initiator_socket[portId];
    trans.set_address( trans.get_address() & getAddressMask(portId) );
    
    return (*decodeSocket)->transport_dbg(trans);
  }
  

};
#endif
