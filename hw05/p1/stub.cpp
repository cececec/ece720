/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "stub.h"

using namespace std;

stub::stub (sc_core::sc_module_name name, const char *xactfile)
  : sc_module(name), filename(xactfile)
 { 
    master(*this);
    SC_THREAD(main);
 }
 
void stub::main(void)
{
  sc_core::sc_time delay=sc_core::SC_ZERO_TIME; // Transaction delay
  tlm::tlm_generic_payload  gp;                 // Payload
  gp.set_streaming_width  ( 4 );                // Assume 4-byte bus width
  unsigned long length;                         // Transaction length (bytes)
  sc_dt::uint64 addr;                           // Transaction address

  // Variables for reading transaction file
  ifstream f(filename,ios::in);
  double time_val;
  string time_unit;
  sc_core::sc_time start_time;
  string cmd;

  // Skip the first line, assume it is a comment
  if (f.good())
    getline(f,cmd);
  while (f.good()) {
    f >> time_val >> time_unit >> cmd >> hex >> length >> addr;
    if (!f.good())
      continue;

    if (cmd=="WRITE")
      gp.set_command(tlm::TLM_WRITE_COMMAND);
    else if (cmd=="READ")
      gp.set_command(tlm::TLM_READ_COMMAND);
    else {
      cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
	   << " Unrecognized command: " << cmd << endl;
      continue;
    }
    gp.set_address( addr );
    gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
    gp.set_data_length( length );

    // Parse the start-time from the transaction file
    if (time_unit=="fs")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_FS);  }
    else if (time_unit=="ps")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_PS);  }
    else if (time_unit=="ns")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_NS);  }
    else if (time_unit=="us")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_US);  }
    else if (time_unit=="ms")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_MS);  }
    else
      { start_time=sc_core::sc_time(time_val,sc_core::SC_SEC); }

    // Wait until the transaction start-time is reached
    if (sc_core::sc_time_stamp() < start_time)
      wait( start_time-sc_core::sc_time_stamp() );

    // Perform the transaction
    cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
         << " " << cmd << " " << hex << length << " " << addr << endl;
    master->b_transport(gp, delay);
    if (gp.get_response_status() != tlm::TLM_OK_RESPONSE)
    cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
         << " ERROR Response Status " << gp.get_response_status() << endl;
  }
   
  cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
       << " Completed" << endl;
} // end main


tlm::tlm_sync_enum  stub::nb_transport_bw( tlm::tlm_generic_payload &gp,
                           tlm::tlm_phase &phase, sc_core::sc_time &delay)
{
  tlm::tlm_sync_enum status;
  status = tlm::TLM_ACCEPTED;
  return status;
} // end nb_transport_bw


void stub::invalidate_direct_mem_ptr					
  (sc_dt::uint64 start_range, sc_dt::uint64 end_range)
{  
    return;
} // end invalidate_direct_mem_ptr
