#!C:\strawberry\perl\bin\perl.exe

# Change the solution to 12.1 such that for a symbolic link, instead of
# printing /, it prints the link target. Use readlink.

use 5.020;
use warnings;

foreach my $fname (@ARGV) {
    print $fname;
    if ( -d $fname ) {}
    elsif ( -x $fname ) { print '*' }
    elsif ( -l $fname ) { print " -> ", readlink $fname }   # could check for definedness
    print "\n";
}
