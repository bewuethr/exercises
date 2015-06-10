package Oogaboogoo;

# Fix date code from example, add conversion function for month names and make
# the whole thing a library.
#
# Provides two functions, number_to_day_name and number_to_month_name that
# convert a number to a day or month name in Oobaboogoo.

use strict;
use warnings;

my @day   = qw(ark dip wap sen pop sep kir);
my @month = qw(diz pod bod rod sip wax lin sen kun fiz nap dep);

sub day {
    my $num = shift;
    if ($num < 0 or $num > 6) {
        die "Argument of number_to_day_name must be between 0 and 6";
    }
    $day[$num];
}

sub mon {
    my $num = shift;
    if ($num < 0 or $num > 11) {
        die "Argument of number_to_month_name must be between 0 and 11";
    }
    $month[$num];
}

1;
