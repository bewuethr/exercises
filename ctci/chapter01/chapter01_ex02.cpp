// 1.2 - implement a function that reverses a C-style string

// notice that this works only with char arrays, not with pointer to chars as
// C string literals are constant

#include<iostream>
#include<cstring>

using namespace std;

void swap(char* a, char* b)
{
    char temp = *a;
    *a = *b;
    *b = temp;
}

void reverse(char* str)
{
    char* p = str + strlen(str) - 1;
    while (p-str > 0) {
        swap(p,str);    // could be "simplified" to swap(p--,str++);
        ++str;
        --p;
    }
}

int main()
{
    char str1[] = "";
    cout << str1 << ": ";
    reverse(str1);
    cout << str1 << '\n';

    char str2[] = "a";
    cout << str2 << ": ";
    reverse(str2);
    cout << str2 << '\n';

    char str3[] = "abcde";
    cout << str3 << ": ";
    reverse(str3);
    cout << str3 << '\n';

    char str4[] = "abcdef";
    cout << str4 << ": ";
    reverse(str4);
    cout << str4 << '\n';
}
