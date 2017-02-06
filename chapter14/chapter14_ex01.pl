#!C:\strawberry\perl\bin\perl.exe

# Read in a list of numbers, sort them numerically, print resulting list in a
# right-justified column

use 5.020;
use warnings;

my $maxlen = 0;
my @numbers = @ARGV;
foreach my $number (@numbers) {
    $maxlen = length $number if length $number > $maxlen;
}

foreach my $number ( sort { $a <=> $b } @numbers ) {
    printf "%${maxlen}g\n", $number;
}
