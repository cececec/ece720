#pragma once
#include <vector>
#include <string>
#include <map>
using namespace std;
typedef std::map<string,int> Dict;

class module {
public:
    string name;
    vector<string> instances;
    module (string n) { name = n; }
    void addInstance(string modname) { instances.push_back(modname); }
    void print();
    Dict count(Dict big_counters);
};
