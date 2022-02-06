#include <iostream>
#include <fstream>
#include <string>
#include "HashTable.h"
#include "strutils.h"

using namespace std;

int main(){
    ifstream input("compin");
    ofstream output("compout");

    string ITEM_NOT_FOUND = "";
    HashTable<string> ht(ITEM_NOT_FOUND, 4096);
    int idx = 256;
    char ch;
    string s;
    input.get(ch);
    s = ch;
    while(input.get(ch)){                                   //while there is some ch to read
        if(ht.find(s+ch) != ITEM_NOT_FOUND){                //true if s+ch is in the hash table
            s = s+ch;
        }
        else{
            if(s.length() == 1)                             //true if s is a single character string
                output << itoa(int(s[0])) + " ";
            else
                output << itoa(ht.currentPos(s)) + " ";
            ht.insert(s+ch, idx++);
            s = ch;
        }
    }
    if(ht.find(s) != ITEM_NOT_FOUND){                       //for the last input
        output << itoa(ht.currentPos(s)) + " ";
    }
    else{
        output << itoa((int)s[s.length()-1]) + " ";
    }

    input.close();
    output.close();
    return 0;
}