/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "top.h"
top::top(sc_core::sc_module_name name)
  : sc_core::sc_module(name)
  , bus("bus")
  , cpu0("cpu0")
  , uart0("uart0")

{
  cpu0.master(bus.target_socket[0]);
  bus.initiator_socket[0](uart0.slave);
}
