#!C:\strawberry\perl\bin\perl.exe

# Print a list of the files in the current directory, sorted in order of
# ascending file size, then descending file size

use 5.020;
use warnings;


my @files = glob "* .*";
# @files = sort { -s $a <=> -s $b } @files;  # uncomment for ascending order
@files = sort { -s $b <=> -s $a } @files;   # uncomment for descending order

foreach (@files) {
    next if m/\A\.{1,2}/;
    printf "%-30s %7d\n", $_, -s if -f;
}

# could be much shorter:
# foreach ( sort { -s $a <=> -s $b } glob "* .*"
