#!C:\strawberry\perl\bin\perl.exe

# Print given hash sorted in case-insensitive alphabetical order my last name,
# sort those by last name (no case, either)

use 5.020;
use warnings;

my %last_name = qw{
    fred flintstone Wilma Flintstone Barney Rubble
    betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE
};

my @sorted_keys = sort { "\L$last_name{$a}" cmp "\L$last_name{$b}"
    or "\L$a" cmp "\L$b" } keys %last_name;

foreach my $key (@sorted_keys) {
    say "$key $last_name{$key}";
}
