#!C:\strawberry\perl\bin\perl.exe

# Test warning for non-numerical input for number

use warnings;

print "Enter integer: ";
chomp($num = <STDIN>);
if ($num%2 == 0) {
    print "$num is even.\n";
} else {
    print "$num is odd.\n";
}
