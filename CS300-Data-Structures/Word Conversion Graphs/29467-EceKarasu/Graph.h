#ifndef GRAPH_H
#define GRAPH_H

#include <iostream>
#include <vector>

using namespace std;

struct GraphNode{
    string name;
    int id;
    vector<string> path;
    GraphNode(string n, int i, vector<string> p): name(n), path(p){}
};

class Graph{
    public:
        Graph();
        void addEdge(string u, string v, vector<string> path); //adds and edge between u and v, and makes them adjacent
        int findOrInsertNode(string s, vector<string> path);   //finds s or inserts s into nodes and returns its index
        void printGraph();                                     //prints the graph
        void insertToAdj(int index_u, int index_v);            //adds index_v into adjacents vector of index_u if it does not already exist
        bool isExistInAdj(int index_u, int index_v);           //checks if index_v is in the adjacents vector of index_u

    private:
        vector<vector<int> > adj; //to hold the adjacent nodes
        vector<GraphNode> nodes;  //to hold the nodes
};

Graph::Graph(){}

int Graph::findOrInsertNode(string s, vector<string> path){
    for(int i = 0; i < nodes.size(); i++)
        if(nodes[i].name == s) return i;
    if(nodes.size() != 0){
        GraphNode *temp = new GraphNode(s, nodes.size(), path);
        nodes.push_back(*temp);
    }
    else{
        vector<string> dummy;
        dummy.push_back("");
        GraphNode *temp = new GraphNode(s, nodes.size(), dummy);
        nodes.push_back(*temp);
    }
    vector<int> dummy2;
    adj.push_back(dummy2);

    return nodes.size()-1;
}

bool Graph::isExistInAdj(int index_u, int index_v){
    for(int i = 0; i < adj[index_u].size(); i++)
        if(adj[index_u][i] == index_v) return true;
    return false;   
}

void Graph::insertToAdj(int index_u, int index_v){
    if(!isExistInAdj(index_u,index_v)) adj[index_u].push_back(index_v);
    if(!isExistInAdj(index_v,index_u)) adj[index_v].push_back(index_u);
}

void Graph::addEdge(string u, string v, vector<string> path){
    int index_u = findOrInsertNode(u, path);
    int index_v = findOrInsertNode(v, path);
    insertToAdj(index_u, index_v);
}

void Graph::printGraph(){
    for (int v = 0; v < adj.size(); v++){
        cout << "v: " << nodes[v].name << " -> ";
        for (int i = 0; i < adj[v].size(); i++)
           cout << nodes[adj[v][i]].name << " ";
        cout << "\n";
    }
}

#endif