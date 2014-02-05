/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#ifndef __TOP_H__
#define __TOP_H__

#include <tlm.h>
#include "mem.h"
#include "stub.h"
#include "SimpleBusLT.h"

class top : public sc_core::sc_module
{
public:
	
  top (sc_core::sc_module_name name); 

  private:

  SimpleBusLT<2, 2> bus;
  mem mem0;
  mem mem1;
  stub stub0;
  stub stub1;
};

#endif /* __TOP_H__ */
