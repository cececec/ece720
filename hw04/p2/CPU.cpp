/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "CPU.h"

using namespace std;

CPU::CPU (sc_core::sc_module_name name)
  : sc_module(name)
 { 
    master(*this);
    SC_THREAD(main);
 }
 
void CPU::main(void)
{
  sc_core::sc_time delay(100,sc_core::SC_NS); // Transaction delay
  tlm::tlm_generic_payload  gp;                 // Payload
  gp.set_streaming_width  ( 4 );                // Assume 4-byte bus width
  unsigned long length;                         // Transaction length (bytes)
  sc_dt::uint64 addr;                           // Transaction address

  // Variables for reading transaction file
 // ifstream f(filename,ios::in);
//  double time_val;
//  string time_unit;
  sc_core::sc_time start_time;
  unsigned char* dp=NULL;
  //string cmd;

  //const char *str= "Hello, World!";
  //const char *p=str;
  //char c;

  // Skip the first line, assume it is a comment 
  while (true)
   {
    
    length=1;
    addr=0;

    gp.set_command(tlm::TLM_READ_COMMAND);

    gp.set_address( addr );
    gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
    gp.set_data_length( length );

    /*/ Parse the start-time from the transaction file

    if (time_unit=="ns")
      { start_time=sc_core::sc_time(time_val,sc_core::SC_NS);  }

    // Wait until the transaction start-time is reached
    if (sc_core::sc_time_stamp() < start_time)
      wait( start_time-sc_core::sc_time_stamp() );
	*/
    // Perform the transaction
    cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
         << " is polling address "  << addr << endl;
    master->b_transport(gp, delay);

    
   if (gp.get_response_status() == tlm::TLM_INCOMPLETE_RESPONSE)
    {
	std::cout << sc_core::sc_time_stamp().to_string() << " " << sc_object::name() << " read 1"  << " from address 0" << endl;    
	wait(20, sc_core::SC_NS); 
	addr=1;
	gp.set_address( addr );
        cout << sc_core::sc_time_stamp() << " " << sc_object::name()  << " is polling address "<<  addr << endl;
        master->b_transport(gp, delay);
        if (gp.get_response_status() == tlm::TLM_OK_RESPONSE)
          dp= gp.get_data_ptr();
	else
	  cout << " ERROR Response " << gp.get_response_status() << " not recognized" << endl;
	std::cout << sc_core::sc_time_stamp().to_string() << " " << sc_object::name() << " read "<< *dp  << " from address 0" << endl;    
	wait(20, sc_core::SC_NS); 
    }
   else
    {
	std::cout << sc_core::sc_time_stamp().to_string() << " " << sc_object::name() << " read 0"  << " from address 0" << endl;    
	wait(20, sc_core::SC_NS);
    } 
	
	
//cout << sc_core::sc_time_stamp() << " " << sc_object::name() <<  " ERROR Response Status " << gp.get_response_status() << endl;

	//wait(20, sc_core::SC_NS); 
 }
   
  cout << sc_core::sc_time_stamp() << " " << sc_object::name() 
       << " Completed" << endl;
} // end main


tlm::tlm_sync_enum  CPU::nb_transport_bw( tlm::tlm_generic_payload &gp,
                           tlm::tlm_phase &phase, sc_core::sc_time &delay)
{
  tlm::tlm_sync_enum status;
  status = tlm::TLM_ACCEPTED;
  return status;
} // end nb_transport_bw


void CPU::invalidate_direct_mem_ptr					
  (sc_dt::uint64 start_range, sc_dt::uint64 end_range)
{  
    return;
} // end invalidate_direct_mem_ptr
