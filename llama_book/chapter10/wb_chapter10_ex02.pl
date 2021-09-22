#!C:\strawberry\perl\bin\perl.exe

# Count lines until line contains "perl", then stop and report line number

use 5.020;
use warnings;

my $counter = 0;

while (<>) {
    $counter++;
    last if /perl/;
}
print "perl was found in line $counter\n";
