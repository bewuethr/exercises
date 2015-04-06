#!C:\strawberry\perl\bin\perl.exe

# Using the stat function, go through all of the files on the command line and
# list the modification time for each

use 5.020;
use warnings;

foreach my $fname (@ARGV) {
    my @stat_data = stat($fname);
    printf "%-30s %s\n", $fname, localtime $stat_data[9] // "(undefined)";
}
