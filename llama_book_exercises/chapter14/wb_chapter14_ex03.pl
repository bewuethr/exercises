#!C:\strawberry\perl\bin\perl.exe

# Take starting column value, ending column and a filename; go through the file
# and print only the portions of each line from the start column to the end
# column; use substr

use 5.020;
use warnings;

die "Usage: wb_chapter14_ex03.pl startcol endcol filename\n" if ( @ARGV != 3 );
my( $start, $end, $fname ) = @ARGV;

open my $fh, '<', $fname or die "Can't open $fname: $!";

while ( my $line = <$fh> ) {
    chomp $line;
    next unless length $line > $start;
    say substr( $line, $start, $end - $start + 1 );
}
