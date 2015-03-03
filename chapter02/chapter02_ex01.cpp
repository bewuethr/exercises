// 2.1 - remove duplicates from unsorted linked list

// uses STL list and set

#include<iostream>
#include<list>
#include<set>

using namespace std;

typedef list<int>::iterator iter;
typedef list<int>::const_iterator c_iter;

void remove_duplicates(list<int>& l)
{
    set<int> vals;
    iter p = l.begin();
    while (p != l.end()) {
        if (vals.find(*p) != vals.end())
            p = l.erase(p);
        else {
            vals.insert(*p);
            ++p;
        }
    }
}

void print(const list<int>& l)
{
    for (c_iter p = l.begin(); p!=l.end(); ++p)
        cout << *p << '\n';
}

void test(list<int>& l)
{
    cout << "Before:\n";
    print(l);
    remove_duplicates(l);
    cout << "\nAfter:\n";
    print(l);
    cout << '\n';
}

int main()
{
    list<int> l1;
    test(l1);
    list<int> l2 = { 1 };
    test(l2);
    list<int> l3 = { 1, 1 };
    test(l3);
    list<int> l4 = { 1, 2, 3 };
    test(l4);
    list<int> l5 = { 1, 2, 3, 1, 4, 1, 5, 5, 5 };
    test(l5);
}
