#!C:\strawberry\perl\bin\perl.exe

# Add up the numbers from 1 to 1000 using List::Util, then redo using reduce

use 5.020;
use warnings;
use List::Util qw( sum reduce );

my $total1 = sum( 1..1000 );
my $total2 = reduce { $a + $b } 1..1000;

say "Using sum: $total1";
say "Using reduce: $total2";
