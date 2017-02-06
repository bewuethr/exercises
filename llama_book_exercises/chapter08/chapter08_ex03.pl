#!C:\strawberry\perl\bin\perl.exe

# Match and capture word that ends with letter 'a', display contents of $1

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
    if (/\b(\w*a)\b/) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
        print "\$1 contains '$1'\n";
    }
    else {
        print "No match: |$_|\n";
    }
}
