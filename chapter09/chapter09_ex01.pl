#!C:\strawberry\perl\bin\perl.exe

# Pattern that matches three consecutive copies of whatever is currently in
# $what

use 5.020;
use warnings;

my $what = "fred|barney";

while (<>) {
    chomp;
    if (/($what){3}/) {
        print "Matched: |$`<$&>$'|\n";    # the special match vars
    }
    else {
        print "No match: |$_|\n";
    }
}
