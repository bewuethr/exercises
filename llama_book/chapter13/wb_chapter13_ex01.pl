#!C:\strawberry\perl\bin\perl.exe

# Report number of iles in current directory; don't count . or .., but count
# hidden files

use 5.020;
use warnings;

my $count = 0;
foreach my $file ( glob '* .*' ) {
    $count++ unless $file eq '.' or $file eq '..';
}
say "Number of files is $count";


# Or in one line:
# printf "Number of files is %d\n", ( my @files = glob '* .*' ) - 2;
