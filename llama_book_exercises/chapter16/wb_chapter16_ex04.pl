#!C:\strawberry\perl\bin\perl.exe

# Print all of the environment variables in alphabetical order with their
# values

use 5.020;
use warnings;

foreach ( sort keys %ENV ) {
    printf "%-30s: %s\n", $_, $ENV{$_};
}
