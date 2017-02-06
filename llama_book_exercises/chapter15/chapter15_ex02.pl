#!C:\strawberry\perl\bin\perl.exe

# Use given-when; take number as input, print "Fizz" if divisible by 3, "Bin"
# if divisible by 5 and "Sausage" if divisible by 7

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

foreach (@ARGV) {
    given ($_) {
        print "$_:";
        when ( $_ % 3 == 0 ) { print " Fizz"; continue }
        when ( $_ % 5 == 0 ) { print " Bin"; continue }
        when ( $_ % 7 == 0 ) { print " Sausage"; continue }
        default              { print "\n"; }
    }   # Alternative: start with empty string and add to it in when statements
}
