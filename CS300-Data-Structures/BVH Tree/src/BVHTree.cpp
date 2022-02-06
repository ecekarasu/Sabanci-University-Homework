#include "BVHTree.h"

BVHTree::BVHTree(){
	root = nullptr;
}

void BVHTree::makeEmpty(BVHTreeNode* t){
	if (t != nullptr){
		makeEmpty(t->leftChild);
		makeEmpty(t->rightChild);
		map.erase(t->name);
		delete t;
	}
	t = nullptr;
}

void BVHTree::makeEmpty(){
	makeEmpty(root);
}

BVHTree::~BVHTree(){
	makeEmpty();
}

void BVHTree::printNode(std::ostream &out, BVHTreeNode *node, int level) {
	if (root == nullptr) return;
	for (int i = 0; i < level; i++) {
		out << "  ";
	}
	if (!node->isLeaf) {
		out << "+ branch || ";
		node->aabb.printAABB(out);
		out << std::endl;
		printNode(out, node->rightChild, level + 1);
		printNode(out, node->leftChild, level + 1);
	}
	else {
		out << "- ";
		if (node->parent) {
			if (node->parent->rightChild == node)
				out << "R ";
			else
				out << "L ";
		}
		out << "- leaf: " << node->name << " || ";
		node->aabb.printAABB(out);
		out << std::endl;
	}
}

void setArea(BVHTreeNode* node1, BVHTreeNode* node2, BVHTreeNode* node3){  //updates the area of the branch node
	(node1->aabb).minX = AABB::getMin((node2->aabb).minX, ((node3)->aabb).minX);
	(node1->aabb).minY = AABB::getMin((node2->aabb).minY, ((node3)->aabb).minY);
	(node1->aabb).maxX = AABB::getMax((node2->aabb).maxX, ((node3)->aabb).maxX);
	(node1->aabb).maxY = AABB::getMax((node2->aabb).maxY, ((node3)->aabb).maxY);
}

void BVHTree::addBVHMember(AABB objectArea, std::string name){
	BVHTreeNode* newNode = new BVHTreeNode(objectArea, name, true);
	if(root == nullptr){  //the tree is empty  
		root = newNode;
	} 
	else if(root->leftChild == nullptr && root->rightChild == nullptr){  //there is one node in the tree
		BVHTreeNode* branch = new BVHTreeNode(root->aabb, "", false);
		branch->leftChild = newNode;
		branch->rightChild = root;
		root->parent = branch;
		newNode->parent = branch;
		setArea(branch, root, newNode);
		root = branch;
	}
	else{  //there is more than one node in the tree 
		BVHTreeNode* branchNode = root;
		while(!branchNode->isLeaf){
			int increaseInRightTreeSize = AABB::unionArea(newNode->aabb, branchNode->rightChild->aabb) - branchNode->rightChild->aabb.getArea();
			int increaseInLeftTreeSize = AABB::unionArea(newNode->aabb, branchNode->leftChild->aabb) - branchNode->leftChild->aabb.getArea();
			if(increaseInRightTreeSize < increaseInLeftTreeSize)
				branchNode = branchNode->rightChild;
			else
				branchNode = branchNode->leftChild;
		}
		BVHTreeNode* existingLeaf = branchNode;
		BVHTreeNode* newBranchNode = new BVHTreeNode(root->aabb, "", false);
		if(existingLeaf == existingLeaf->parent->leftChild)
			existingLeaf->parent->leftChild = newBranchNode;
		else
			existingLeaf->parent->rightChild = newBranchNode;
			
		newBranchNode->parent = existingLeaf->parent;
		newBranchNode->leftChild = newNode;
		newBranchNode->rightChild = existingLeaf;
		existingLeaf->parent = newBranchNode;
		newNode->parent = newBranchNode;
		existingLeaf->isLeaf = true;
		setArea(newBranchNode, existingLeaf, newNode);
		while(newBranchNode->parent != nullptr){  //to update the areas of the previous branch nodes
			newBranchNode = newBranchNode->parent;
			setArea(newBranchNode, newBranchNode->leftChild, newBranchNode->rightChild); 
		}
	}
	map[name] = newNode;
}

BVHTreeNode* BVHTree::findNode(BVHTreeNode* node, std::string name){  //returns the searched node if it exists in the tree, nullptr otherwise 
    if (node == nullptr) return nullptr;
    if (node->name == name)
        return node;

    BVHTreeNode* nodeFromLeftSide = findNode(node->leftChild, name);  //search the left tree recursively
    if(nodeFromLeftSide != nullptr && nodeFromLeftSide->name == name) 
		return nodeFromLeftSide;

    BVHTreeNode* nodeFromRightSide = findNode(node->rightChild, name);  //search the right tree recursively
	if(nodeFromRightSide != nullptr && nodeFromRightSide->name == name)
    	return nodeFromRightSide;
	
	return node;
}

void BVHTree::printTree(BVHTreeNode* node){ 
    if (!(node->isLeaf)){
		printTree(node->leftChild);
		printTree(node->rightChild);
	}
	else{
		std::cout << node->name << " ";
		node->aabb.printAABB(std::cout);
		std::cout << std::endl;
	}
}

void BVHTree::printTree(){ 
    printTree(root);
}

void BVHTree::removeBVHMember(std::string name){
	if(root == nullptr) return;
	if(root->name == name){  //if there is one node in the tree
		delete root;
		root = nullptr;
		return;
	}
 	BVHTreeNode* toRemove = findNode(root, name);
	if(toRemove == nullptr) return;  //if not found
	if(toRemove->parent == root){  //if there are three nodes in the tree
		if(root->leftChild == toRemove){
			root = root->rightChild;
		}
		else{
			root = root->leftChild;
		}
		delete toRemove->parent;
		delete toRemove;
		map.erase(toRemove->name);
		return;	
	}
 	BVHTreeNode* parentToBeDeleted = toRemove->parent;
	BVHTreeNode* otherChild;
 	if(parentToBeDeleted->leftChild == toRemove){
		otherChild = parentToBeDeleted->rightChild; 
		otherChild->parent = parentToBeDeleted->parent;
		if(parentToBeDeleted == parentToBeDeleted->parent->leftChild)
			parentToBeDeleted->parent->leftChild = otherChild;
		else
			parentToBeDeleted->parent->rightChild = otherChild;
 	}
 	else{
		otherChild = parentToBeDeleted->leftChild; 
		otherChild->parent = parentToBeDeleted->parent;
		if(parentToBeDeleted == parentToBeDeleted->parent->leftChild)
			parentToBeDeleted->parent->leftChild = otherChild;
		else
			parentToBeDeleted->parent->rightChild = otherChild;
	}
	//I put this block to update the areas of the previous branch nodes
	//But the TA told me not to update the previous branch nodes
	//So, I commented this block out
	/*while(otherChild->parent != nullptr){
		otherChild = otherChild->parent;
		setArea(otherChild, otherChild->leftChild, otherChild->rightChild); 
	}*/
	map.erase(toRemove->name);
 	delete parentToBeDeleted;
 	delete toRemove;
 	
}

void BVHTree::moveBVHMember(std::string name, AABB newLocation){
	BVHTreeNode* nodeToMove = findNode(root, name);
	if(nodeToMove == nullptr) return; 
	if((nodeToMove == root) || ((nodeToMove->parent->aabb).minX <= newLocation.minX && newLocation.minX < (nodeToMove->parent->aabb).maxX &&
	   (nodeToMove->parent->aabb).minY <= newLocation.minY && newLocation.minY < (nodeToMove->parent->aabb).maxY &&
	   (nodeToMove->parent->aabb).minX < newLocation.maxX && newLocation.maxX <= (nodeToMove->parent->aabb).maxX &&
	   (nodeToMove->parent->aabb).minY < newLocation.maxY && newLocation.maxY <= (nodeToMove->parent->aabb).maxY)){  //if the newLocation is covered by the parent of the node
		(nodeToMove->aabb).minX = newLocation.minX; 
		(nodeToMove->aabb).minY = newLocation.minY;
		(nodeToMove->aabb).maxX = newLocation.maxX; 
		(nodeToMove->aabb).maxY = newLocation.maxY; 
	}
	else{  //the newLocation is not covered by the parent of the node
		removeBVHMember(name);
		addBVHMember(newLocation, name);
	}
}	

std::vector<std::string> BVHTree::traverseTree(BVHTreeNode* node, AABB object, std::vector<std::string> & vec){  //puts the colling objects into the vec while traversing the tree
	if(node != nullptr && node->isLeaf && (node->aabb).collide(object)){
		vec.push_back(node->name);
	}
	if(node != nullptr && !(node->isLeaf)){
		vec = traverseTree(node->leftChild, object, vec);
		vec = traverseTree(node->rightChild, object, vec);
	}
	return vec;
}

std::vector<std::string> BVHTree::getCollidingObjects(AABB object){
	std::vector<std::string> collidingObjects;
	collidingObjects = traverseTree(root, object, collidingObjects);
	return collidingObjects;
}

std::ostream &operator<<(std::ostream &out, BVHTree &tree) {
	tree.printNode(out, tree.root, 0);
	return out;
}