#!C:\strawberry\perl\bin\perl.exe

# Rea lines of input, report position of the last 'e' in the line; use rindex

use 5.020;
use warnings;

say "Enter a few strings:";

while ( my $line = <> ) {
    my $pos = rindex( $line, 'e' );

    if ( $pos == -1 ) { say "Line contains no 'e'" }
    else { say "The last 'e' is at index $pos" }
 }
