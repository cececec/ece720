/*************************************************
ECE 720 - Electronic System Level & Physical Design
LT Memory Model
(c) 2012-2014 By W. Rhett Davis
**************************************************/

#ifndef __MEM_H__ 
#define __MEM_H__

#include "tlm.h"
#include "tlm_utils/simple_target_socket.h"

class addr_log
{
  sc_dt::uint64 m_read_count;
  sc_dt::uint64 m_write_count;
  sc_dt::uint64 m_min_addr;
  sc_dt::uint64 m_max_addr;  
  sc_dt::uint64 m_start_addr;
  sc_dt::uint64 m_end_addr;  

  public:
  addr_log(sc_dt::uint64 start, sc_dt::uint64 end) { 
    m_start_addr=start;
    m_end_addr=end;  
    m_read_count=0;
    m_write_count=0;
    m_max_addr=start;
    m_min_addr=end;
  }

  ~addr_log() {
    std::cout << "STATISTICS for addr range 0x" << std::hex << m_start_addr << " to 0x" 
         << m_end_addr << std::dec << std::endl;
    std::cout << "Number of Blocking Reads:  " << m_read_count << std::endl;
    std::cout << "Number of Blocking Writes: " << m_write_count << std::endl;
    std::cout << "Minimum address accessed:  ";
    if (m_min_addr==m_end_addr)
      std::cout << "n/a" << std::endl;
    else
      std::cout << "0x" << std::hex << m_min_addr << std::dec << std::endl; 
    std::cout << "Maximum address accessed:  ";
    if (m_max_addr==m_start_addr)
      std::cout << "n/a" << std::endl;
    else
      std::cout << "0x" << std::hex << m_max_addr << std::dec << std::endl; 
  }

  void log(sc_dt::uint64 addr, bool write) {
    if ( (addr >= m_start_addr) && (addr < m_end_addr) ) {
      if (write)
        m_write_count++;
      else 
        m_read_count++;
      if (addr > m_max_addr)
        m_max_addr = addr;
      if (addr < m_min_addr)
        m_min_addr = addr;
    }
  }

}; //class addr_log


class mem: public sc_core::sc_module
//, virtual public tlm::tlm_fw_transport_if<>
{
  public:  

  mem( sc_core::sc_module_name module_name,
       sc_dt::uint64  memory_size  // memory size (bytes)
      );

  tlm_utils::simple_target_socket<mem,64,tlm::tlm_base_protocol_types>  slave;
 
  private:
	    
  sc_dt::uint64 m_memory_size;

  unsigned char *m_array;

  //tlm::tlm_sync_enum nb_transport_fw
  //( tlm::tlm_generic_payload &gp, tlm::tlm_phase &phase, sc_core::sc_time &delay_time );

  //bool get_direct_mem_ptr                       
  //( tlm::tlm_generic_payload &gp, tlm::tlm_dmi &dmi_data );

  void custom_b_transport
  ( tlm::tlm_generic_payload &gp, sc_core::sc_time &delay );

  unsigned int custom_transport_dbg( tlm::tlm_generic_payload  &gp);

  addr_log upper, middle, lower;

};


#endif /* __MEM_H__ */
