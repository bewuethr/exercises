#!C:\strawberry\perl\bin\perl.exe

# Prompt for regex pattern and report if any element in an array math that
# pattern

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

my @array = qw( Fred Wilma Barney Betty Larry Pebbles Bamm-Bamm );
say "The elements are (@array)";

say "Enter a pattern:";
chomp( my $pattern = <STDIN> );

if ( @array ~~ /${pattern}/ ) { # to check if valid pattern: use 'eval'
    say "At least one element matches";
}
else {
    say "No element matches";
}
