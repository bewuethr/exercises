#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to not modify file if it already contains a copyright
# line

use 5.020;
use warnings;

my $cprline = '## Copyright (C) 2015 by Yours Truly';

while (@ARGV) {
    my $in = shift @ARGV;
    open my $fh_in, '<', $in or die "Can't open $in, $!";
    my $lines = join '', <$fh_in>;
    if ( $lines =~ m/(\Q$cprline\E)/ ) {
        print "$in already has a copyright line\n";
    }
    else {
        open my $fh_out, '>', "$in.bak" or die "Can't open $in.bak, $!";
        print $fh_out $lines;
        $lines =~ s/(\A#!.*\R)/$1$cprline\n/;
        close $fh_in;
        open $fh_out, '>', "$in" or die "Can't open $in, $!";
        print $fh_out $lines;
        close $fh_out;
    }
}
