#!C:\strawberry\perl\bin\perl.exe

# Modify the program from Exercise 2 to use Regexp::Assemble to have one
# pattern instead of an array.

use 5.020;
use warnings;
use Regexp::Assemble;

open my $fh, '<', 'chapter09_ex02_in.txt'
    or die "Can't open chapter09_ex02_in.txt: $!";

my $ra = Regexp::Assemble->new;

while (<$fh>) {
    chomp;
    $ra->add($_) if eval { my $pattern = qr/$_/ };
}

my $overall = $ra->re;
say "Enter lines of input to be matched with $overall, Ctrl+Z to finish:";
while (<STDIN>) {
    print "$.: $_" if /$overall/;
}
