#!C:\strawberry\perl\bin\perl.exe

# Using redo and a naked block, continually prompt a user to guess a secret
# number between 1 and 10

use 5.020;
use warnings;

my $num = int( 1 + rand 10 );

{
    print "Guess the number: ";
    chomp( my $guess = <STDIN> );
    unless ( $guess =~ /\A\s*\d+\z/ ) {
        print "Enter an integer number!\n";
        redo;
    }
    redo if ( $guess != $num ) {
}
print "Yes!\n";
