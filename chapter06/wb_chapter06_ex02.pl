#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to prompt user for a name, the print corresponding
# birthday

use 5.020;
use warnings;

my %birthdays = (
    Fred    => 'April 5',
    Wilma   => 'October 26',
    Pebbles => 'October 8',
);

print "Enter a name: ";
chomp( my $name = <STDIN> );

print "$name => $birthdays{$name}\n";
