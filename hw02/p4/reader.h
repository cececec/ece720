#pragma once
#include <string>
#include <vector>
#include <iostream>
#include <fstream>
using namespace std;

class reader {

public:
    
    string filename;
    ifstream f;
    vector<string> text;
    reader (string n);
    void reversePrint();
   // void print_(const int & i);
};
