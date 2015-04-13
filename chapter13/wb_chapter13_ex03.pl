#!C:\strawberry\perl\bin\perl.exe

# Create report for current directory: files, sizes, whether they are readable,
# writeable and executable, with opendir and a while loop

use 5.020;
use warnings;

opendir my $dh, '.' or die "Can't open '.': $!";
printf "%-30s %10s   R W E\n", "Name", "Size";
say '-' x 49;
while ( my $fname = readdir $dh ) {
    unless ( $fname =~ /\A\.\.?\z/ ) {
        printf "%-30s %10d   %s %s %s\n",
            $fname,
            -s $fname,
            -r $fname ? 'X' : ' ',
            -w $fname ? 'X' : ' ',
            -x $fname ? 'X' : ' ';
    }
}
