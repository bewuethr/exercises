#!C:\strawberry\perl\bin\perl.exe

# Modify previous program re-open STDERR to file in current directory

use 5.020;
use warnings;

if ( ! open STDERR, '>>', './error_log' ) {
    die "Can't open error log for append: $!";
}

foreach (@ARGV) {
    if ( ! open my $fh, '<', $_ ) {
        warn "Can't open file $_: $!";
    } else {
        my @list = (<$fh>);
        print "$_: ", scalar @list, " lines\n";
    }
}
