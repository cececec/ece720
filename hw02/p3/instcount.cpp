
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


    while (f.good()) {
      getline(f,line);
      pos=line.find(' ');
      first = line.substr(0,pos);
      second = line.substr(pos+1);
      //cout << "\"" << first << "\"" << endl;
      //cout << "\"" << second << "\"" << endl;
      if (first == "module") {
        current_module = second;
        mods[current_module]=new module(current_module);
        //cout << "module " << second << endl;
      }
      else if (second != "") {
        mods[current_module]->addInstance(first);
      }

    }
    f.close();

    

    map<string,module*>::iterator it;
    for (it=mods.begin(); it != mods.end(); it++) {
      cout << "module " << it->second->name << endl;
      it->second->print();
      }

    return 0;
}
