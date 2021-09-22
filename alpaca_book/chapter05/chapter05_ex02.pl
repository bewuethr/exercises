#!C:\strawberry\perl\bin\perl.exe

# Change network logging program to list the total bytes from each source
# machine; list source machines from most to least data transferred. Within
# each group, list the destination machines from most to least data transferred
# to that target from the source machine.

use 5.020;
use warnings;

my %total_bytes;
while (<>) {
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}[0]               += $bytes;
    $total_bytes{$source}[1]{$destination} += $bytes;
}

foreach my $source (
    sort { $total_bytes{$b}[0] <=> $total_bytes{$a}[0] } keys %total_bytes
) {
    my $tb = $total_bytes{$source};
    print "$source total: $tb->[0]\n";
    foreach my $destination (
        sort { $tb->[1]{$b} <=> $tb->[1]{$a} }
        keys %{ $total_bytes{$source}[1] }
    ) {
        print "$source => $destination:",
        " $tb->[1]{$destination} bytes \n";
    }
    print "\n";
}

# Alternative: have a dummy "all" element in the hash to add the total, then
# skip it when printing list
