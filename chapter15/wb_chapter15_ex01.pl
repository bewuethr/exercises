#!C:\strawberry\perl\bin\perl.exe

# Use smart match; prompt for a string and report if string is in an array
# specified in the program; only match exact elements

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

my @array = qw( Fred Wilma Barney Betty Larry Pebbles Bamm-Bamm );

say "This is the array: (@array)";
say "Enter a name to match:";
chomp( my $name = <STDIN> );

given ($name) { # or simply if ( $name ~~ @array ) { ... } else { ... }
    when (@array) { say "I found a matching name" }
    default       { say "I didn't find a matching name" }
}
