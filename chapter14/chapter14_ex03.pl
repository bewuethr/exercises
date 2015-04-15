#!C:\strawberry\perl\bin\perl.exe

# Look through a given string for each occurrence of a given substring,
# printing out the positions where the substring is found.

use 5.020;
use warnings;

print "Enter a string: ";
chomp( my $string = <STDIN> );
print "Enter a substring: ";
chomp( my $substring = <STDIN> );

my @indices;
push @indices, index( $string, $substring );

while ( ( my $index = index( $string, $substring, $indices[-1]+1 ) ) != -1 ) {
    push @indices, $index;
}

say "Substring at indices " . join ", ", @indices;
