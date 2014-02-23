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
  last_subcommand = NOP;
  last_address   = 0x3ffff;
  data_bit_width=16;//bits
  burst_length=8;// 8 bursts once at most 
}

void                                        
mem::custom_b_transport
 ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay )
{
  sc_dt::uint64    address   = gp.get_address();
  tlm::tlm_command command   = gp.get_command();
  unsigned long length = gp.get_data_length();
  //cout << "length is " << length << endl;
  const char * subcommandsetstr[]= {"NOP", "READ", "WRITE", "PRECHARGE", "ACTIVE"};
  


  //wait(delay+mem_delay);
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
        cout << " READ 0x" << hex << address<< endl; 
	cout << "Into " << sc_object::name() << "... Ready to issue subcommands, " ;           	  
        cout << dec << length << " bytes data to be read" << endl;
        int max_burst_bytes=burst_length*(data_bit_width/8); // Max bytes at one time during a burst-read
	int numofread=length/max_burst_bytes;
	translator( gp, address, numofread, subcommandsetstr );
        gp.set_response_status( tlm::TLM_OK_RESPONSE );
	scheduler( gp, address, length, numofread, subcommandsetstr );
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
  last_address=address;
  return;     
}

void
mem::translator
 ( tlm::tlm_generic_payload &gp, sc_dt::uint64 address, int numofread, const char* subcommandsetstr[] )
{
  int i=4;//gp.get_streaming_width();
  // cout << "address is "<< address << "; in row "<< address/256 << "; num "<< address%256 <<endl; 
  
  if(address/256==last_address/256){  // in the same row
    cout << "Data in the same row  " << endl;
    for (i=0;i<numofread;i++){//numbers of Burst-READ needed to complete transaction
      chopboard.push(READ);
      //cout << "One READ needed" << endl;
    }    
  } 
  else { // In different rows
    cout << "Data is in different row" << endl;
    chopboard.push(PRECHARGE);
    chopboard.push(ACTIVE);
    for (i=0;i<numofread;i++){
      chopboard.push(READ);
      //cout << "One READ needed" << endl;
    } 
  }

  return;
}


void
mem::scheduler
 ( tlm::tlm_generic_payload &gp, sc_dt::uint64 address, unsigned long length, int numofread, const char* subcommandsetstr[] )
{
 
  sc_core::sc_time cycle_length(10,sc_core::SC_NS);// 1 cycle 
  sc_core::sc_time CAS(20,sc_core::SC_NS);// 2 cycles
  sc_core::sc_time RCD(15,sc_core::SC_NS);
  sc_core::sc_time RP(15,sc_core::SC_NS);
  sc_core::sc_time RAS(40,sc_core::SC_NS);
  sc_core::sc_time RC(55,sc_core::SC_NS);
  sc_core::sc_time RRD(10,sc_core::SC_NS);
  sc_core::sc_time WTR(20,sc_core::SC_NS);// w cycles
  sc_core::sc_time WR(15,sc_core::SC_NS);
  sc_core::sc_time begin_of_burst;
  sc_core::sc_time end_of_burst;

  

  if (length <=4){
    cout << "translatoring..." << chopboard.size() <<  endl;
  }
  else {
    int num_read=numofread;
    unsigned long data_sent=0;
    while (chopboard.size()){
      subcommand=chopboard.front();
      //cout << sc_core::sc_time_stamp() << " In " << sc_object::name();
      //cout << " Scheduler is trying to issue subcommand " << subcommandsetstr[subcommand] << " ..." <<endl;

    switch (subcommand) {
      case NOP:
      {
        cout  << sc_core::sc_time_stamp() << " NOP @" << hex << address << endl; 
        break;
      }
      case READ:
      {
	
	if (last_subcommand==ACTIVE){
	  cout << sc_core::sc_time_stamp() << " RCD Delay..." << endl;
	  wait(RCD);
	  begin_of_burst = sc_core::sc_time_stamp() + CAS;
	  end_of_burst   = sc_core::sc_time_stamp() + CAS + 4*cycle_length;
	  cout << sc_core::sc_time_stamp() << " READ issued " << endl;
	  num_read--;
	  cout << sc_core::sc_time_stamp() << " CAS Delay..." << endl;
          wait (CAS) ;  
	}
	if (begin_of_burst.value() > sc_core::sc_time_stamp().value()){
	  cout << sc_core::sc_time_stamp() << " CAS Delay..." << endl;
	  wait(begin_of_burst-sc_core::sc_time_stamp());
	}
        for(int i=0;i<8;i++){
	  //cout << sc_core::sc_time_stamp() <<" New end of burst is  " << end_of_burst << endl;
	  if ((num_read)&&(RCD+sc_core::sc_time_stamp()>=end_of_burst)&&(sc_core::sc_time_stamp().value()%10==0)){ // Issue new READ command
	    begin_of_burst=sc_core::sc_time_stamp() + CAS ;
	    end_of_burst=sc_core::sc_time_stamp() + CAS + 4*cycle_length;
	    cout << sc_core::sc_time_stamp() << " READ issued " << endl;
	    num_read--;
   	  }
	  data_sent+=2;
          last_address=address;
	  address+=1;
          cout << sc_core::sc_time_stamp() << " @ 0x" << hex << last_address << " " << "unhandled burst read" << dec << i+1 << "     " << data_sent << " bytes data sent" << endl;
	  wait(cycle_length/2); 
        }
        break;
      }
      case WRITE:
      {
        cout  << sc_core::sc_time_stamp() << " WRITE issued" << endl; 
        break;
      } 
      case PRECHARGE:
      {
        cout  << sc_core::sc_time_stamp() << " PRECHARGE issued" << endl; 
        break;
      } 
      case ACTIVE:
      {
	if (last_subcommand==PRECHARGE){
	  cout <<  sc_core::sc_time_stamp() << " RP Delay..." << endl;
	  wait(RP);
	}
        cout  << sc_core::sc_time_stamp() << " ACTIVE issued" << endl; 
        break;
      } 
      default:
      {
        cout  << sc_core::sc_time_stamp() << " ERROR Command " << subcommand << " not recognized" << endl;
        break;
      } 
    }
      last_subcommand=subcommand;
      chopboard.pop();
    }


  cout  << sc_core::sc_time_stamp() << " The last_subcommand is " << subcommandsetstr[subcommand] << "; the last address is " << hex << last_address << endl;
    //cout << "translatoring...2 size is " << chopboard.size() << " front is " << last_subcommand << " which means " << subcommandsetstr[(int)last_subcommand]<< " hula" << endl;
  }
    
  return;
}

