#!C:\strawberry\perl\bin\perl.exe

# Take a list of filenames on the CL and use grep to select the ones whose size
# is less than 1000 bytes; use map to transform the strings in this list,
# putting four space characters in front of each and a newline after; print the
# resulting list

use 5.020;
use warnings;

my @fnames = grep -s $_ < 1000, @ARGV;
print map '    ' . $_ . "\n", @fnames;

# or as a one liner:
# print map { "    $_\n" } grep { -s $_ < 1000 } $ARGV;
