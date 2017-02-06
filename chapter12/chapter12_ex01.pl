#!C:\strawberry\perl\bin\perl.exe

# Take list of file names from command line; report for each if it's readable,
# writable, executable or doesn't exist

use 5.020;
use warnings;

foreach my $fname (@ARGV) {
    printf "%-30s: ", $fname;
    print "readable" if -r $fname;
    print " writable" if -w $fname; # or use the special _ filehandle
    print " executable" if -x $fname;
    print "inexisting" unless -e $fname;
    print "\n";
}
