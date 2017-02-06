// 4.1 - determine if a binary tree is balanced, where "balanced" is defined as
// "the subtrees of each node have a height differnce of no more than 1"

// improve to have less calls to height(): have height() return -1 if the Node
// it is called for is not balanced; it knows because it checks the heights of
// both subtrees. If the recursive call to either child node returns -1, it
// immediately returns -1; if the height difference is > 1, it returns -1; if
// both subtrees are balanced and have a smaller height difference, it returns
// the actual height

#include<iostream>
#include<algorithm>
#include<cstdlib>

using namespace std;

struct Node {
    Node() :left(0), right(0) { }
    Node* left;
    Node* right;
};

int height(Node* n)
{
    if (!n) return 0;   // leaf
    return max(height(n->left),height(n->right)) + 1;
}

bool is_balanced(Node* n)
{
    if (!n) return true;    // leaf
    if (abs(height(n->left)-height(n->right)) > 1) return false;
    return is_balanced(n->left) && is_balanced(n->right);
}

int main()
{
    Node* n21 = new Node();
    Node* n22 = new Node();
    Node* n11 = new Node();
    n11->left = n21;
    n11->right = n22;
    Node* n01 = new Node();
    n01->left = n11;
    cout << "Root balanced: " << is_balanced(n01) << '\n';
    cout << "Left subtree balanced: " << is_balanced(n11) << '\n';
}
