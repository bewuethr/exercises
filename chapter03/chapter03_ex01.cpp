// 3.1 - use single array to implement three stacks

// idea: each stack gets on third of the array

// improve
//  - have one function each, n_el(int n), peek(int n) etc.
//  - use flexible divisions (much more complex)

#include<vector>
#include<stdexcept>
#include<iostream>

using namespace std;

class Triple_stack {
public:
    int n_el1() const { return idx1; }
    int n_el2() const { return idx2 - sz/3; }
    int n_el3() const { return idx3 - 2*sz/3; }

    int peek1() const { return data.at(idx1-1); }
    int peek2() const;
    int peek3() const;

    int pop1();
    int pop2();
    int pop3();

    void push1(int n);
    void push2(int n);
    void push3(int n);

    void print() const;

    Triple_stack(int size)
        :data(size), sz(size), idx1(0), idx2(sz/3), idx3(2*sz/3) { }
private:
    vector<int> data;
    int sz;
    int idx1;
    int idx2;
    int idx3;
};

int Triple_stack::peek2() const
{
    if (n_el2()==0)
        throw exception("can't peek at empty stack 2");
    return data[idx2-1];
}

int Triple_stack::peek3() const
{
    if (n_el3()==0)
        throw exception("can't peek at empty stack 3");
    return data[idx3-1];
}

int Triple_stack::pop1()
{
    if (n_el1()) {
        int val = peek1();
        --idx1;
        return val;
    }
    else
        throw exception("can't pop from empty stack 1");
}

int Triple_stack::pop2()
{
    if (n_el2()) {
        int val = peek2();
        --idx2;
        return val;
    }
    else
        throw exception("can't pop from empty stack 2");
}

int Triple_stack::pop3()
{
    if (n_el3()) {
        int val = peek3();
        --idx3;
        return val;
    }
    else
        throw exception("can't pop from empty stack 3");
}

void Triple_stack::push1(int n)
{
    if (n_el1() == sz/3)
        throw exception("can't push onto full stack 1");
    data[idx1] = n;
    ++idx1;
}

void Triple_stack::push2(int n)
{
    if (n_el2() == sz/3)
        throw exception("can't push onto full stack 2");
    data[idx2] = n;
    ++idx2;
}

void Triple_stack::push3(int n)
{
    if (n_el3() == sz-2*sz/3)
        throw exception("can't push onto full stack 3");
    data[idx3] = n;
    ++idx3;
}

void Triple_stack::print() const
{
    for (int i = 0; i<idx1; ++i)
        cout << data[i] << '\n';
    cout << '\n';
    for (int i = sz/3; i<idx2; ++i)
        cout << data[i] << '\n';
    cout << '\n';
    for (int i = 2*sz/3; i<idx3; ++i)
        cout << data[i] << '\n';
    cout << '\n';
}

int main()
try
{
    Triple_stack ts(16);
    //int n1 = ts.pop1(); // throws
    //int n2 = ts.pop2(); // throws
    //int n3 = ts.pop3(); // throws
    //int n1 = ts.peek1();    // throws
    //int n2 = ts.peek2();    // throws
    //int n3 = ts.peek3();    // throws
    ts.push1(1);
    ts.push2(11);
    ts.push3(101);
    ts.print();
    cout << "Peeking at stack 1: " << ts.peek1() << '\n';
    cout << "Popping stack 2: " << ts.pop2() << '\n';
    ts.print();
    while (true) {
        ts.push3(1);    // eventually throws
        ts.print();
    }
}
catch (exception& e) {
    cerr << "Exception: " << e.what() << '\n';
}
catch (...) {
    cerr << "Exception\n";
}
