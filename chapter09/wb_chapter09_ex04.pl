#!C:\strawberry\perl\bin\perl.exe

# Read lines from stdin and print them in four versions: original string, all
# uppercase, all lowercase, all lowercase except for the first character

use 5.020;
use warnings;

print "Enter a string: ";
while (<>) {
    print $_, "\U$_", "\L$_", "\u\L$_";
    print "Enter a string: ";
}
