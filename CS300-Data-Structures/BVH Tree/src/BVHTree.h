#include "AABB.h"
#include "BVHTreeNode.h"
#include <vector>
#include <iostream>
#include <unordered_map>
#ifndef _BVH_TREE
#define _BVH_TREE

class BVHTree {
private:
	BVHTreeNode *root;
	void printTree(BVHTreeNode* node);
	std::unordered_map<std::string, BVHTreeNode *> map;
	void makeEmpty(BVHTreeNode* t);                                                

	public:
	BVHTree();                                                                             
	~BVHTree();                                                                            
	void makeEmpty( );                				                    				   
	void printNode(std::ostream &out, BVHTreeNode *, int level);
	void addBVHMember(AABB objectArea, std::string name);                                  
	void moveBVHMember(std::string name, AABB newLocation);                                
	BVHTreeNode* findNode(BVHTreeNode* node, std::string name);                            
	void removeBVHMember(std::string name);                                                
	std::vector<std::string> traverseTree(BVHTreeNode* node, AABB object, std::vector<std::string> & vec);     
	std::vector<std::string> getCollidingObjects(AABB object);             	                                             
	friend std::ostream &operator<<(std::ostream &out, BVHTree &tree);
	void printTree();

};

#endif