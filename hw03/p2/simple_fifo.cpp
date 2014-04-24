// Simple FIFO example
// (c) 2/2/2007 W. Rhett Davis (rhett_davis@ncsu.edu)
// Modified slightly from the example in System design with SystemC,
// by T. Groetker, S. Liao, G. Martin, and S. Swan, Kluwer, 2002.

#include <systemc.h>
#include <list>

using namespace std;

 
class producer : public sc_module, sc_fifo_in_if<char>
{
public:
  sc_port<sc_fifo_in_if<char> > out;
  sc_event read_event, write_event;
  list<char> fifo;
  int fifo_max;

  SC_HAS_PROCESS(producer);
 
  producer(sc_module_name name, int size) : sc_module(name) {
    SC_THREAD(main);
    out.bind(*this);
    fifo_max = size;
  }

  bool nb_read(char&) { return true; } //Notimplemented
 // bool sc_fifo_blocking_in_if(const char &c) {return true;} //Not implemented
  const sc_event &data_written_event() const { return read_event; }
  int num_available() const { return fifo.size();}

  void read(char &c){
      while( num_available() == 0 ){
	wait ( write_event );
      }
      c=fifo.front();
      fifo.pop_front();
      read_event.notify(SC_ZERO_TIME);
  }

  char read(){}
  void main () {
    const char *str = "Hello, World!\n";
    const char *p = str;

    while (true) {
      if (rand()%3==0) {  // 1-in-3 chance of executing
        cout << sc_time_stamp().to_string() << " (" <<(fifo_max-fifo.size());
        cout << " free) producer writing " << *p << " to fifo\n";
        if (fifo_max-fifo.size() == 0)
	  wait ( read_event);
        fifo.push_back(*p++);
	write_event.notify(SC_ZERO_TIME);
        cout << sc_time_stamp().to_string() << " (" << (fifo_max-fifo.size()) ;
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
  producer prod_inst;
  consumer cons_inst;

  top(sc_module_name name, int size) : 
    sc_module(name),
    prod_inst("Producer1", size),
    cons_inst("Consumer1")
  {
    cons_inst.in(prod_inst.out);
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
