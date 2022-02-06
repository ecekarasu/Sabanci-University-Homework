#ifndef HASHTABLE_H
#define HASHTABLE_H

#include <iostream>
#include <vector>
using namespace std;

template <class HashedObj>
class HashTable{
    public:
        explicit HashTable(const HashedObj & notFound, int size);
        HashTable(const HashTable & rhs): ITEM_NOT_FOUND(rhs.ITEM_NOT_FOUND), array(rhs.array), currentSize(rhs.currentSize){}

        int hash(const HashedObj & x) const;
        const HashedObj & find(const HashedObj & x) const;
        const int currentPos(const HashedObj & x) const;

        void makeEmpty();
        void insert(const HashedObj & x, int i);
        void remove(const HashedObj & x);

        const HashTable & operator=(const HashTable & rhs); 

        enum EntryType {ACTIVE, EMPTY, DELETED};
    
    private:
        struct HashEntry{
            HashedObj element;
            EntryType info;
            int idx;

            HashEntry(const HashedObj & e = HashedObj(), EntryType i = EMPTY, int idx = -1): element(e), info(i), idx(idx){}
        };
        
        vector<HashEntry> array;
        int currentSize;
        const HashedObj ITEM_NOT_FOUND;

        bool isActive(int currentPos) const;
        int findPos(const HashedObj & x) const;
};

//makes the hash table logically empty
template <class HashedObj>
void HashTable<HashedObj>::makeEmpty()
{
    for( int i = 0; i < array.size(); i++)
        array[i] = HashEntry(ITEM_NOT_FOUND, EMPTY, -1); 
}

//constuctor
template <class HashedObj>
HashTable<HashedObj>::HashTable(const HashedObj & notFound, int size): ITEM_NOT_FOUND(notFound), array(size){
    makeEmpty();
}

//maps strings to the summation of its characters' ascii codes
template <class HashedObj>
int HashTable<HashedObj>::hash(const HashedObj & x) const{ 
    int sum = 256;
    for(int i = 0; i < x.length(); i++)
        sum += int(x[i]);
    return sum % array.size();
}

//performs linear probing resolution and returns the position where the search for x terminates
template <class HashedObj>
int HashTable<HashedObj>::findPos(const HashedObj & x) const{
    int p = hash(x);                                                    //current position
    while(array[p].info != EMPTY && array[p].element != x){
        p++;                                                            //increase position by 1
        if(p >= array.size())                                           //perform the mod
            p -= array.size();                                   
    }
    return p;
}

//returns true if currentPos exists and is active
template <class HashedObj>
bool HashTable<HashedObj>::isActive(int currentPos) const{
    return array[currentPos].info == ACTIVE;
}

//removes x from the hash table
template <class HashedObj>
void HashTable<HashedObj>::remove(const HashedObj & x){
    int currentPos = findPos(x);
    if( isActive(currentPos))
        array[currentPos].info = DELETED;
}

//returns x if x is in the hash table, ITEM_NOT_FOUND otherwise
template <class HashedObj>
const HashedObj & HashTable<HashedObj>::find(const HashedObj & x) const{
    int currentPos = findPos(x);
    if (isActive(currentPos)) 
        return array[currentPos].element; 
    return ITEM_NOT_FOUND;
}

//returns the position of x if x is in the hash table, -1 otherwise
template <class HashedObj>
const int HashTable<HashedObj>::currentPos(const HashedObj & x) const{
    int currentPos = findPos(x);
    if (isActive(currentPos)) 
        return array[currentPos].idx; 
    return -1;
}

//inserts x into the i-th position of the hash table if x is not in the hash table, does nothing otherwise
template <class HashedObj>
void HashTable<HashedObj>::insert(const HashedObj & x, int i){
    int currentPos = findPos(x);
    if(isActive(currentPos))
        return;
    array[currentPos] = HashEntry(x, ACTIVE, i);
}

#endif


          