#!C:\strawberry\perl\bin\perl.exe

# Use for-when to go through a list of files on the command line and report if
# each file is readable, writable, or executable

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

foreach (@ARGV) {
    print "$_:";
    when ( -r )   { print " readable"; continue }   # could also test if file exists
    when ( -w _ ) { print " writable"; continue }
    when ( -x _ ) { print " executable"; continue }
    default       { print "\n"; }
}
