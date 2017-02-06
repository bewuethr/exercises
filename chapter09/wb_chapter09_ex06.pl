#!C:\strawberry\perl\bin\perl.exe

# Read a tab-separated file with a header line, produce a report for each line

use 5.020;
use warnings;

chomp( my $header = <> );
my @headers = split /\t/, $header;

while (<>) {
    chomp;
    my @items = split /\t/;
    foreach my $idx ( 0..$#headers ) {
        print "$headers[$idx]: $items[$idx]\n";
    }
    print "\n";
}
