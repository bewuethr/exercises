#!C:\strawberry\perl\bin\perl.exe

# Write a program to read a list of patterns from a file; precompile and store
# them in an array. Prompt the user for input, printing the line and text for
# each line that matches.

use 5.020;
use warnings;

open my $fh, '<', 'chapter09_ex02_in.txt'
    or die "Can't open chapter09_ex02_in.txt: $!";

my @patterns;

while (<$fh>) {
    chomp;
    my $pattern = eval { qr/$_/ };  # could add warning with or do { warn; next }
    push @patterns, $pattern if defined $pattern;
}

say "Enter lines of input to be matched, Ctrl+Z to finish:";
while (<STDIN>) {
    print "$.: $_" if $_ ~~ @patterns;
}

# Instead of smartmatch:
# foreach my $pattern (@patterns) {
#     print "Match at line $. | $_" if /$pattern/;
# }
#
# or stop after first match with a label and next.

