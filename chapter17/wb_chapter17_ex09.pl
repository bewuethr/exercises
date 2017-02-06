#!C:\strawberry\perl\bin\perl.exe

# Use 'pairwise' from List::MoreUtils to add the corresponding elements from
# two arrays

use 5.020;
use warnings;
use List::MoreUtils qw( pairwise );

my @m = ( 1, 2, 3 );
my @n = ( 4, 6, 8 );
my @o = pairwise { $a + $b } @m, @n;
say "\@o: ( @o )";
