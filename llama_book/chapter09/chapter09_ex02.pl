#!C:\strawberry\perl\bin\perl.exe

# Make a modified copy of a text file; in the copy, every 'Fred' should be
# replaced with 'Larry'. Input file name from command line, output filename
# same name ending with '.out'.

use 5.020;
use warnings;

my $in  = shift @ARGV;
my $out = "$in.out";

open my $fh_in,  '<', $in  or die "Can't open $in: $!";
open my $fh_out, '>', $out or die "Can't open $out: $!";

while (<$fh_in>) {
    s/Fred/Larry/gi;
    print $fh_out $_;
}
