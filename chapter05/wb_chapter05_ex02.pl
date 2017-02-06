#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to read from standard input at the end and preface
# these lines with stdin

use 5.020;
use warnings;

push @ARGV, '-';

while (<>) {
    if ($ARGV eq '-') { print "stdin: $_" }
    else { print "$ARGV: $_" }
}
