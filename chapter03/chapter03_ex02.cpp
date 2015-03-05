// 3.2 - design a stack with push, pop, peek and min, all in O(1)

// improvement: only push to aux stack if new value is <= current minimum; only
// pop from aux stack if value being popped is == current minimum - saves space
// if many values are not the minimum.

// alternative: define data structure to hold int plus the current minimum,
// make stack of this data structure and just return the current minimum stored
// in the top element if asked

#include<stdexcept>
#include<iostream>

using namespace std;

struct Node {
    Node* next;
    int val;
    Node(int v) :next(0), val(v) { }
};

struct Stack {
    Node* top;

    void push(int v)
    {
        Node* n = new Node(v);
        n->next = top;
        top = n;
    }

    int pop()
    {
        if (top==0)
            throw exception("can't pop empty stack");
        int v = top->val;
        Node* n = top->next;
        delete(top);
        top = n;
        return v;
    }

    int peek()
    {
        if (!top)
            throw exception("can't peek on empty stack");
        return top->val;
    }

    Stack() :top(0) { }
};

class Min_stack : public Stack {
    Stack min_stack;
public:
    Min_stack() :Stack(), min_stack() { }

    void push(int v)
    {
        if (top==0 || v < min_stack.peek())
            min_stack.push(v);
        else
            min_stack.push(min_stack.peek());
        Stack::push(v); // must be last, otherwise top!=0
    }

    int pop()
    {
        min_stack.pop();
        return Stack::pop();
    }

    int min()
    {
        return min_stack.peek();
    }
};

int main()
try
{
    Min_stack ms;
    //ms.peek();  // throws
    //ms.pop();   // throws
    ms.push(1);
    ms.push(2);
    cout << "Minimum in {1,2}: " << ms.min() << '\n';
    ms.push(3);
    ms.push(-1);
    ms.push(4);
    ms.push(5);
    cout << "Minimum in {1,2,3,-1,4,5}: " << ms.min() << '\n';
    cout << "\nPopping all:\n";
    while (ms.top)
        cout << ms.pop() << '\n';
    ms.pop();   // throws
}
catch (exception& e) {
    cerr << "Exception: " << e.what() << '\n';
}
catch (...) {
    cerr << "Exception\n";
}
