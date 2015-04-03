#!C:\strawberry\perl\bin\perl.exe

# List all keys and values in %ENV, print results in two columns in order; if a
# variable has no value, print "(undefined value)" - use the // operator

use 5.020;
use warnings;

# add dummy value
$ENV{ZERO} = 0;
$ENV{DUMMY} = undef;

# get length of longest key
my $max = 0;
foreach (keys %ENV) {
    if (length($_) > $max) { $max = length($_) }
}

foreach (sort keys %ENV) {
    printf "%-${max}s  %s\n", $_, $ENV{$_} // "(undefined value)";
}
