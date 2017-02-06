#!C:\strawberry\perl\bin\perl.exe

# Implement a word guessing game: use given-when. The user enters a string; if
# it is the exact word, report success; if, interpreted as a pattern, it is a
# match, report that; if the user enters 'give up', stop and give the solution

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

my $secret = 'Barney';

print "Enter a string or pattern> ";

while ( my $guess = <STDIN> ) {
    chomp $guess;
    given ($secret) {
        when ( $guess ~~ 'give up' ) { say "It was 'Barney'!"; last }
        when ( $guess )              { say "You guessed the secret word!"; last }
        when ( /$guess/ )            { say "The secret word matches the pattern [$guess]" }
        default                      { say "[$guess] didn't help at all" }
    }
    print "Enter another string or pattern> ";
}
