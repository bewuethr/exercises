#!C:\strawberry\perl\bin\perl.exe

# Enter strings on separate lines, print right-adjusted in 20 character column

use 5.020;
use warnings;

say "Enter a few strings on separate lines:";

chomp(my @list = <STDIN>);

print ((1..9, 0) x 6, "\n");
foreach (@list) {
    printf "%20s\n", $_;
}
