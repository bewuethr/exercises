#!C:\strawberry\perl\bin\perl.exe

# Change every 'Fred' to 'Wilma' and every 'Wilma' to 'Fred'

use 5.020;
use warnings;

my $in  = shift @ARGV;
if ( ! defined $in ) {
    die "Enter name of input file! $!";
}
my $out = "$in.out";

open my $fh_in,  '<', $in  or die "Can't open $in: $!";
open my $fh_out, '>', $out or die "Can't open $out: $!";

while (<$fh_in>) {
    chomp;
    s/Fred/\n/gi;
    s/Wilma/Fred/gi;
    s/\n/Wilma/g;
    print $fh_out "$_\n";
}
