#!C:\strawberry\perl\bin\perl.exe

# Use the Benchmark module to find ou how much time the Schwartzian Tranform
# technique saves in exercise 1.

use 5.020;
use warnings;
use Benchmark qw(cmpthese);

chdir 'C:\Users\Benjamin\Google Drive';
my @files = glob '*';   # glob should not be part of comparison

# Naive method
my $naive = sub {
    my @sorted = sort { -s $a <=> -s $b } @files;
};

# Schwartzian Transform
my $schw_tran = sub {
    my @st_sorted =
        map $_->[0],
        sort { $a->[1] <=> $b->[1] }
        map [ $_, -s $_ ],
        @files;
};

my $count = -3;    # Run for at least 3 seconds

cmpthese($count, {
    'Naive'                 => $naive,
    'Schwartzian Transform' => $schw_tran,
});
