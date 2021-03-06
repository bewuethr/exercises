#!C:\strawberry\perl\bin\perl.exe

# Write a script that uses MyDate.pm and prints values for day, month and year.

use strict;
use warnings;
use MyDate;
use feature 'say';

my $date1 = MyDate->new;
say "Default initialized date:";
printf "%s %d, %d\n", $date1->month, $date1->day, $date1->year;

my $date2 = MyDate->new(24, 'June', 2015);
say "\nDate initialized with values:";
printf "%s %d, %d\n", $date2->month, $date2->day, $date2->year;

# Test non-existing getter
say '';
my $nope = $date1->weekday;

# Exercise 2: add UNIVERSAL::debug function that prints a timestamp before the
# message you pass to it, call it on the MyDate object.

sub UNIVERSAL::debug {
    my $self = shift;
    my $message = shift;
    my $timestamp = localtime;
    say "$timestamp $message";
}

say '';
$date1->debug('Test');
