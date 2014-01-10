
#include "module.h"
#include <iostream>

void module::print() {
	vector<string>::iterator it;
	for (it=instances.begin(); it < instances.end(); it++)
          cout << *it << endl;
}
