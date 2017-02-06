#!C:\strawberry\perl\bin\perl.exe

# Subroutine that greets new person by telling them all persons greeted so far

use warnings;
use 5.020;

sub greet {
    state @persons;
    my ($name) = shift;
    print "Hi $name! ";
    if (!@persons) {
        print "You are the first one here!\n";
    } else {
        print "I've seen: @persons\n";
    }
    push(@persons, $name);
}

greet( "Fred" );
greet( "Barney" );
greet( "Wilma" );
greet( "Betty" );
