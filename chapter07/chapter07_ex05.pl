#!C:\strawberry\perl\bin\perl.exe

# Match two same nonwhitespace characters next to each other

use 5.020;
use warnings;

while (<>) {
    if (/(\S)\g{-1}/) { # Alternative: /(\S)\1/
        print;
    }
}
