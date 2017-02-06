#!C:\strawberry\perl\bin\perl.exe

# Program that acts like cat, but precedes each line with its file name

use 5.020;
use warnings;

while (<>) {
    print "$ARGV: $_";
}
