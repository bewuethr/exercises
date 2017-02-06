#!C:\strawberry\perl\bin\perl.exe

# Create two arrays with first and last names (aligned); go through one array
# with 'each' and use the index to access the other array; put every character
# on its own line

use 5.020;
use warnings;

my @first = qw( Fred Barney Betty Wilma Larry );
my @last = qw( Flintstone Rubble Rubble Flintstone Slate );

while( my( $index, $value ) = each @first ) {
    say "$value $last[$index]";
}
