#!C:\strawberry\perl\bin\perl.exe

# Subroutine that return list of numbers above average

use warnings;
use strict;

sub total {
    my $sum;
    foreach (@_) {
        $sum += $_;
    }
    $sum;
}

sub average {
    if (@_ == 0) { return }
    my $avg = &total(@_) / @_;
}

sub above_average {
    my @res;
    my $avg = &average(@_);
    foreach (@_) {
        if ($_ > $avg) {
            push(@res, $_);
        }
    }
    @res;
}


my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is  @barney\n";
print "(Should be just 100)\n";
