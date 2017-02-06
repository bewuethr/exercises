#!C:\strawberry\perl\bin\perl.exe

# Ask user for string and regex, then report if they match. Catch invalid
# regular expressions.

use 5.020;
use warnings;

while (1) {
    print "Enter a string: ";
    chomp( my $string = <STDIN> );
    print "Enter a regex: ";
    chomp( my $regex = <STDIN> );

    eval {
        if ( $string =~ /$regex/ ) {
            say "Matches!";
        }
        else {
            say "Doesn't match!";
        }
    };
    if ($@) {
        say "There was a problem with your regex!";
    }
}
