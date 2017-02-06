#!C:\strawberry\perl\bin\perl.exe

# Fix the program from exercise 2 in Chapter 5 to keep the running total in a
# data file so it can be run on each day's logs to get the new totals. Use the
# Storable module.

use 5.020;
use warnings;
use Storable;

my $tb_ref;
my $fname = 'running_totals.dat';

$tb_ref = retrieve $fname if -e $fname;

while (<>) {
    my ($source, $destination, $bytes)  = split;
    $tb_ref->{$source}[0]               += $bytes;
    $tb_ref->{$source}[1]{$destination} += $bytes;
}

store $tb_ref, $fname;

foreach my $source (
    sort { $tb_ref->{$b}[0] <=> $tb_ref->{$a}[0] } keys %$tb_ref
) {
    my $tb = $tb_ref->{$source};
    print "$source total: $tb->[0]\n";
    foreach my $destination (
        sort { $tb->[1]{$b} <=> $tb->[1]{$a} }
        keys %{ $tb_ref->{$source}[1] }
    ) {
        print "$source => $destination:",
        " $tb->[1]{$destination} bytes \n";
    }
    print "\n";
}
