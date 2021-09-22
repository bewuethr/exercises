#!C:\strawberry\perl\bin\perl.exe

# Create birthday report: go through each entry and print those with birthdays
# Use each instead of foreach

use 5.020;
use warnings;

my %birthdays = (
    Fred    => 'April 5',
    Wilma   => 'October 26',
    Pebbles => 'October 8',
    Barney  => undef,
    Dino    => '',
);

while ( my( $name, $birthday ) = each %birthdays ) {
    if ($birthday) {
        print "$name => $birthday\n"
    }
}
