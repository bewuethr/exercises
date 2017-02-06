#!C:\strawberry\perl\bin\perl.exe

# Read lines of input and count the number of lines with 'e' in them; use the
# program from exercise 4 as input

use 5.020;
use warnings;

open my $input, 'perl wb_chapter16_ex04.pl |';

my $count = 0;

while ( <$input> ) {
    $count++ if /e/;
}

say "Number of lines with 'e' in them: $count";
