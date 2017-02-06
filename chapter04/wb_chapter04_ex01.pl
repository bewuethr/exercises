#!C:\strawberry\perl\bin\perl.exe

# Subroutine that prints its arguments

use warnings;
use 5.020;

sub show_args {
    print "The arguments are @_\n";
}

show_args( 'fred', 'barney', 'betty');
