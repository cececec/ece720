// read_master_if.h
// Simple blocking interface for a bus master, with read-operations only

#pragma once

template <class T>
class read_master_if
: virtual public sc_interface
{
public:
  virtual void read( int addr, T& data) = 0;
};

