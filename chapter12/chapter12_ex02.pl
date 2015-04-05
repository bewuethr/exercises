#!C:\strawberry\perl\bin\perl.exe

# Identify oldest file named on command line and report age in days

use 5.020;
use warnings;

die "No filenames found\n" unless @ARGV;

my $oldest_fname = shift;
my $oldest_age = -M $oldest_fname;  # actually last modification

foreach my $fname (@ARGV) {
    my $age = -M $fname;
    ( $oldest_age, $oldest_fname ) = ( $age, $fname )
        if ( $age > $oldest_age ); 
}

printf "The oldest file is %s at %.1f days\n", $oldest_fname, $oldest_age;
