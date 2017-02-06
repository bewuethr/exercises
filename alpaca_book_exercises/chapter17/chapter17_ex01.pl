#!C:\strawberry\perl\bin\perl.exe

# Alter the script using the Oogaboogoo library from Chapter 11 to use the
# imported routines and test it.

use strict;
use warnings;
use Oogaboogoo;

my(undef, undef, undef, $mday, $mon, $year, $day) = localtime;

my $ob_day = day($day);
my $ob_mon = mon($mon);

printf "Today is %s %s %d %d.\n", $ob_day, $ob_mon, $mday, $year + 1900;
