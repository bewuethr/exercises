#!C:\strawberry\perl\bin\perl.exe

# Count the number of lines in a Perl program; skip lines that are blank or
# only have a comment

use 5.020;
use warnings;

my $counter = 0;
while (<>) {
    next if /\A\s*(?:#|\z)/;
    $counter++;
}
print "The program has $counter lines.\n";
