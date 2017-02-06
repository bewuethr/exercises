#!C:\strawberry\perl\bin\perl.exe

# Match word that ends with letter 'a'

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
    if (/a\b/) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
    }
    else {
        print "No match: |$_|\n";
    }
}
