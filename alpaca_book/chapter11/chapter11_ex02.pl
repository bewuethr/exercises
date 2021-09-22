#!C:\strawberry\perl\bin\perl.exe

# Use the library from exercise 1 to turn a date into Oogaboogoo.

use 5.020;
use warnings;
require 'Oogaboogoo.pm';

my(undef, undef, undef, $mday, $mon, $year, $day) = localtime;

my $ob_day = Oogaboogoo::day($day);
my $ob_mon = Oogaboogoo::mon($mon);

printf "Today is %s %s %d %d.\n", $ob_day, $ob_mon, $mday, $year + 1900;
