#!C:\strawberry\perl\bin\perl.exe

# Parse the output of the 'date' command to determine the day of the week; if
# it is a weekday, print 'get to work', otherwise print 'go play'

use 5.020;
use warnings;
no warnings 'experimental::smartmatch';

my $now = `date`;

given ($now) {
    when ( /\A(?:mon|tue|wed|thu|fri)/i ) { say "get to work" }
    when ( /\A(?:sat|sun)/i )             { say "go play" }
    default                               { say "not a normal date" }
}

# simpler: given (`date`) or if ( `date` =~ /\AS/ )
