#!C:\strawberry\perl\bin\perl.exe

# Match and capture word that ends with letter 'a' and the up to five next
# characters; display contents of both captures; use named captures

use 5.020;
use warnings;

while (<>) {    # take one input line at a time
    chomp;
    if (/\b(?<name>\w*a)\b(?<nextchar>.{0,5})/) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
        print "'name' contains '$+{name}', 'nextchar' contains '$+{nextchar}'\n";
    }
    else {
        print "No match: |$_|\n";
    }
}
