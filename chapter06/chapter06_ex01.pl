#!C:\strawberry\perl\bin\perl.exe

# Ask user for given name and report corresponding family name

use 5.020;
use warnings;

my %names = (
    fred => 'flintstone',
    barney => 'rubble',
    wilma => 'flintstone',
);

print "Enter given names: ";

while (<STDIN>) {
    chomp;
    if (exists $names{$_}) { print "Family name: $names{$_}\n" }
    else { print "Not found in database\n" }
}
