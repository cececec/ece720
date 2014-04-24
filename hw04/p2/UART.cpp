/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "UART.h"

using namespace  std;

SC_HAS_PROCESS(UART);
UART::UART( sc_core::sc_module_name module_name )
  : sc_module (module_name)
  //, m_memory_size (memory_size)
{
  
  slave.register_b_transport(this, &UART::custom_b_transport);
  start_time=sc_core::SC_ZERO_TIME, loop_time=sc_core::SC_ZERO_TIME;
  sc_core::sc_time time_val(100,sc_core::SC_NS);
  str= "Hello, World!";
}

void                                        
UART::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  sc_core::sc_time UART_delay(0,sc_core::SC_NS);
  sc_core::sc_time time_val(100,sc_core::SC_NS);

  //cout <<	"PARAMETER=====time_val " <<  time_val <<" str " << str << " ============"<<endl;
  if (loop_time == sc_core::SC_ZERO_TIME)
    {
	p=str;
	c=*p++;
	data=&c;
	cout << sc_core::sc_time_stamp() << " " << sc_object::name() << " is writing " << c << " of string 'Hello, World!'" << endl;
        //cout << "Initiated loop_time " <<  loop_time  << " stamp "<<sc_core::sc_time_stamp()  << endl ;
	loop_time=sc_core::sc_time_stamp()+time_val;
 	//cout << "inited loop_time " << loop_time <<endl ;
    }
  else if (loop_time == sc_core::sc_time_stamp())
    {
	if (!*p)
	  p=str;
	c=*p++;
	data=&c;
	cout << sc_core::sc_time_stamp() << " " << sc_object::name() << " is writing " << c << " of string 'Hello, World!'" << endl;
	//cout << loop_time << "loop_time"<<  sc_core::sc_time_stamp() << "stamp"<< endl ;
	loop_time=sc_core::sc_time_stamp()+time_val;
    }
  


  

  
 // wait(delay+UART_delay);
  //cout << sc_core::sc_time_stamp() << " " << sc_object::name();
  if (address==0) {
    switch (command) {
      case tlm::TLM_READ_COMMAND:
      {
        //cout << " @64U READ address 0x" <<  address << endl; 
	if (data)
         {
	   //cout << "D READ " << *data  << endl;
           gp.set_response_status( tlm::TLM_INCOMPLETE_RESPONSE );
	   break;
	 }
	else
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
  else //address ==1 
  {
    //cout << sc_core::sc_time_stamp() << " " << sc_object::name() << " is reading address 0x" << address << " " << endl;
    gp.set_data_ptr(data);
    data=NULL;
    gp.set_response_status( tlm::TLM_OK_RESPONSE );
    
  }  

  return;     
}
