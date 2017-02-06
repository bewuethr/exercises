#!C:\strawberry\perl\bin\perl.exe

# Go through list of files from command line and report line count; warn if
# file does not exist

use 5.020;
use warnings;

foreach (@ARGV) {
    if ( ! open my $fh, '<', $_ ) {
        warn "Can't open file $_: $!";
    } else {
        my @list = (<$fh>);
        print "$_: ", scalar @list, " lines\n";
    }
}
