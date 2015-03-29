#!C:\strawberry\perl\bin\perl.exe

# Make show_args print the arguments in reverse order

use warnings;
use 5.020;

sub show_args {
    print "The arguments are [@_]\n";
}

sub show_args_again {
    print "The arguments are [@_]\n";
    show_args(reverse @_);
}

show_args_again( 'fred', 'barney', 'betty');
