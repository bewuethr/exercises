#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to use glob and a while loop

use 5.020;
use warnings;

printf "%-30s %10s   R W E\n", "Name", "Size";
say '-' x 49;
while ( my $fname = glob ".* *" ) {
    unless ( $fname =~ /\A\.{1,2}\z/ ) {
        printf "%-30s %10d   %s %s %s\n",
            $fname,
            -s $fname,
            -r $fname ? 'X' : ' ',
            -w $fname ? 'X' : ' ',
            -x $fname ? 'X' : ' ';
    }
}
