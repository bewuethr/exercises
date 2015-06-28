#!C:\strawberry\perl\bin\perl.exe

# Alter the script from exercise 1 to use the export tag :all

use strict;
use warnings;
use Oogaboogoo qw(:all);

my(undef, undef, undef, $mday, $mon, $year, $day) = localtime;

my $ob_day = day($day);
my $ob_mon = mon($mon);

printf "Today is %s %s %d %d.\n", $ob_day, $ob_mon, $mday, $year + 1900;
