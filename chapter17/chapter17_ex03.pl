#!C:\strawberry\perl\bin\perl.exe

# Modify the previous program to report times using the YYYY-MM-DD format with
# a map and localtime

use 5.020;
use warnings;

foreach my $file ( glob '*' ) {
    my ( $atime, $mtime ) = map {
        my ( $year, $month, $day ) = ( localtime $_ )[5, 4, 3];
        sprintf "%04d-%02d-%02d", $year + 1900, ++$month, $day;
    } ( stat $file )[8, 9];
    
    printf "%-20s %s  %s\n", $file, $atime, $mtime;
}
