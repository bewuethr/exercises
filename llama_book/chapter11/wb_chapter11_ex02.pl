#!C:\strawberry\perl\bin\perl.exe

# Take list of file paths and break them into filename and path portions;
# report results in two columns

use strict;
use warnings;
use File::Basename;

my ( @basenames, @paths );
my $maxlen = 0;
foreach my $fpath (@ARGV) {
   push @basenames, basename $fpath;
   push @paths, dirname $fpath;
   $maxlen = length( basename $fpath ) if length( basename $fpath ) > $maxlen;
}

$maxlen = length "Base name" if $maxlen < length "Base name";

printf "%-${maxlen}s %s\n", "Base name", "File path";
foreach ( 0..$#basenames ) {
    printf "%-${maxlen}s %s\n", $basenames[$_], $paths[$_];
}
