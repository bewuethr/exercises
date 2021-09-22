#!C:\strawberry\perl\bin\perl.exe

# Modify the previous program to use Try::Tiny

use 5.020;
use warnings;
use Try::Tiny;

while (1) {
    print "Enter a string: ";
    chomp( my $string = <STDIN> );
    last if $string eq '';

    print "Enter a regex: ";
    chomp( my $regex = <STDIN> );

    try {
        if ( $string =~ /$regex/ ) {
            say "Matches!";
        }
        else {
            say "Doesn't match!";
        }
    }
    catch {
        say "There was a problem with your regex!";
    };
}
