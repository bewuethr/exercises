#!C:\strawberry\perl\bin\perl.exe

# Chapter 13, exercise 3: make the person say "Hello, World!"

use 5.010;
use strict;
use warnings;
use Person;
use Cow;
use Horse;
use Mouse;
use Sheep;
use Animal;

my @creatures = qw(Person Cow Horse Mouse Sheep);

# Test defaults
say "Defaults:";
foreach my $creature (@creatures) {
    $creature->speak;
}

# Try to make creatures say something, but only the person should actually speak
say "\nTry to make animals speak:";
foreach my $creature (@creatures) {
    $creature->speak("Hello, World");
}

# Try to have abstract classes do something (should die)
say "\nAnd now try to make a generic animal speak:";
Animal->speak('I am an animal');
