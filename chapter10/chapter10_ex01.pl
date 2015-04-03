#!C:\strawberry\perl\bin\perl.exe

# Repeatedly ask user to guess a secret number from 1 to 100; when the guess is
# wrong, answer "Too high" or "Too low"; if the user enters "quit" or "exit" or
# a blank line, the program should exit.

use 5.020;
use warnings;

my $num = int( 1 + rand 100 );

print "Guess the secret number between 1 and 100:\n";

while (<>) {
    chomp;
    last if /quit|exit|\A\s*\z/i;
    unless (/\A\d+\z/) {
        print "Please enter an integer number between 1 and 100!\n";
        next;
    }
    if ( $_ == $num ) {
        print "You win!\n";
        last;
    }
    print "Too low\n"  if ( $_ < $num );
    print "Too high\n" if ( $_ > $num );
}
