#!C:\strawberry\perl\bin\perl.exe

# Use a for loop to report a table of square and cubes for the multiples of 3
# between 3 and 99

use 5.020;
use warnings;

for ( my $i = 3; $i <= 99; $i += 3 ) {
    print "$i\t", $i**2, "\t", $i**3, "\n";
}
