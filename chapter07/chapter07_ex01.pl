#!C:\strawberry\perl\bin\perl.exe

# Print each line of input that mentions fred

use 5.020;
use warnings;

while (<>) {
    if (/fred/) {
        print;
    }
}
