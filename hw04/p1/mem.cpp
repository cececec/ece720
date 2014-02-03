/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "mem.h"

using namespace  std;

SC_HAS_PROCESS(mem);
mem::mem( sc_core::sc_module_name module_name, sc_dt::uint64 memory_size )
  : sc_module (module_name)
  , m_memory_size (memory_size)
{
  
  slave.register_b_transport(this, &mem::custom_b_transport);

}

void                                        
mem::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  sc_core::sc_time mem_delay(10,sc_core::SC_NS);

  wait(delay+mem_delay);
  cout << sc_core::sc_time_stamp() << " " << sc_object::name();
  if (address < m_memory_size) {
    switch (command) {
      case tlm::TLM_WRITE_COMMAND:
      {
        cout << " WRITE 0x" << hex << address << endl; 
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      case tlm::TLM_READ_COMMAND:
      {
        cout << " READ 0x" << hex << address << endl; 
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      default:
      {
        cout << " ERROR Command " << command << " not recognized" << endl;
        gp.set_response_status( tlm::TLM_COMMAND_ERROR_RESPONSE );
      } 
    }
  }
  else {
    cout << " ERROR Address 0x" << hex << address << " out of range" << endl;
    gp.set_response_status( tlm::TLM_ADDRESS_ERROR_RESPONSE );
  }  

  return;     
}







