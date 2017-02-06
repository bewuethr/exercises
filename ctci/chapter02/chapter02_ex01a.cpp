// 2.1 FOLLOW UP - remove duplicates from linked list without additional buffer

// solution without STL containers, implements simple singly linked list; erase
// function could be improved by checking for null pointers
// More elegant: peek ahead (compare p->next->val instead of p->val to
// first->val as erasing p->next is much easier than deleting p (no iterating
// from head of list required)

#include<iostream>

using namespace std;

struct Node {
    Node(int v) :next(0), val(v) { }
    Node* next;
    int val;
};

Node* erase(Node* head, Node* p)
{
    while (head->next != p)
        head = head->next;
    Node* n = p->next;
    delete(p);
    head->next = n;
    return n;
}

void remove_duplicates(Node* first)
{
    while (first) {
        Node* p = first->next;
        while (p) {
            if (p->val == first->val)
                p = erase(first,p);
            else
                p = p->next;
        }
        first = first->next;
    }
}

void print(Node* p)
{
    while (p) {
        cout << p->val << '\n';
        p = p->next;
    }
}

void test(Node* p)
{
    cout << "Before:\n";
    print(p);
    remove_duplicates(p);
    cout << "\nAfter:\n";
    print(p);
    cout << '\n';
}

void push_back(Node* p, int val)
{
    while (p->next)
        p = p->next;
    Node* n = new Node(val);
    p->next = n;
}

int main()
{
    Node* p1 = 0;
    test(p1);

    Node* p2 = new Node(1);
    test(p2);

    Node* p3 = new Node(1);
    push_back(p3,1);
    test(p3);

    Node* p4 = new Node(1);
    push_back(p4,2);
    push_back(p4,3);
    test(p4);

    Node* p5 = new Node(1);
    push_back(p5,2);
    push_back(p5,3);
    push_back(p5,1);
    push_back(p5,4);
    push_back(p5,1);
    push_back(p5,5);
    push_back(p5,5);
    push_back(p5,5);
    test(p5);
}
