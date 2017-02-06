#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to tell user that you don't know the birthday if the
# key is in the has but doesn't have a value

use 5.020;
use warnings;

my %birthdays = (
    Fred    => 'April 5',
    Wilma   => 'October 26',
    Pebbles => 'October 8',
    Barney  => undef,
    Dino    => '',
);

print "Enter a name: ";
chomp( my $name = <STDIN> );

if ( $birthdays{$name} ) {
    print "$name => $birthdays{$name}\n";
}
elsif ( exists( $birthdays{$name} ) ) {
    print "I don't know the birthday of $name\n";
}
else {
    print "$name is not in the hash\n";
}
