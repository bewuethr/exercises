#!C:\strawberry\perl\bin\perl.exe

# match 'a', 'b', or 'x' in a string; make it case insensitive

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
    if (/[abx]/i) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
    }
    else {
        print "No match: |$_|\n";
    }
}
