#!C:\strawberry\perl\bin\perl.exe

# Given an array 0..1000, use an array slice to select
# a) the first and last number
# b) the last and first number
# c) the first 10 numbers
# d) the odd numbers

use 5.020;
use warnings;

my @array = 0..1000;
my @suba = @array[0, -1];
my @subb = @array[-1, 0];
my @subc = @array[0..9];
my @subd = @array[ grep $_ % 2, 0 .. $#array ];

say "a) @suba";
say "b) @subb";
say "c) @subc";
say "d) @subd";
