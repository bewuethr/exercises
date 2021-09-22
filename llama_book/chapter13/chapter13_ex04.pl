#!C:\strawberry\perl\bin\perl.exe

# Write a program that works like rm

use 5.020;
use warnings;

unlink @ARGV;   # nicer: add warning if unlink doesn't work
