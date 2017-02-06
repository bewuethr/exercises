#!C:\strawberry\perl\bin\perl.exe

# Rework 12.1 so for each symbolic link, instead of using stat, use lstat

use 5.020;
use warnings;

foreach my $fname (@ARGV) {
    my @stat_data;
    if ( -l $fname ) {
        @stat_data = lstat($fname);
    }
    else {
        @stat_data = stat($fname);
    }   # nicer: my @stat_data = -l $fname ? lstat $fname : stat $fname;
    printf "%-30s %s\n", $fname, localtime $stat_data[9] // "(undefined)";
}
