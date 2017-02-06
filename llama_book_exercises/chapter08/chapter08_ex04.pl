#!C:\strawberry\perl\bin\perl.exe

# Match and capture word that ends with letter 'a', display contents of first
# capture; use named captures

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
    if (/\b(?<name>\w*a)\b/) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
        print "'name' contains '$+{name}'\n";
    }
    else {
        print "No match: |$_|\n";
    }
}
