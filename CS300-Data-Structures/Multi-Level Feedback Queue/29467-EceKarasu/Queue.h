#ifndef QUEUE_H
#define QUEUE_H

#include <iostream>
#include <vector>
#include <string>
using namespace std;

struct Process{
    vector<string> vecInfo;
    int priority, infoLoc;
    string name;
    Process():priority(0){}
};

template <class Object>
class Queue{
    public:
        Queue(int, string);
        bool isEmpty() const;
        bool isFull() const;
        const Object & getFront() const;
        void makeEmpty();
        Object dequeue();
        void enqueue(const Object &);
        void removeFromQueue(Queue<Object> &s, const Process &, int);

    private:
        vector<Object> theArray;
        int currentSize;
        int front;
        int back;
        void increment(int &);
};

template <class Object>
Queue<Object>::Queue(int size, string name):theArray(size){  
    makeEmpty();
}

template <class Object>
void Queue<Object>::makeEmpty(){                        //makes the queue empty
    currentSize = 0;
    front = 0;
    back = -1;
}

template <class Object>      
bool Queue<Object>::isEmpty() const{                    //checks if the queue is empty
    return currentSize == 0;
}

template <class Object>
bool Queue<Object>::isFull() const{                     //checks whether the queue is full
    return currentSize == theArray.size();
}

template <class Object>
const Object & Queue<Object>::getFront() const{         //returns the first enqueued element of the queue
    if(isEmpty())
        cout << "Queue is empty.\n";
    return theArray[front];
}

template <class Object>
Object Queue<Object>::dequeue(){                        //returns and removes the first enqueued element from the queue
    if(isEmpty())
        cout << "Queue is empty.\n";
    currentSize--;
    Object frontItem = theArray[front];
    increment(front);
    return frontItem;

}

template <class Object>
void Queue<Object>::enqueue(const Object & x){          //inserts x into the queue
    increment(back);
    theArray[back] = x;
    currentSize++;
}

template <class Object>
void Queue<Object>::increment(int & x){
    if(++x == theArray.size())
        x = 0;
}

template <class Object>
void removeFromQueue(Queue<Object> & q, const Process & toRemove, int num){      //removes toRemove from the queue
    Queue<Process> temp(num, "");
    while(!q.isEmpty()){
        Process p = q.getFront();
        if(p.name == toRemove.name){
            q.dequeue();
        }
        else{
            q.dequeue();
            temp.enqueue(p);
        }
    }
    q = temp;
}

#endif