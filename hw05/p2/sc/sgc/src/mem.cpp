/*************************************************
ECE 720 - Electronic System Level & Physical Design
LT Memory Model
(c) 2012-2014 By W. Rhett Davis
**************************************************/

#include "mem.h"

// Uncomment the following line to enable transaction-dumpint to stdout
//#define XACT_DUMP

using namespace  std;

SC_HAS_PROCESS(mem);
mem::mem( sc_core::sc_module_name module_name, sc_dt::uint64 memory_size )
  : sc_module (module_name)
  , m_memory_size (memory_size)
  , upper(0x20000000,0xFFFFFFFF)
  , middle(0x00010000,0x1FFFFFFF)
  , lower(0x0,0x0000FFFF)
{
  
  slave.register_b_transport(this, &mem::custom_b_transport);
  slave.register_transport_dbg(this, &mem::custom_transport_dbg);
  m_array = new unsigned char[size_t(memory_size)];  // Allocate memory
  memset(m_array, 0, size_t(memory_size));           // Clear memory

}


/*
tlm::tlm_sync_enum mem::nb_transport_fw
  ( tlm::tlm_generic_payload &gp, tlm::tlm_phase &phase, sc_core::sc_time &delay_time )
{
  cout << sc_core::sc_time_stamp() << " " << sc_object::name()
        << " NB Transport not implemented" << endl; 
  tlm::tlm_sync_enum  return_status = tlm::TLM_ACCEPTED;
  return return_status;
}

bool mem::get_direct_mem_ptr                       
  ( tlm::tlm_generic_payload &gp, tlm::tlm_dmi &dmi_data )
{
   cout << sc_core::sc_time_stamp() << " " << sc_object::name()
        << " DMI not implemented" << endl; 
   return false;
}
*/

void                                        
mem::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  unsigned char    *data     = gp.get_data_ptr();    // data pointer
  unsigned  int     length   = gp.get_data_length(); // data length
  sc_core::sc_time mem_delay(10,sc_core::SC_NS);

  wait(delay+mem_delay);
  if (address < m_memory_size) {
    switch (command) {
      case tlm::TLM_WRITE_COMMAND:
      {
        middle.log(address,true); upper.log(address,true); lower.log(address,true);
#ifdef XACT_DUMP
        cout << sc_core::sc_time_stamp() << " " << sc_object::name()
             << " WRITE addr=0x" << hex << address 
             << " size=0x" << length << " data=0x";
        for (unsigned int i = 0; i < length; i++)  {
          cout.width(2);
          cout.fill('0');
          cout << hex << (unsigned) data[i];
        }
        cout  << dec << endl; 
#endif
        if (address == 0x40000000) {
          if (data[0]==0x0D)
            sc_core::sc_stop();
          else
#ifdef XACT_DUMP
            cout << "To console: " << data[0] << endl;
#else
            cout << data[0];
#endif
        }
        for (unsigned int i = 0; i < length; i++) {
          m_array[address++] = data[i];
        }
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      case tlm::TLM_READ_COMMAND:
      {
        middle.log(address,false); upper.log(address,false); lower.log(address,false);
#ifdef XACT_DUMP
        cout << sc_core::sc_time_stamp() << " " << sc_object::name()
             << " READ addr=0x" << hex << address
             << " size=0x" << length << " data=0x";
        for (unsigned int i = 0; i < length; i++)  {
          cout.width(2);
          cout.fill('0');
          cout << hex << (unsigned) data[i];
        }
        cout  << dec << endl;
#endif
        for (unsigned int i = 0; i < length; i++) {
          data[i] = m_array[address++];
        }
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      default:
      {
#ifdef XACT_DUMP
        cout << sc_core::sc_time_stamp() << " " << sc_object::name()
             << " ERROR Command " << command << " not recognized" << endl;
#endif
        gp.set_response_status( tlm::TLM_COMMAND_ERROR_RESPONSE );
      } 
    }
  }
  else {
#ifdef XAC_DUMP
    cout << sc_core::sc_time_stamp() << " " << sc_object::name()
         << " ERROR Address 0x" << hex << address << " out of range" << endl;
#endif
    gp.set_response_status( tlm::TLM_ADDRESS_ERROR_RESPONSE );
  }  

  return;     
}



unsigned int mem::custom_transport_dbg( tlm::tlm_generic_payload  &gp)
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  unsigned char    *data     = gp.get_data_ptr();    // data pointer
  unsigned  int     length   = gp.get_data_length(); // data length
  unsigned int i=0;

  if (address < m_memory_size) {
    switch (command) {
      case tlm::TLM_WRITE_COMMAND:
      {
        //cout << sc_core::sc_time_stamp() << " " << sc_object::name()
        //     << " WRITE DBG 0x" << hex << address << dec << endl; 
        for (i = 0; i < length; i++) {
          m_array[address++] = data[i];
        }
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      case tlm::TLM_READ_COMMAND:
      {
        //cout << sc_core::sc_time_stamp() << " " << sc_object::name()
        //     << " READ DBG 0x" << hex << address << dec << endl; 
        for (i = 0; i < length; i++) {
          data[i] = m_array[address++];
        }
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      default:
      {
        //cout << sc_core::sc_time_stamp() << " " << sc_object::name()
        //     << " ERROR Command " << command << " not recognized" << endl;
        gp.set_response_status( tlm::TLM_COMMAND_ERROR_RESPONSE );
      } 
    }
  }
  else {
    //cout << sc_core::sc_time_stamp() << " " << sc_object::name()
    //     << " ERROR Address 0x" << hex << address << " out of range" << endl;
    gp.set_response_status( tlm::TLM_ADDRESS_ERROR_RESPONSE );
  }  

  return i;

}




