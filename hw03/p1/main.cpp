//main
#include "CPU.h"
#include <list>

using namespace std;
class UART : public sc_module, read_master_if<char>
{
public:
  sc_export<read_master_if<char> > in;
  sc_event read_event, write_event;
  list<char> fifo;
   

  SC_HAS_PROCESS(UART);

  UART(sc_module_name name) : sc_module(name)  {
    SC_THREAD(main);
    in.bind(*this);

  }

  void read( int addr, char& data){
   // char c;
   cout << sc_time_stamp().to_string();
     if (addr==0){
	if (fifo.size()==0){
          data=0; 
          cout << " return 0" <<endl;
	}
	else {
	  data=1;
          cout << " return 1" <<endl;
	}
     }
     else if (addr==1){
	data=fifo.front();
	fifo.pop_front();
        cout << " return data " << data <<endl;
     }
  }

  void main() {
   // char c;
    const char *str = "Hello, World!";
    const char *p = str;
    char c;
    while (true) {
        if (!*p) 
	  p=str;
	c=*p;
	fifo.push_back(*p++);

	cout << sc_time_stamp().to_string() << " UART writing " <<  c << " from 'Hello, World!' " << " " << endl;
    /*  if (rand()%3<2) {  // 2-in-3 chance of executing
        cout << sc_time_stamp().to_string() << " (";// << fifo.size();
        cout << " available) consumer reading from fifo\n" ;
         // wait(write_event);
        cout << sc_time_stamp().to_string() << " (";// << fifo.size() ;
        cout << " available) consumer read " << c << " from fifo\n";
      }*/

      wait(100, SC_NS);

    }
  }
};


class top : public sc_module
{
public:
  UART uart_inst;
  CPU cpu_inst;      

  top(sc_module_name name) :
    sc_module(name),
    uart_inst("UART1"),
    cpu_inst("CPUONE")        
  {
    cpu_inst.master(uart_inst.in);
   //cout << "Helloo" << endl;
  }
};

int sc_main(int i, char* argv[])
{
	top top1("Top1");	
	sc_start(1000,SC_NS);
	cout << endl << endl; 
        return 0;

}
