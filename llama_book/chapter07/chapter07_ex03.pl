#!C:\strawberry\perl\bin\perl.exe

# Print each line of input that contains a period (.)

use 5.020;
use warnings;

while (<>) {
    if (/\./) { # Alternative: /[.]/
        print;
    }
}
