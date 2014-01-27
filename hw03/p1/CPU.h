// CPU.h
// simple model of a CPU polling a UART for new data 
// through the read_master_if interface

#pragma once

#include <systemc.h>
#include "read_master_if.h"

class CPU : public sc_module
{
public:
  sc_port<read_master_if<char> > master;

  SC_HAS_PROCESS(CPU);

  CPU(sc_module_name name) : sc_module(name) {
    SC_THREAD(main);
  }

  void main () {
    char c;

    while (true) {
	  master->read(0,c);
	  std::cout << sc_time_stamp().to_string() << " CPU read " << (int)c << " from address 0\n";
	  wait(20, SC_NS);
	  if (c) {
	    master->read(1,c);
	    std::cout << sc_time_stamp().to_string() << " CPU read " << c << " from address 1\n";
	    wait(20, SC_NS);
	  }
    }
  }
};


