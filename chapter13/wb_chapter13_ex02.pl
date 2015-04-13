#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to also report sum of all files sizes

use 5.020;
use warnings;

my ( $count, $size_total ) = ( 0, 0 );
foreach my $file ( glob '* .*' ) {
    unless ( -d $file ) {
        $count++;
        $size_total += -s $file;
    }
}
say "Number of files is $count, total size is $size_total";
