#!C:\strawberry\perl\bin\perl.exe

# Print list of files in current directory, sorted in order of last
# modification time (most recently modified first)

use 5.020;
use warnings;


my @files = sort { -M $a <=> -M $b } glob "* .*";

foreach (@files) {
    next if m/\A\.{1,2}/;
    printf "%-30s %7.2f days\n", $_, -M if -f;
}
