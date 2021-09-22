#!C:\strawberry\perl\bin\perl.exe

# Using a Schwartzian Transform, read a list of words and sort them in
# "dictionary order", i.e., ignoring all capitalization and internal
# punctuation.

use 5.020;
use warnings;

my @words = <>;

my @sorted_words =
    map $_->[0],
    sort { $a->[1] cmp $b->[1] }
    map [ $_->[0], $_->[1] =~ tr/a-z//cdr ],
    map [ $_, tr/A-Z/a-z/r ], @words;

print for @sorted_words;


# Alternative: single map with copy of $_
# map {
#     my $string = $_;
#     $string =~ tr/A-Z/a-z/;
#     $string =~ tr/a-z//cd;
#     [ $_, $string ];
# }
