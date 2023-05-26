#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include "Graph.h"

using namespace std;

//reads the file and creates a vector of string vectors to hold the words acc to their lengths 
void createVec(ifstream & input_file, vector<vector<string> > & vec, int & count){
    string word;
    vector<string> dummy;
    vec.push_back(dummy);
    while(input_file >> word){
        count++;
        int len = word.length();
        if(vec.size() <= len){
            int size = vec.size();
            for(int i = 0; i < len - size + 1; i++)
                vec.push_back(dummy);                          
        }
        vec[len].push_back(word);
    }
}

//checks if the string w of length l exists in the vector of string vectors
bool isExistInVec(vector<vector<string> > v, string w, int l){
    if(v.size() < l) return false;
    for(int i = 0; i < v[l].size(); i++)
        if(v[l][i] == w) return true;
    return false;
}

//prints the vector of string vectors
void printVec(vector<vector<string> > v){
    for(int j = 0; j < v.size(); j++){
        cout << "len = " << j << endl;
        for(int k = 0; k < v[j].size(); k++){
            cout << "word is " << v[j][k] << endl;
        }
        cout << "-------\n";
    }
}

//checks if a and b can convert to each other by 1 character substitution, 1 character insertion or 1 character deletion
bool isDifferenceOne(string a, string b){
    int len_a = a.length();
    int len_b = b.length(); 
    //checks if the number of substitutions is 1                         
    if(len_a == len_b){ 
        int count = 0;
        for(int i = 0; i < len_a; i++)
            if(a[i] != b[i]) count++;
        return count == 1;
    }
    //checks if the number of insertions is 1
    else if(len_a < len_b){ 
        int index_a = 0, index_b = 0;
        int flag = 2;
        while(flag){
            if(a[index_a] == b[index_b]){
                index_a++;
                index_b++;
                if((index_a == len_a) && (index_b+1 == len_b)) return true;
                if((index_a == len_a) && (index_b == len_b)) return true;
            }
            else{
                flag--;
                index_b++;
            }
        }
        return false;
    }
    //checks if the number of deletions is 1
    else{ 
        int index_a = 0, index_b = 0;
        int flag = 2;
        while(flag){
            if(a[index_a] == b[index_b]){
                index_a++;
                index_b++;
                if((index_a+1 == len_a) && (index_b == len_b)) return true;
                if((index_a == len_a) && (index_b == len_b)) return true;
            }else{
                flag--;
                index_a++;
            }
        }
        return false;
    }
}

//checks if string s exists in the vector of strings
bool isExistInVecForNodes(vector<string> vec_for_nodes, string s){
    for(int i = 0; i < vec_for_nodes.size(); i++){
        if(vec_for_nodes[i] == s) return true;
    }
    return false;
}

//finds out the difference between a and b and prints the propriate message 
void findTransformation(string a, string b){ 
    int len_a = a.length();
    int len_b = b.length(); 
    //case of 1 character substitution                         
    if(len_a == len_b){
        for(int i = 0; i < len_a; i++)
            if(a[i] != b[i])
                cout << b << " (change " << a[i] << " at position " << i+1 << " to " << b[i] << ")\n";
    }
    //case of 1 character insertion
    else if(len_a < len_b){
        int index_a = 0, index_b = 0;
        bool flag = false;
        while(!flag){
            if(index_a != len_a){          
                if(a[index_a] == b[index_b]){       
                    index_a++;
                    index_b++;
                }
                else{
                    flag = true;
                    cout << b << " (insert " << b[index_b] << " after position " << index_a << ")\n";
                }
            }
            else{
                flag = true;
                cout << b << " (insert " << b[index_b] << " after position " << index_a << ")\n";
            }
        }
    }
    //case of 1 character deletion
    else{
        int index_a = 0, index_b = 0;  
        bool flag = false;
        while(!flag){
            if(index_b != len_b){
                if(a[index_a] == b[index_b]){       
                    index_a++;
                    index_b++;
                }
                else{
                    flag = true;
                    cout << b << " (delete " << a[index_a] << " at position " << index_a+1 << ")\n";
                }
            }
            else{
                flag = true;
                cout << b << " (delete " << a[index_a] << " at position " << index_a+1 << ")\n";
            }
        }
    }
}

vector<string> pathfromInputToGoal(Graph & g, string input_word, string goal_word, vector<vector<string> > vec){
    vector<string> vec_for_nodes;          //holds the strings
    vector<vector<string> > vec_for_paths; //holds the paths of the strings
    vector<string> input_path;
    input_path.push_back("");
    vec_for_nodes.push_back(input_word);
    vec_for_paths.push_back(input_path);

    bool isFound = false;
    for(int i = 0; i < vec_for_nodes.size(); i++){ //initially there is only the input_word
        int curr_len = vec_for_nodes[i].length();
        string curr_name = vec_for_nodes[i];
 
        //handles the strings in the (curr_len - 1)th index
        if(curr_len != 0){
            for(int j = 0; j < vec[curr_len-1].size(); j++){
                if((isDifferenceOne(curr_name, vec[curr_len-1][j])) && (!isExistInVecForNodes(vec_for_nodes, vec[curr_len-1][j]))){
                    vec_for_nodes.push_back(vec[curr_len-1][j]);
                    vector<string> curr_path = vec_for_paths[i];
                    curr_path.push_back(curr_name);
                    vec_for_paths.push_back(curr_path); //u + curr_name in i + 1
                    g.addEdge(curr_name, vec[curr_len-1][j], vec_for_paths[i+1]);
                    if(vec[curr_len-1][j] == goal_word){ //if the path is found
                        isFound = true;
                        break;
                    }  
                }
            }
            if(isFound) break;
        }

        //handles the strings in the (curr_len)th index
        for(int j = 0; j < vec[curr_len].size(); j++){
            if((isDifferenceOne(curr_name, vec[curr_len][j])) && (!isExistInVecForNodes(vec_for_nodes, vec[curr_len][j]))){
                vec_for_nodes.push_back(vec[curr_len][j]);
                vector<string> curr_path = vec_for_paths[i];
                curr_path.push_back(curr_name);
                vec_for_paths.push_back(curr_path); //u + curr_name in i + 1               
                g.addEdge(curr_name, vec[curr_len][j], vec_for_paths[i+1]);
                if(vec[curr_len][j] == goal_word){ //if the path is found
                    isFound = true;
                    break;
                }  
            }
        }
        if(isFound) break;

        //handles the strings in the (curr_len + 1)th index
        if(curr_len != vec.size()){
            for(int j = 0; j < vec[curr_len+1].size(); j++){
                if((isDifferenceOne(curr_name, vec[curr_len+1][j])) && (!isExistInVecForNodes(vec_for_nodes, vec[curr_len+1][j]))){
                    vec_for_nodes.push_back(vec[curr_len+1][j]);
                    vector<string> curr_path = vec_for_paths[i];
                    curr_path.push_back(curr_name);
                    vec_for_paths.push_back(curr_path); //u + curr_name in i + 1
                    g.addEdge(curr_name, vec[curr_len+1][j], vec_for_paths[i+1]);
                    if(vec[curr_len+1][j] == goal_word){ //if the path is found
                        isFound = true;
                        break;
                    }  
                }
            }
            if(isFound) break;
        }
    }
    vector<string> final_path;
    if(isFound){
        final_path = vec_for_paths[vec_for_paths.size()-1];
        final_path.push_back(vec_for_nodes[vec_for_nodes.size()-1]);
    }
    else{
        cout << "No sequence of one letter transformations exists from " << input_word << " to " << goal_word << endl;
    }
    return final_path;
}

int main(){
    string filename = "words.txt";
    ifstream input_file;
    input_file.open(filename.c_str());
    vector<vector<string> > vec;
    int count = 0;
    createVec(input_file, vec, count);

    bool isFinished = false;
    while(!isFinished){
        string input_word, goal_word;
        cout << "Enter input word and goal word: ";
        cin >> input_word >> goal_word;
        if(input_word == goal_word){
            cout << "The words are the same!!!\n";
        }
        else{
            int len_input = input_word.length();
            int len_goal = goal_word.length();
            if(input_word[0] == '*') //if the program should terminate
                isFinished = true;
            else{
                string error_out = "";
                if(!isExistInVec(vec, input_word, len_input))
                    error_out += "Input word is not found!!!\n";
                if(!isExistInVec(vec, goal_word, len_goal))
                    error_out += "Goal word is not found!!!\n";
                if(error_out != "") 
                    cout << error_out;
                else{ //both words are in the vec
                    Graph g;
                    vector<string> path = pathfromInputToGoal(g, input_word, goal_word, vec);
                    for(int i = 1; i < path.size(); i++){
                        if(path[i] == input_word) cout << path[i] << endl;
                        else findTransformation(path[i-1], path[i]);
                    }
                }
            }
        }
    }
    return 0;
}