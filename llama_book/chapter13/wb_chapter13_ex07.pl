#!C:\strawberry\perl\bin\perl.exe

# Set access time of files in command line to five minutes ago; set
# modification time to current system time

use 5.020;
use warnings;

my $now = time;
my $before = time - 5 * 60;
utime $before, $now, @ARGV; # Or loop over files and warn if problem
