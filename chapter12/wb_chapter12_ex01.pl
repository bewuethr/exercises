#!C:\strawberry\perl\bin\perl.exe

# Go through all files on the command line and list them in the output; add a /
# after directories, a * after executables and a @ after symbolic links.

use 5.020;
use warnings;

foreach my $fname (@ARGV) {
    print $fname;
    if ( -d $fname ) { print '/' }
    elsif ( -x $fname ) { print '*' }
    elsif ( -l $fname ) { print '@' }
    print "\n";
}
