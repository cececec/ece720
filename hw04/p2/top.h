/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#ifndef __TOP_H__
#define __TOP_H__

#include <tlm.h>
#include "CPU.h"
#include "UART.h"
#include "SimpleBusLT.h"

class top : public sc_core::sc_module
{
public:
	
  top (sc_core::sc_module_name name); 

  private:

  SimpleBusLT<1, 1> bus;
  CPU cpu0;
  UART uart0;
};

#endif /* __TOP_H__ */
