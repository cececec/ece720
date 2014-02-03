/*************************************************

SystemC Transaction Level Modeling Tutorial
(c) 2/3/2013 W. Rhett Davis (rhett_davis@ncsu.edu)

**************************************************/

#include "top.h"
#include <tlm.h>

int sc_main (int argc,char  *argv[])
{
  top top("top");
  sc_core::sc_start();
  return 0;
}
