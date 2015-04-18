#!C:\strawberry\perl\bin\perl.exe

# Prompt for two lists of words on a line each (use 'split'); report whether
# they are the same or not

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

say "Enter the first list on a single line:";
chomp( my $line1 = <STDIN> );   # chomp not really necessary, split removes \n
say "Enter the second list on a single line:";
chomp( my $line2 = <STDIN> );

my @array1 = split ' ', $line1;
my @array2 = split ' ', $line2;

if ( @array1 ~~ @array2 ) {
    say "The lists are the same";
}
else {
    say "The lists are not the same";
}
