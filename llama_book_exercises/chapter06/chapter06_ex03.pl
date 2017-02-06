#!C:\strawberry\perl\bin\perl.exe

# List all keys and values in %ENV, print results in two columns in order

use 5.020;
use warnings;

# get length of longest key
my $max = 0;
foreach (keys %ENV) {
    if (length($_) > $max) { $max = length($_) }
}

foreach (sort keys %ENV) {
    printf "%-${max}s  %s\n", $_, $ENV{$_};
}
