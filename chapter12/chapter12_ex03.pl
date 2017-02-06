#!C:\strawberry\perl\bin\perl.exe

# Use stacked file test operators to list all file names named that are
# readable, writable and owned by you

use 5.020;
use warnings;

foreach (@ARGV) {
    say if -r -w -o;
}

