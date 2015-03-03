// 1.1 - determine if a string has all unique characters

// could improve:
//  - solution assumes ASCII input
//  - if s.size() > 128, there must be double characters - return false
//  - use bitset to save space

#include<string>
#include<vector>
#include<iostream>

using namespace std;

bool unique_chars(const string& s)
{
    vector<int> freq(128);
    for (int i = 0; i<s.size(); ++i) {
        if (freq[s[i]])
            return false;
        else
            ++freq[s[i]];
    }
    return true;
}

int main()
{
    cout << ": " << unique_chars("") << '\n';
    cout << "a: " << unique_chars("a") << '\n';
    cout << "abcde: " << unique_chars("abcde") << '\n';
    cout << "aabcd: " << unique_chars("aabcd") << '\n';
    cout << "aaa: " << unique_chars("aaa") << '\n';
    cout << "abcdd: " << unique_chars("abcdd") << '\n';
}
