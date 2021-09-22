#!C:\strawberry\perl\bin\perl.exe

# Prompt user for whole number, then print in binary, octal, decimal and hex

use 5.020;
use warnings;

print "Enter number: ";

while (<STDIN>) {
    chomp;
    printf "binary: %5b octal: %5o decimal: %5d hexadecimal: %5x\n", ($_) x 4;
    print "Enter number: ";
}
