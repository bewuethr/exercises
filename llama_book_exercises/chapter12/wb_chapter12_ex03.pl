#!C:\strawberry\perl\bin\perl.exe

# Use the stacked file test operators to report files from the command line
# that are readable, writable and executable

use 5.020;
use warnings;

foreach (@ARGV) {
    say if -r -w -x;
}
