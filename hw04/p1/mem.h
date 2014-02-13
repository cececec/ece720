/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/


#ifndef __MEM_H__ 
#define __MEM_H__

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"

class mem: public sc_core::sc_module
{
  public:  

  mem( sc_core::sc_module_name module_name,
       sc_dt::uint64  memory_size  // memory size (bytes)
      );
  ~mem();  
  tlm_utils::simple_target_socket<mem>  slave;
 
  private:
	    
  sc_dt::uint64 m_memory_size;
  unsigned int read_num;
  unsigned int write_num;
  unsigned int read_length;
  unsigned int write_length;
  double wr_speed;
  double rd_speed;
  double total_trans_time;

  void custom_b_transport
  ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay );

};


#endif /* __MEM_H__ */
