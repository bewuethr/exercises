#!C:\strawberry\perl\bin\perl.exe

# Read lines of input and report position of first mention of "perl" on each
# line; use index

use 5.020;
use warnings;

say "Enter a few strings:";

while ( my $line = <> ) {
     say index( $line, 'perl' );    # nicer: say something if result is -1
 }
