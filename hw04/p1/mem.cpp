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
 // data=&total_bytes;
  read_num=0;
  write_num=0;
  read_length=0;
  write_length=0;
  rd_speed=0;
  wr_speed=0;

}

mem::~mem()
{
 // cout << "Time Stamp is " << sc_core::sc_time_stamp()<< " To string " << sc_core::sc_time_stamp().to_string() << " To double is " << sc_core::sc_time_stamp().to_double() << endl;
  double total_trans_time=sc_core::sc_time_stamp().to_seconds();//10017;
 // cout << "time is " << total_trans_time << endl;
  //cout << "wr speed is " << write_length << "/" << total_trans_time << " = "<<  endl;
  wr_speed = double(write_length/total_trans_time);
  rd_speed = double(read_length/total_trans_time);   

  cout << " average write speed of " << sc_object::name() << " is " << wr_speed  << " Bytes per second " << endl;
  cout << " average read  speed of " << sc_object::name() << " is " << rd_speed  << " Bytes per second "  << endl;

};


void                                        
mem::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  sc_core::sc_time mem_delay(10,sc_core::SC_NS);
  	

  wait(delay+mem_delay);

  //cout << sc_core::sc_time_stamp() << " " << sc_object::name();
  if (address < m_memory_size) {
    switch (command) {
      case tlm::TLM_WRITE_COMMAND:
      {
  //    cout << " WRITE 0x" << hex << address << endl; 
	write_num++;
	write_length+=gp.get_data_length();
//	cout << sc_object::name() << " ===== " << write_num << " ======W======" << endl;
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
        break;
      }
      case tlm::TLM_READ_COMMAND:
      {
  //      cout << " READ 0x" << hex << address << endl; 
	read_num++;
	read_length+=gp.get_data_length();
//	cout << sc_object::name() << " ===== " << read_num << " ======R======" << endl;
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

  //gp.set_data_ptr((unsigned char*)(data));
  return;     
}







