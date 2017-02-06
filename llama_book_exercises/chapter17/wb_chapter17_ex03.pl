#!C:\strawberry\perl\bin\perl.exe

# Use grep to select multiples of 3 between 1 and 1000

use 5.020;
use warnings;

my @list = grep ! ( $_ % 3 ), 1..1000;
say "@list";
