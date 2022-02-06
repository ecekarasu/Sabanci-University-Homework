#include <iostream>
#include <fstream>

using namespace std;

int main(){
    ifstream input("compout");
    ofstream output("decompout");

    int size = 4096, idx = 256;
    string arr[size];
    for(int i = 0; i < idx; i++)
        arr[i] = i;                                         //to store i-th single character string into i-th index

    int code;
    string codeInStr, tmp;
    input >> code;                                          
    codeInStr = arr[code];
    output << codeInStr;                                    //first one will always be a single character string

    while(input >> code){                                   //while there is some code to read
        if(arr[code] == ""){                                //if does not exist in my array
            arr[idx++] = codeInStr + codeInStr[0];          //to add the new string to the array and increment idx by 1 
            codeInStr = arr[code];
        }
        else{
            tmp = codeInStr;
            codeInStr = arr[code];
            arr[idx++] = tmp + codeInStr[0];                //to add the new string to the array and increment idx by 1
        }
        output << codeInStr;
    }
    input.close();
    output.close();
    return 0;
}