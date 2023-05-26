#include <iostream>
#include <string>
#include "Queue.h"
#include "strutils.h"
#include <fstream>
#include <vector>

using namespace std;

void removeFromVec(vector<Process> & vec, int pos){         //removes the element in the given pos from the vector
    vector <Process> temp; 
    int x = 0;
    if(vec.size() == 1){
        vec = temp;
    }
    else{
        while(x != pos){
            temp.push_back(vec[x]);
            x++;
        }   
        x++;                                                //to skip the element in pos
        while(x != vec.size()){
            temp.push_back(vec[x]);
            x++;
        }  
    }
    vec = temp; 
}

int main(){

    string foldername;
    cout << "Please enter the process folder name: ";
    cin >> foldername;
    cout << "When all processes are completed, you can find execution sequence in \"" << foldername << "/output.txt\"." << endl;
    string filename = foldername + "/configuration.txt";
    ofstream output;
    output.open(foldername + "/output.txt");
    ifstream input;
    int numQueues, numProcesses, S;
    input.open(filename.c_str());
    input >> numQueues >> numProcesses >> S;

    vector<Queue<Process> > vecQueues;                      //to store queues
    for(int i = 1; i <= numQueues; i++){
        Queue<Process> Q(numProcesses, "Q" + itoa(i));
        vecQueues.push_back(Q);
    }

    vector<Process> vecProcesses;                           //to store processes
    for(int i = 1; i <= numProcesses; i++){
        Process P;
        P.priority = vecQueues.size();
        P.name = "PC" + itoa(i);
        P.infoLoc = 0;
        string filename1 = foldername + "/p" + itoa(i) + ".txt";
        ifstream input1;
        string info;
        input1.open(filename1.c_str());
        while(input1 >> info){
            P.vecInfo.push_back(info);                     
        }
        vecQueues[vecQueues.size()-1].enqueue(P);           //to put all processes into the topmost queue
        vecProcesses.push_back(P);
        input1.close();
    }

    int loc = 0;                                            //to keep track of the location in the vecProcesses
    int countP = numProcesses;                              
    while(countP > 0){                                      //while there is at least 1 queue in the structure
        int iter = 0;
        while(iter < S){
            if(vecProcesses[loc].vecInfo[vecProcesses[loc].infoLoc] == "1" && vecProcesses[loc].vecInfo[vecProcesses[loc].infoLoc + 1] != "-"){
                removeFromQueue(vecQueues[vecProcesses[loc].priority-1], vecProcesses[loc], numProcesses);
                vecQueues[vecProcesses[loc].priority-2].enqueue(vecProcesses[loc]);
                vecProcesses[loc].priority--; 
                output << "1, " << vecProcesses[loc].name << ", " <<  "Q" + itoa(vecProcesses[loc].priority) << endl;
                vecProcesses[loc].infoLoc++;
            }
            else if(vecProcesses[loc].vecInfo[vecProcesses[loc].infoLoc] == "0" && vecProcesses[loc].vecInfo[vecProcesses[loc].infoLoc + 1] != "-"){
                output << "0, " << vecProcesses[loc].name << ", " <<  "Q" + itoa(vecProcesses[loc].priority) << endl;
                vecProcesses[loc].infoLoc++;
            }

            else{
                countP--;
                if(countP == 0){
                    output << "E, " << vecProcesses[loc].name << ", " << "QX";
                }
                else{
                    output << "E, " << vecProcesses[loc].name << ", " << "QX" << endl;
                }
                removeFromQueue(vecQueues[vecProcesses[loc].priority-1], vecProcesses[loc], numProcesses);
                removeFromVec(vecProcesses, loc);
                if(vecProcesses.size() == 0){
                    break;
                }
                loc--;
            }
            loc++;
            iter++;
            if(loc == vecProcesses.size()){
                loc = 0;
            }
        }
        if(vecProcesses.size() == 0){
                continue;
        }
        for(int i = vecQueues.size()-2; 0 <= i; i--){
            while(!vecQueues[i].isEmpty()){
                if(vecProcesses[loc].priority != vecQueues.size()){
                    removeFromQueue(vecQueues[i], vecProcesses[loc], numProcesses);
                    vecQueues[vecQueues.size()-1].enqueue(vecProcesses[loc]);
                    vecProcesses[loc].priority = numQueues;
                    output << "B, " << vecProcesses[loc].name << ", " << "Q" + itoa(numQueues) << endl;
                }
                loc++;

                if(loc == vecProcesses.size())
                    loc = 0;
            }
        }
    }
    input.close();
    output.close();

    return 0;
}