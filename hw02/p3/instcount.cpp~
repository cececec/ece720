
#include <systemc.h>
#include "module.h"
#include <map>

using namespace std;

int sc_main(int argc, char* argv[])
{

    map<string,module*> mods;
    string line,first,second,current_module;
    size_t pos;
    ifstream f("LMS_pipe.hier");
   // ifstream f("example.hier");

    map<string,module*>::iterator it;
    Dict counters;
    
    while (f.good()) {
      getline(f,line);
      pos=line.find(' ');
      first = line.substr(0,pos);
      second = line.substr(pos+1);
      //cout << "\"" << first << "\"" << endl;
      //cout << "\"" << second << "\"" << endl;
      if (first == "module") {
      	if (current_module != "")  counters=mods[current_module]->count(counters);
        current_module = second;
        mods[current_module]=new module(current_module);
       // cout << "module " << second << endl; 	      
	     
      }
      else if (second != "") {
        mods[current_module]->addInstance(first);
      }
     

    }
    f.close();



    counters=mods[current_module]->count(counters);  
   // cout << "module " << current_module << endl; 
    cout <<  counters[current_module]  << endl;
		   
		   
    Dict::iterator itc;
     for (itc=counters.begin(); itc != counters.end(); itc++) {
        // cout << "module " << itc->first << "=== " << itc->second << endl;      
     }
    
   
    return 0;
}
