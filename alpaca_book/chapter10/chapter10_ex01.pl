#!C:\strawberry\perl\bin\perl.exe

# Sort names in your home directory by relative sizes using the Schwartzian
# Transform technique

use 5.020;
use warnings;

chdir 'C:\Users\Benjamin\Google Drive';

# Naive method
# my @sorted = sort { -s $a <=> -s $b } glob '*';
# say for @sorted;

my @st_sorted =
    map $_->[0],
    sort { $a->[1] <=> $b->[1] }
    map [ $_, -s $_ ],
    glob '*';

say for @st_sorted;
