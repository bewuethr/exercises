#!C:\strawberry\perl\bin\perl.exe

# Test the sum and shuffle functions in the My::List::Util module.

use 5.010;
use strict;
use warnings;
use My::List::Util qw(sum shuffle);

my @list = (1, 2, 3, 4, 5);
say "My list: @list";

my $sum = sum(@list);

say "Sum of my list: $sum";

my @shuffled = shuffle(@list);

say "My shuffled list: @shuffled";
