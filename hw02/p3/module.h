#pragma once
#include <vector>
#include <string>

using namespace std;

class module {
public:
    string name;
    vector<string> instances;
    module (string n) { name = n; }
    void addInstance(string modname) { instances.push_back(modname); }
    void print();
};
