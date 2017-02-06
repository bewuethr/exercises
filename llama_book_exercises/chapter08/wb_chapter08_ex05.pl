#!C:\strawberry\perl\bin\perl.exe

# Tell difference between scalar, array and hash variables and report findings

use 5.020;
use warnings;

my %names = (
    '$' => 'a scalar',
    '@' => 'an array',
    '%' => 'a hash',
);

while (<>) {    # take one input line at a time
    chomp;
    if (/
        ([\$\@%])   # match begins with $, @ or %
        [a-zA-Z_]   # first character of identifier must be letter or underscore
        \w*         # can be followed by zero or more characters
        \b          # match until end of identifier
    /x) {
        print "Matched: |$`<$&>$'| ($names{$1})\n";
    }
    else {
        print "Contains no variable name: |$_|\n";
    }
}
