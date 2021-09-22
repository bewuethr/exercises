#!C:\strawberry\perl\bin\perl.exe

# match 'a', 'b', or 'x' at the beginning of the string, then at the end of the
# string

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
#    if (/\A[abx]/) {    # at beginning
    if (/[abx]\z/) {    # at end
        print "Matched: |$`<$&>$'|\n";    # the special match vars
    }
    else {
        print "No match: |$_|\n";
    }
}
