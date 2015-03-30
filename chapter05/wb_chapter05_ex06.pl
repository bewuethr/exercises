#!C:\strawberry\perl\bin\perl.exe

# Take list of whole numbers from command line, print them in right aligned
# column

use 5.020;
use warnings;

sub get_max_width {
    my $max = length shift;
    foreach (@_) {
        if (length $_ > $max) { $max = length $_ }
    }
    $max;
}

my $width = &get_max_width(@ARGV);
foreach (@ARGV) {
    printf "%${width}d\n", $_;
}
