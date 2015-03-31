#!C:\strawberry\perl\bin\perl.exe

# Create a hash with names and birthdays, print the contents

use 5.020;
use warnings;

my %birthdays = (
    Fred    => 'April 5',
    Wilma   => 'October 26',
    Pebbles => 'October 8',
);

foreach my $key ( keys %birthdays ) {
    print "$key: $birthdays{$key}\n";
}
