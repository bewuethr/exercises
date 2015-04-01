#!C:\strawberry\perl\bin\perl.exe

# Match the string 'match'

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
    if (/match/) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
    }
    else {
        print "No match: |$_|\n";
    }
}
