
#include <systemc.h>
#include "reader.h"
//#include "reader.cpp"
using namespace std;

int sc_main(int argc, char* argv[])
{

  reader r("README.txt");
  r.reversePrint();
  return 0;
}
