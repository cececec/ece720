// Simple FIFO example
// (c) 2/2/2007 W. Rhett Davis (rhett_davis@ncsu.edu)
// Modified slightly from the example in System design with SystemC,
// by T. Groetker, S. Liao, G. Martin, and S. Swan, Kluwer, 2002.

#include <systemc.h>

using namespace std;

class producer : public sc_module
{
public:
  sc_port<sc_fifo_out_if<char> > out;

  SC_HAS_PROCESS(producer);

  producer(sc_module_name name) : sc_module(name) {
    SC_THREAD(main);
  }

  void main () {
    const char *str = "Hello, World!\n";
    const char *p = str;

    while (true) {
      if (rand()%3==0) {  // 1-in-3 chance of executing
        cout << sc_time_stamp().to_string() << " (" << out->num_free() ;
        cout << " free) producer writing " << *p << " to fifo\n";
        out->write(*p++);
        cout << sc_time_stamp().to_string() << " (" << out->num_free() ;
        cout << " free) producer wrote to fifo\n";
        if (!*p) p=str;
      }

      wait(10, SC_NS);
    }
  }
};

class consumer : public sc_module
{
public:
  sc_port<sc_fifo_in_if<char> > in;
 
  SC_HAS_PROCESS(consumer);

  consumer(sc_module_name name) : sc_module(name) {
    SC_THREAD(main);
  }

  void main() {
    char c;

    while (true) {
      if (rand()%3<2) {  // 2-in-3 chance of executing
        cout << sc_time_stamp().to_string() << " (" << in ->num_available();
        cout << " available) consumer reading from fifo\n" ;
        in->read(c);
        cout << sc_time_stamp().to_string() << " (" << in->num_available() ;
        cout << " available) consumer read " << c << " from fifo\n";
      }

      wait(10, SC_NS);

    }
  }
};

class top : public sc_module
{
public:
  sc_fifo<char> fifo_inst;
  producer prod_inst;
  consumer cons_inst;

  top(sc_module_name name, int size) : 
    sc_module(name),
    fifo_inst("Fifo1",size),
    prod_inst("Producer1"),
    cons_inst("Consumer1")
  {
    prod_inst.out(fifo_inst);
    cons_inst.in(fifo_inst);
  }
};

int sc_main (int argc, char *argv[])
{
  int size=10;

  top top1("Top1",size);
  sc_start(100, SC_NS);
  cout << endl <<endl;
  return 0;
}
