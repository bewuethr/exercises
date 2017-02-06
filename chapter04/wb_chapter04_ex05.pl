#!C:\strawberry\perl\bin\perl.exe

# Subroutine that takes operator and list of numbers, applies operator to
# numbers. Support + and *

use warnings;
use 5.020;

sub get_sum {
    my $sum;
    foreach (@_) {
        $sum += $_;
    }
    $sum;
}

sub get_prod {
    my $prod = 1;
    foreach (@_) {
        $prod *= $_;
    }
    $prod;
}

sub manip {
    my $op = shift;
    if ($op eq '+') { &get_sum }
    elsif ($op eq '*') { &get_prod }
    else { print "Illegal operator!\n"; return }
}

print "('+', 1..4): ", manip('+', 1..4), "\n";
print "('*', 1..4): ", manip('*', 1..4), "\n";
print "('x', 1..4): ", manip('x', 1..4), "\n";
