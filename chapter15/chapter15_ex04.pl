#!C:\strawberry\perl\bin\perl.exe

# Use given and smart matching to report all divisors except 1 and the number
# itself for a number given on the command line. If the number is prime, report
# that. If the argument is NaN, report the error and don't try to compute the
# divisors.

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

given (shift) {
    say "Looking at $_";
    when ( ! /\A\d+\z/ )           { say "Please enter a positive integer" }
    when ( 0 )                     { say "Zero is special" }
    when ( 1 )                     { say "One is special" }

    my @divisors = divisors($_);

    when ( scalar @divisors ~~ 0 ) { say "This is a prime number" }
    default                        { say "Divisors: @divisors" }
}

sub divisors {
    my $number = shift;

    my @divisors = ();
    foreach my $divisor ( 2 .. ( $number / 2 ) ) {
        push @divisors, $divisor unless $number % $divisor;
    }

    return @divisors;
}
