#!C:\strawberry\perl\bin\perl.exe

# Match string that begins and ends with the same thing (without overlap)

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
    if (/\A(.+).*\g{1}\z/) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
        print "'$1' at beginning and end\n";
    }
    else {
        print "No match: |$_|\n";
    }
}
