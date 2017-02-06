#!C:\strawberry\perl\bin\perl.exe

# Modify the previous program to take several names, one per line; report
# success if at least one of the names is a key in a hash you defined.

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

my %hash = qw(
    Fred        Flintstone
    Wilma       Flintstone
    Barney      Rubble
    Betty       Rubble
    Larry       Slate
    Pebbles     Flintstone
    Bamm-Bamm   Rubble
);

printf "The keys are [%s]\n", join ' ', keys %hash;
say "Enter some names:";
my @names;
while ( my $name = <STDIN> ) {  # chomp( my @names = <STDIN> );
    chomp $name;
    push @names, $name;
}

if ( @names ~~ %hash ) {
    say "I found a matching name";
}
else {
    say "I didnt' find a matching name";
}
