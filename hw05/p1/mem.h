/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/


#ifndef __MEM_H__ 
#define __MEM_H__

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"
#include<queue>

class mem: public sc_core::sc_module
{
  public:  

  mem( sc_core::sc_module_name module_name,
       sc_dt::uint64  memory_size  // memory size (bytes)
      );

  tlm_utils::simple_target_socket<mem>  slave;
  enum subcommand_set {NOP=0, READ, WRITE, PRECHARGE, ACTIVE};
  const char * subcommandsetstr[] ;
  enum subcommand_set subcommand;
  enum subcommand_set last_subcommand;
  sc_dt::uint64    last_address;
 

  private:
	    
  sc_dt::uint64 m_memory_size;
  std::queue<subcommand_set> chopboard;
  std::queue<subcommand_set> showcase;
  unsigned int data_bit_width;
  unsigned int burst_length;

  void custom_b_transport
  ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay );
  void translator 
  ( tlm::tlm_generic_payload &gp, sc_dt::uint64 address, int numofread, const char * subcommandsetstr[]);
  void scheduler 
  ( tlm::tlm_generic_payload &gp, sc_dt::uint64 address, unsigned long length, int numofread, const char * subcommandsetstr[]);

};


#endif /* __MEM_H__ */
