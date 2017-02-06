#!C:\strawberry\perl\bin\perl.exe

# More ways to call subroutines

use warnings;
use 5.020;

sub show_args {
    print "The arguments are [@_]\n";
}

sub show_args_again {
    print "The arguments are [@_]\n";
    print "With \&: ";
    &show_args;
    print "Without \&: ";
    show_args;
    print "With \& and trailing (): ";
    &show_args();
    print "Without \& and trailing (): ";
    show_args();
}

show_args_again( 'fred', 'barney', 'betty');
