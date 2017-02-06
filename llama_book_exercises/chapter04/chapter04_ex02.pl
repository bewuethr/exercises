#!C:\strawberry\perl\bin\perl.exe

# Calculate sum of numbers from 1 to 1000

use warnings;
use strict;

sub total {
    my $sum;
    foreach (@_) {
        $sum += $_;
    }
    $sum;
}

print "Sum of numbers from 1 to 1000: ", &total(1..1000), "\n";
