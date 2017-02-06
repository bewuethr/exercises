#!C:\strawberry\perl\bin\perl.exe
use warnings;

# Read list of strings, report second to last one

print "Enter a few strings:\n";
chomp( @strings = <STDIN> );
print "The second to last string is @strings[-2].\n";
