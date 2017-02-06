#!C:\strawberry\perl\bin\perl.exe

# Take multiple directory names from the command line and print out their
# contents.

use 5.020;
use warnings;

foreach my $dirname (@ARGV) {
    if ( -d $dirname ) {
        opendir my $dh, $dirname or die "Could not open directory: $!";
        list_contents( $dh, $dirname);
    } else {
        say "Not a directory: $dirname";
        next;
    }
}

sub list_contents {
    my( $dh, $dirname) = @_;
    say $dirname;
    foreach my $file ( readdir($dh) ) {
        next if( $file eq '.' or $file eq '..' );
        say "    $file";
    }
}

# Elegant way to get handles for directories:
# my @dir_hs = map { opendir my $dh, $_; $dh } grep { -d } @ARGV;
