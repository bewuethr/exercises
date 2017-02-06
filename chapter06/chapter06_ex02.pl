#!C:\strawberry\perl\bin\perl.exe

# Read words from input, count occurrences per word, print words with count (in
# code point order for bonus points)

use 5.020;
use warnings;

my %names;

print "Enter names on separate lines, end with Ctrl-Z:\n";

while (<STDIN>) {
    chomp;
    ++$names{$_};
}

# Alternatively:
# my @words;
# chomp(@words = <STDIN>);
#
# foreach (@words) { ++$names{$_} }

foreach (sort keys %names) {
    print "$_: $names{$_}\n";
}
