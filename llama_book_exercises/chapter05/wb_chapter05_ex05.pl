#!C:\strawberry\perl\bin\perl.exe

# Take two whole numbers from the command line, then pretty print sum, product,
# percent fraction

use 5.020;
use warnings;

my($n1, $n2) = @ARGV;

printf "%8s" x 5 . "\n", 'first', 'second', 'sum', 'product', '%';

my $ratio;
if ($n2 == 0) {
    $ratio = 0;
} else {
    $ratio = $n1/$n2*100;
}

printf "%8d%8d%8d%8d%8.2f%%\n", $n1, $n2, $n1+$n2, $n1*$n2, $ratio;
