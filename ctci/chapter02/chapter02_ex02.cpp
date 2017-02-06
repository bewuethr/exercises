// 2.2 - find kth to last element of a singly linked list

// Solution could be recursive: return 0 if first->next is 0, return the result
// of a recursive call + 1 otherwise. Or use a reference for the counter and
// return the Node itself.
//
// Alternative iterative solution: move second pointer k-1 elements, then move
// head and second pointer until second pointer points to last element; head
// points to kth last element

#include<iostream>

using namespace std;

struct Node {
    Node(int v) :next(0), val(v) { }
    Node* next;
    int val;
};

Node* kth_to_last(Node* first, int k)
{
    if (k<1) return 0;
    int n = 0;
    Node* p = first;
    while (p) {
        ++n;
        p = p->next;
    }
    if (k>n) return 0;
    for (int i = 0; i<n-k; ++i)
        first = first->next;
    return first;
}

void push_back(Node* p, int val)
{
    while (p->next)
        p = p->next;
    Node* n = new Node(val);
    p->next = n;
}

void print(Node* p)
{
    while (p) {
        cout << p->val << '\n';
        p = p->next;
    }
}

void test(Node* first, int k)
{
    cout << "List:\n";
    print(first);
    Node* klast = kth_to_last(first,k);
    if (klast)
        cout << "Number " << k << " from last: " << klast->val << "\n\n";
    else
        cout << k << " is too large or too small\n\n";
}

int main()
{
    Node* p1 = 0;
    test(p1,1);

    Node* p2 = new Node(1);
    test(p2,2);
    test(p2,1);

    Node* p3 = new Node(1);
    push_back(p3,2);
    test(p3,1);
    test(p3,2);

    Node* p4 = new Node(1);
    push_back(p4,2);
    push_back(p4,3);
    push_back(p4,4);
    push_back(p4,5);
    push_back(p4,6);
    push_back(p4,7);
    push_back(p4,8);
    push_back(p4,9);
    test(p4,0);
    test(p4,1);
    test(p4,5);
    test(p4,9);
    test(p4,10);
}
