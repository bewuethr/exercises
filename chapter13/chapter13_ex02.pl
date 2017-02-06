#!C:\strawberry\perl\bin\perl.exe

# Ask user for barnyard animals; create barnyard with those animals; have each
# animal speak once.

use 5.010;
use strict;
use warnings;
use Cow;
use Horse;
use Sheep;
use Mouse;

say "Enter animals, finish with empty line";

my @barnyard;
while (my $animal = <>) {
    chomp $animal;
    last if $animal eq '';
    push @barnyard, $animal if $animal =~ /Cow|Horse|Sheep|Mouse/;
}

foreach my $animal (@barnyard) {
    $animal->speak;
}
