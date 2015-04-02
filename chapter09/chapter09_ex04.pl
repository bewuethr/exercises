#!C:\strawberry\perl\bin\perl.exe

# Add copyright line to files in command line arguments, after hash-bang line,
# edit in-place with backup

use 5.020;
use warnings;

$^I = ".bak";

my $cprline = '## Copyright (C) 2015 by Yours Truly';

while (<>) {
    s/(\A#!.*\z)/$1$cprline\n/s;
    print;
}
