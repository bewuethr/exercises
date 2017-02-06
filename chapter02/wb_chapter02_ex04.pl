#!C:\strawberry\perl\bin\perl.exe

# Test warning for previous program without using chomp

use warnings;

print "Enter integer: ";
$num = <STDIN>;
if ($num%2 == 0) {
    print "$num is even.\n";
} else {
    print "$num is odd.\n";
}
