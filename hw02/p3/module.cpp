
#include "module.h"
#include <iostream>
//typedef std::map<std::pair<int, int>, int> Dict;
void module::print() {
	vector<string>::iterator it;
	for (it=instances.begin(); it < instances.end(); it++)
          cout << *it << endl;
}

Dict module::count(Dict big_counters) { 
	
	vector<string>::iterator it;
	for (it=instances.begin(); it < instances.end(); it++) {
		if (big_counters[*it]==0)
		   big_counters[name]+=1;
       		 else
       		   big_counters[name]+=big_counters[*it];
        }
	
	//cout << "+++++++++" << big_counters[name] << "+++++++++" << endl;
	return big_counters;
}	

