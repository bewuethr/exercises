#!C:\strawberry\perl\bin\perl.exe

# Modify program to print debugging information: the secret number, for
# example. Use the // operator.

use 5.020;
use warnings;

my $verbose = shift @ARGV // 1; # use 0 as command line argument to turn off

my $num = int( 1 + rand 100 );
print "The secret number is $num\n" if $verbose;

print "Guess the secret number between 1 and 100:\n";

while (<>) {
    chomp;
    last if /quit|exit|\A\s*\z/i;
    unless (/\A\d+\z/) {
        print "Please enter an integer number between 1 and 100!\n";
        next;
    }
    if ( $_ == $num ) {
        print "You win!\n";
        last;
    }
    print "Too low\n"  if ( $_ < $num );
    print "Too high\n" if ( $_ > $num );
}
