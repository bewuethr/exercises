#!C:\strawberry\perl\bin\perl.exe

# Modify the given string so that the names at the beginning of each line have
# an initial capital letter and the rest in lowercase letters

use 5.020;
use warnings;

my $string = "fRED has score 230\nbarney has score 190\nDINO has score 30";

say foreach ( map s/\A(\S+)/\u\L$1/r, ( split "\n", $string ) );

# Alternative:
# $string =~ s/^(\S+)/\u\L$1/mg;
# say $string;

