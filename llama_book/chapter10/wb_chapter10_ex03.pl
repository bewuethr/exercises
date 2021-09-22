#!C:\strawberry\perl\bin\perl.exe

# Read lines from input, split them into words; keep track of the count for
# each word and report the count 

use 5.020;
use warnings;

my %word_count;

while (<>) {
    chomp;
    $_ = "\L$_";

    s/\W/ /g;
    foreach (split) {
        $word_count{$_}++;
    }
}

foreach my $word ( keys %word_count ) {
    print "$word:\t$word_count{$word}\n";
}
