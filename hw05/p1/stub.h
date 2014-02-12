/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#ifndef __STUB_H__
#define __STUB_H__

#include <tlm.h>

class stub
  : public sc_core::sc_module                       
  , virtual public tlm::tlm_bw_transport_if<>
{
  public:

  SC_HAS_PROCESS(stub);  
  stub(sc_core::sc_module_name name, const char *xactfile);

  tlm::tlm_initiator_socket<> master;
  const char *filename;

  void main(void);
private: 

/// Not Implemented for this example but required by the initiator socket
  void invalidate_direct_mem_ptr
    (sc_dt::uint64 start_range, sc_dt::uint64 end_range);
  tlm::tlm_sync_enum nb_transport_bw (tlm::tlm_generic_payload  &gp, 
     tlm::tlm_phase &phase, sc_core::sc_time &delay);

};


#endif /* __STUB_H__ */
