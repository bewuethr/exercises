#!C:\strawberry\perl\bin\perl.exe

# Rewrite the number guessing program from exercise 1 in Chapter 10 to use
# given

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

my $num = int( 1 + rand 100 );

print "Guess the secret number between 1 and 100:\n";

while ( my $guess = <STDIN> ) {
    chomp $guess;
    given ( $guess ) {
        when ( ! /\A\d+\z/ )   { say "Enter a (positive) integer number!" }
        when ( $guess > $num ) { say "Too large!" }
        when ( $guess < $num ) { say "Too small!" }
        default                { say "You win!"; last }
    }
}
