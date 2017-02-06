package Oogaboogoo;

# Turn the Oogaboogoo library from Chapter 11 into a module that can be brought
# in and used with 'use'.

use strict;
use warnings;
use Exporter qw(import);

our @EXPORT = qw(day mon);

our %EXPORT_TAGS = (
    all => [ qw(day mon)],
);

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
