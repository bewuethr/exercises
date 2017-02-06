#!C:\strawberry\perl\bin\perl.exe

# Create birthday report: go through each entry and print those with birthdays

use 5.020;
use warnings;

my %birthdays = (
    Fred    => 'April 5',
    Wilma   => 'October 26',
    Pebbles => 'October 8',
    Barney  => undef,
    Dino    => '',
);

foreach my $name ( keys %birthdays ) {
    if ( $birthdays{$name} ) { print "$name => $birthdays{$name}\n" }
}
