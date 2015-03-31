#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to warn user if name is not in hash

use 5.020;
use warnings;

my %birthdays = (
    Fred    => 'April 5',
    Wilma   => 'October 26',
    Pebbles => 'October 8',
);

print "Enter a name: ";
chomp( my $name = <STDIN> );

if ( exists $birthdays{$name} ) { print "$name => $birthdays{$name}\n"; }
else { print "$name is not in the hash\n" }
