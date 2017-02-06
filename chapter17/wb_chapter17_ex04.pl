#!C:\strawberry\perl\bin\perl.exe

# Use the  map function to create a list of the squares of the numbers from 1
# to 10

use 5.020;
use warnings;

my @squares = map $_ ** 2, 1..10;
say "@squares";
