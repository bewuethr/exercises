#!C:\strawberry\perl\bin\perl.exe

# Subroutine that greets new person by telling them the last person greeted

use warnings;
use 5.020;

sub greet {
    my ($name) = @_;
    state $last_person = "";
    print "Hi $name! ";
    if ($last_person eq "") {
        print "You are the first one here!\n";
    } else {
        print "$last_person is also here!\n";
    }
    $last_person = $name;
}

greet( "Fred" );
greet( "Barney" );
greet( "Wilma" );
greet( "Betty" );
