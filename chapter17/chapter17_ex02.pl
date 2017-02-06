#!C:\strawberry\perl\bin\perl.exe

# Make report of access and modification times (in the epoch time) of the files
# in the current directory; use 'stat' to get times

use 5.020;
use warnings;

foreach my $file ( glob '* .*' ) {
    next unless -f $file;   # Or use glob '*' instead
    my( $atime, $mtime ) = ( stat $file )[8, 9];
    printf "%-20s %10d %10d\n", $file, $atime, $mtime;
}
