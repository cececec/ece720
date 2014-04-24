/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/


#ifndef __UART_H__
#define __UART_H__

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"

class UART: public sc_core::sc_module
{
  public:  

  UART( sc_core::sc_module_name module_name
      // sc_dt::uint64  memory_size  // memory size (bytes)
      );

  tlm_utils::simple_target_socket<UART>  slave;
 
  private:
   

  const char *str;
  const char *p;
  unsigned char c;
  unsigned char* data;
  sc_core::sc_time start_time, loop_time, time_val;
	    
 // sc_dt::uint64 m_memory_size;

  void custom_b_transport
  ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay );

};


#endif /* __MEM_H__ */
