
#include "reader.h"

//#include <algorithm>
using namespace std;
reader::reader(string n) {
        filename=n;
        ifstream f(n.c_str());      
        string line, word;
        size_t pos,pos2;
        
        while (f.good()) {
        	getline(f,line);

        	pos2=-1;
        	//pos=line.find(' ');
        	while (line.find_last_of(' ')!=string::npos){
        		pos=line.find(' ');
        		word = line.substr(0,pos+1);
        		
        		text.push_back(word);
        		line=line.substr(pos+1);
        		//cout << word << endl;
        		        		 
        	}
        	text.push_back(line);
        	 
        	//cout << "hello reader.h ===>" << line <<endl;
        }
        
        f.close();


}


void reader::reversePrint() {
        //vector<int>::iterator it;
        //for ( it=text.begin();it!=text.end();it++)
          //            cout<<*it<<endl;
         // cout << "hello reader.cpp=============begin====" <<endl;
         cout<< text.size() <<endl;
          for ( int i=text.size()-2;i>=0;i--)
                       cout<<text[i]<<endl;
          cout << "hello reader.cpp=============begin or====" <<endl;        
          //for_each(text.begin(),text.end(),print_);
          //cout << "hello reader.cpp" <<endl;

}

