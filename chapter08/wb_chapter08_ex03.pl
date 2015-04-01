#!C:\strawberry\perl\bin\perl.exe

# match non-empty string that doesn't have 'a', 'b' or 'x' at the beginning/end

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
#    if (/\A[^abx]/) {   # at beginning
    if (/[^abx]\z/) {    # at end
        print "Matched: |$`<$&>$'|\n";    # the special match vars
    }
    else {
        print "No match: |$_|\n";
    }
}
