#!C:\strawberry\perl\bin\perl.exe

# Using the data structure from exercise 2, rewrite the coconet.dat file so
# it's in the same format, but sorted by source machine; each destination
# machine should be indented under the source machine name and sorted by
# machine name.

use 5.020;
use warnings;

my %total_bytes;
while (<>) {
    my ($source, $destination, $bytes) = split;
    $total_bytes{$source}{$destination} += $bytes;
}

foreach my $source ( sort keys %total_bytes ) {
    my $tb = $total_bytes{$source};
    say "$source";
    foreach my $destination ( sort keys %$tb ) {
        say "  $destination $tb->{$destination}";
    }
}
