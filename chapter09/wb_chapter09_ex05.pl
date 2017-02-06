#!C:\strawberry\perl\bin\perl.exe

# Modify last answer to uppercase any letter after a word boundary; try with
# and without the /r modifier

use 5.020;
use warnings;

print "Enter a string: ";
while (<>) {
    print $_, "\U$_", "\L$_", "\u\L$_";
    ( my $copy = $_ ) =~ s/\b(\w)/\u$1/g;
    print $copy;
    print $_ =~ s/\b(\w)/\u$1/rg;
    print "Enter a string: ";
}
