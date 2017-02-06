#!C:\strawberry\perl\bin\perl.exe

# Prompt for three strings and a regex; apply to all strings and report if it
# matches

use 5.020;
use warnings;

my @strings = qw( first second third );
my @lines;
foreach (@strings) {
    print "Enter $_ string: ";
    push @lines, ( my $string = <STDIN> );
}
chomp @lines;

print "Now enter a regular expression:\n";
chomp ( my $regex = <STDIN> );

foreach ( 0..$#lines ) {
    if ( $lines[$_] =~ /($regex)/ ) {
        print "\u$strings[$_] matched: |$`<$&>$'|\n";
    }
    else {
        print "\u$strings[$_] didn't match: |$lines[$_]|\n";
    }
}
