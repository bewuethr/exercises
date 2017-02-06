#!C:\strawberry\perl\bin\perl.exe

# Modify previous program to report if number is odd or even and divisible by
# my "favourite number"

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

my $fav_num = 64;

given (shift) {
    say "Looking at $_";
    when ( ! /\A\d+\z/ )           { say "Please enter a positive integer" }
    when ( $_ % 2 ~~ 0 )           { say "Number is even"; continue }
    when ( $_ % 2 ~~ 1 )           { say "Number is odd"; continue }

    my @divisors = divisors($_);

    when ( $fav_num ~~ @divisors ) { say "Divisible by my fav number"; continue }

    # Could also check if number entered equals $fav_num

    when ( 0 )                     { say "Zero is special" }
    when ( 1 )                     { say "One is special" }

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
