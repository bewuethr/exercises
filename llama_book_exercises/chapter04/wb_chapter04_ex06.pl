#!C:\strawberry\perl\bin\perl.exe

# Subroutine that takes list of strings and prints them comma separated, with
# an "and" before the last item if there are more than three

use warnings;
use 5.020;

sub print_list {
    print "The argument list is: ";
    if (@_ <= 2) {
        local $" = ' and ';
        return "@_\n";
    } else {
        local $" = ', ';
        my @front = splice @_, 0, $#_;
        return "@front, and @_\n";
    }
}

print &print_list('one');
print &print_list( qw( one two ) );
print &print_list( qw( one two three four five ) );
