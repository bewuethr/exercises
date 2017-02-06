#!C:\strawberry\perl\bin\perl.exe

# Delete entries with false values, then print entries from hash

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
    if ( ! $birthday ) { delete $birthdays{$name} }
}

foreach my $key ( keys %birthdays ) {
    print "$key: $birthdays{$key}\n";
}
