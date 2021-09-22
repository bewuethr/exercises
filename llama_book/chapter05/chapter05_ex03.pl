#!C:\strawberry\perl\bin\perl.exe

# Modify prevoius program to let user choose column width

use 5.020;
use warnings;

print "Enter columns width: ";
chomp(my $width = <STDIN>);

say "Enter a few strings on separate lines:";
chomp(my @list = <STDIN>);

print ((1..9, 0) x (($width+9)/10), "\n");
foreach (@list) {
    printf "%${width}s\n", $_;
}
