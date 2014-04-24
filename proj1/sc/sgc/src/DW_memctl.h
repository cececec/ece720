/*****************************************************************************

The following code is derived, directly or indirectly, from the SystemC
source code Copyright (c) 1996-2008 by all Contributors.
All Rights reserved.

The contents of this file are subject to the restrictions and limitations
set forth in the SystemC Open Source License Version 3.0 (the "License");
You may not use this file except in compliance with such restrictions and
limitations. You may obtain instructions on how to receive a copy of the
License at http://www.systemc.org/. Software distributed by Contributors
under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF
ANY KIND, either express or implied. See the License for the specific
language governing rights and limitations under the License.

*****************************************************************************/
//dw.target_socket same as s.slave   
//dw.source_socket same as bus.master
#ifndef __DWMEMCTL_H__
#define __DWMEMCTL_H__
#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"
#include "tlm_utils/simple_initiator_socket.h"
#include<queue>

template <int NR_OF_INITIATORS, int NR_OF_TARGETS>
class DWmemctl : public sc_core::sc_module
{
public:
  typedef tlm::tlm_generic_payload transaction_type;
  typedef tlm::tlm_phase phase_type;
  typedef tlm::tlm_sync_enum sync_enum_type;
  typedef tlm_utils::simple_target_socket<DWmemctl> target_socket_type;//same as slave <mem>
  typedef tlm_utils::simple_initiator_socket_tagged<DWmemctl> initiator_socket_type;//same as master.initiator

public:
  target_socket_type  target_socket[NR_OF_INITIATORS];//same as mem.h -> slave
  initiator_socket_type initiator_socket[NR_OF_TARGETS];

public:
  //char *subcommandsetstr[]; //= {"NOP", "READ", "WRITE", "PRECHARGE", "ACTIVE"};
  enum subcommand_set {NOP=0, READ, WRITE, PRECHARGE, ACTIVE};
  enum subcommand_set subcommand;
  std::queue<subcommand_set> chopboard;
  std::queue<subcommand_set> showcase;
  enum subcommand_set last_subcommand;
  sc_dt::uint64  last_address;
  sc_core::sc_time dw_start_time;
  sc_core::sc_time cmd_time; 
  sc_core::sc_time CLK,INT,SRAM_INIT,CAS,RAS,RCD,RP,WR,RCAR,XSR,RC,XP,WTR,DQSS,MRD,SRAMREF,NUM_INIT_REF,AUTOREF;
  sc_core::sc_time sr_delay, dr_delay_rp,  dr_delay , db_delay, w_delay;// db_delay_w;
  sc_core::sc_time reset_time, begin_of_burst,end_of_burst;
  int rp_flag,rr,current_cycle;
  int a10,auto_pre,notactive[4];
  unsigned int actrow[4];
  //int rw,ww,wr,rws,rwd,rwdb,wwd,wws,wwdb,wrd,wrs,wrdb,rrd,rrs,rrdb;
 
public:
  unsigned int data_bit_width;
  unsigned int burst_length;
 
public:
  SC_HAS_PROCESS(DWmemctl);
  DWmemctl(sc_core::sc_module_name name) :
    sc_core::sc_module(name)
  {
    for (unsigned int i = 0; i < NR_OF_INITIATORS; ++i) {
      target_socket[i].register_b_transport(this, &DWmemctl::initiatorBTransport);
      target_socket[i].register_transport_dbg(this, &DWmemctl::transportDebug);
    }
    
    // Parameters set up
    last_subcommand = READ;
    last_address = 0x3ffff;
    data_bit_width=32;//bits
    sc_core::sc_time clock_cycle(10,sc_core::SC_NS);
    CLK=clock_cycle;
    //rwd=wwd=wrd=rrd=rws=wws=wrs=rrs=rwdb=wwdb=wrdb=rrdb=rw=ww=wr=0;
    rr=0;
    a10=auto_pre=0;
    for(int i=0;i<4;i++) {notactive[i]=actrow[i]=1;}
    //MRD(load mode register);INT(internal delay)
    WTR=CLK; INT=CAS=RCD=WR=DQSS=MRD=2*CLK;RP=AUTOREF=3*CLK;//RAS_MIN
    RAS=XP=5*CLK;RC=7*CLK;NUM_INIT_REF=SRAM_INIT=RCAR=8*CLK;reset_time=102*CLK;
    XSR =200*CLK;SRAMREF=1040*CLK;   
    sr_delay=CAS;//same row delay or //different bank delay and same active row
    dr_delay_rp=RCD+CAS;//different row delay when rp_flag=high
    dr_delay=RAS+RP+RCD;//different row delay 
    db_delay=RAS+RP;
    w_delay=WTR+CAS;
    //db_delay_w=RAS+RP+RCD; 
  }//Constructor 
  

  
  
void initiatorBTransport ( transaction_type &trans, sc_core::sc_time &t )//int SocketId, 
{
    initiator_socket_type* decodeSocket;
    decodeSocket = &initiator_socket[0];
    resetProc();
    unsigned int     length  = trans.get_data_length();
    tlm::tlm_command command = trans.get_command();
    sc_dt::uint64    address = trans.get_address();
    dw_start_time = sc_core::sc_time_stamp();
    
    sc_dt::uint64 this_bank, this_row;
    sc_dt::uint64 last_bank, last_row;
    this_bank = getBankNum(address);
    this_row  = getRowNum (address);
    last_bank = getBankNum(last_address);
    last_row  = getRowNum (last_address);
        
 
#ifndef USE_STUB   
//Auto_Refresh every 1040 cycles
    //Model fifo; When burst, if previous a10 is low and this bank is active, then no need to wait
    wait(INT);
    current_cycle=(sc_core::sc_time_stamp().value()/10000);
    if( current_cycle > rr ) { 
      rr=current_cycle+1040;   
      a10++; 
      auto_pre=1; 
      if (a10<130) 
      AUTOREF+=INT;       
      wait(AUTOREF);
    } 
    else auto_pre=0;	
 #endif   
    

     
    if (notactive[this_bank]) { wait(RP); notactive[this_bank]=0; actrow[this_bank]=0; rp_flag=1;} 
    else rp_flag=0;//check every time see if precharge->active operation is done or not

 
    cmd_time=sc_core::SC_ZERO_TIME;  
    if (command == tlm::TLM_READ_COMMAND){             // ACTIVE to COMMAND to data_shown
       switch (last_subcommand){
         case READ:                       			  //Rd -> Rd
         {
           if(last_bank==this_bank){            					       //same bank
             if(actrow[this_bank]!=this_row) {cmd_time = rp_flag ? dr_delay_rp : dr_delay;}    //rrd++;  //different row
             else { cmd_time=(sr_delay);}//rrs++;//same row
           }
           else { if((actrow[this_bank]==this_row)) cmd_time=sr_delay; else cmd_time=(db_delay);}//rrdb++;    //different bank
           break;
         }
         case WRITE:                        			  //Wr -> Rd
         {
           if(last_bank==this_bank){          				 		 //same bank
             if(actrow[this_bank]!=this_row){ cmd_time = rp_flag ? dr_delay_rp : dr_delay;} //wrd++;//different row  
             else { cmd_time=(WTR+sr_delay);} //wrs++;//same row
           }                                 
           else { if((actrow[this_bank]==this_row))  cmd_time=WTR+sr_delay; else cmd_time=(db_delay);} // wrdb++;//different bank
           last_subcommand=READ;                   				 	
           break;
         }
         default:{ cmd_time=(dr_delay);}      
       }
    }
    else if (command == tlm::TLM_WRITE_COMMAND){ //Rd -> Wr or Wr -> Wr ;  Basicly same delay for both senarios      
           if(last_bank==this_bank){             					 //same bank
             if(actrow[this_bank]!=this_row){cmd_time=rp_flag? dr_delay_rp: dr_delay; }  //rwd++;//different row       	
             else { cmd_time=(sr_delay);}//rws++;//same row 
           }
           else { if((actrow[this_bank]==this_row))  cmd_time=sr_delay; else cmd_time=(dr_delay);}// rwdb++;} //different bank
           last_subcommand=WRITE;                   
    }
    else  std::cout << "ERROR Command" << std::endl;
      
    wait(cmd_time);
    actrow[this_bank]= this_row;
        
    if (length>(data_bit_width/8)){ //4
      burst_length= length/4;
      #ifndef USE_STUB
        trans.set_data_length(4);//data_bit_width/8
         for (unsigned int i=0; i<burst_length;i++){           //Regarding bugs in Cortex 
      #else
        (*decodeSocket)->b_transport(trans, t);   
         if (this_row!= getRowNum(address+(length<<1)) ) {    //cross row bountry
         wait(dr_delay+CAS);
      }
         for (unsigned int i=1; i<burst_length;i++){           //Regarding bugs in Cortex 
      #endif   
        #ifndef USE_STUB
          (*decodeSocket)->b_transport(trans, t);      
        #else 
          wait(CLK);
        #endif
        if(trans.get_command() == tlm::TLM_READ_COMMAND) {last_subcommand=READ;}
        else { last_subcommand=WRITE; }   

        //std::cout << sc_core::sc_time_stamp() << " unhandled SEQUENTIAL transaction" << std::endl;
        trans.set_data_ptr(trans.get_data_ptr()+4);
        trans.set_address(trans.get_address()+4);                  
      }
    }//Burst
    else{
      (*decodeSocket)->b_transport(trans, t);
    }//Non-Burst
   
   
   
       
    if(auto_pre){ // A10 is high
      if(command == tlm::TLM_WRITE_COMMAND){ 
        wait(WR);  
      }
      if((sc_core::sc_time_stamp()-dw_start_time) < RAS)
        wait (RAS+dw_start_time-sc_core::sc_time_stamp());
      for(int i=0;i<4;i++) notactive[i]=1;
    }
  
    last_address=address;
}//b_transport



void scheduler( transaction_type &gp ) {
  sc_dt::uint64 address; 
  unsigned long length; 
  int numofread;
 
 }//scheduler
 
 
  sc_dt::uint64 getAddressOffset(unsigned int portId)
  {
    return portId << 28;
  }

  sc_dt::uint64 getColNum (sc_dt::uint64 address){ return (address >> 1 ) & (0xfff ); } //page80 of DW_memctl_spec
  sc_dt::uint64 getBankNum(sc_dt::uint64 address){ return (address >> 13) & ( 0x3  ); } 
  sc_dt::uint64 getRowNum (sc_dt::uint64 address){ return (address >> 15) & (0x1fff); }
  
void resetProc(){
 if (sc_core::sc_time_stamp()==sc_core::SC_ZERO_TIME){
    sc_core::wait(1005,sc_core::SC_NS);
    std::cout << sc_core::sc_time_stamp() << ": Memory Controller leaving startup..." << std::endl;
    sc_core::wait(CLK);
    std::cout << sc_core::sc_time_stamp() << ": Simulation leaving reset" << std::endl;
    #ifndef USE_STUB
      wait((RP+MRD+XSR+SRAM_INIT)-reset_time);//Simulate Power-on Command Sequence(page 68) 
    #else
      wait((SRAM_INIT+RP+MRD+MRD+RP+RCAR+MRD+SRAMREF+36*CLK)-reset_time);
    #endif 
    rr=sc_core::sc_time_stamp().value()/10000;//cycly number
  }
 
}//reset
  
unsigned int transportDebug(transaction_type& trans)  { 
    initiator_socket_type* decodeSocket = &initiator_socket[0];    
    return (*decodeSocket)->transport_dbg(trans); 
}

};
#endif
